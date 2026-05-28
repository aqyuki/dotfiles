#!/usr/bin/env bash
set -euo pipefail

#========== Constant ==========#
DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CONFIG_SRC="$DOTFILES_ROOT/config"
CONFIG_DST="${XDG_CONFIG_HOME:-$HOME/.config}"

BACKUP_NAME="$(date '+%Y-%m-%d-%H-%M').bak"
BACKUP_DIR="$HOME/dotfiles-back"
BACKUP_TMP="$(mktemp -d)"
trap 'rm -rf "$BACKUP_TMP"' EXIT

#========== Variables ==========#
TARGET_LIST=()
EXIST_LIST=()

#========== Flags ==========#
DRY_RUN=0
DEBUG=0
NO_BACKUP=0
FORCE=0
YES=0

#========== Utils ==========#
dry_run() {
  echo "[DRY] $1"
}

d_log() {
  if [ "$DEBUG" -eq 0 ]; then
    return
  fi

  printf "[DEBUG] %s\n" "$1"
}

i_log() {
  printf "[INFO] %s\n" "$1"
}

w_log() {
  printf "[WARN] %s\n" "$1"
}

confirm() {
  if [ "$DRY_RUN" -eq 1 ]; then
    return
  fi

  if [ "$YES" -eq 1 ]; then
    return
  fi

  printf "Continue? (backup: %s, force: %s) [y/N]: " "$([ "$NO_BACKUP" -eq 1 ] && echo off || echo on)" "$([ "$FORCE" -eq 1 ] && echo on || echo off)"
  read -r answer

  case "$answer" in
  y | Y | yes | YES)
    ;;
  *)
    i_log "Canceled"
    exit 0
    ;;
  esac
}

should_skip_symlink() {
  local target="$1"
  local dst="$CONFIG_DST/$target"

  if [ ! -e "$dst" ] && [ ! -L "$dst" ]; then
    return 1
  fi

  if [ "$FORCE" -eq 1 ]; then
    return 1
  fi

  if [ "$NO_BACKUP" -eq 0 ]; then
    return 1
  fi

  return 0
}

#========== Functions ==========#
parse_args() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
    -n | --dry-run)
      DRY_RUN=1
      ;;
    --no-dry-run)
      DRY_RUN=0
      ;;
    -d | --debug)
      DEBUG=1
      ;;
    --no-debug)
      DEBUG=0
      ;;
    -f | --force)
      FORCE=1
      ;;
    --no-force)
      FORCE=0
      ;;
    --no-backup)
      NO_BACKUP=1
      ;;
    --backup)
      NO_BACKUP=0
      ;;
    -y | --yes)
      YES=1
      ;;
    -h | --help)
      help
      exit 0
      ;;
    *)
      printf "[ERROR] Unknown option: %s\n" "$1" >&2
      help
      exit 1
      ;;
    esac
    shift
  done
}

create_target_list() {
  for path in "$CONFIG_SRC"/*; do
    [ -e "$path" ] || continue

    d_log "Find $path"
    TARGET_LIST+=("$(basename "$path")")
  done

  i_log "detected targets -> ${TARGET_LIST[*]}"
}

check_exist() {
  for target in "${TARGET_LIST[@]}"; do
    local dst="$CONFIG_DST/$target"

    if [ -e "$dst" ] || [ -L "$dst" ]; then
      w_log "$dst is already exist"
      EXIST_LIST+=("$target")
    fi
  done
}

backup() {
  if [ "$NO_BACKUP" -eq 1 ]; then
    i_log "Backup skipped"
    return
  fi

  if [ "${#EXIST_LIST[@]}" -eq 0 ]; then
    i_log "No backup target"
    return
  fi

  if [ "$DRY_RUN" -eq 1 ]; then
    dry_run "mkdir -p $BACKUP_DIR"
    dry_run "mkdir -p $BACKUP_TMP/$BACKUP_NAME"
  else
    mkdir -p "$BACKUP_DIR"
    mkdir -p "$BACKUP_TMP/$BACKUP_NAME"
  fi

  for exist in "${EXIST_LIST[@]}"; do
    local src="$CONFIG_DST/$exist"
    local dst="$BACKUP_TMP/$BACKUP_NAME/$exist"

    if [ "$DRY_RUN" -eq 1 ]; then
      dry_run "mv $src $dst"
    else
      d_log "execute 'mv $src $dst'"
      mv "$src" "$dst"
    fi
  done

  # create tar.gz
  if [ "$DRY_RUN" -eq 1 ]; then
    dry_run "tar -czf $BACKUP_DIR/$BACKUP_NAME.tar.gz -C $BACKUP_TMP $BACKUP_NAME"
    dry_run "Backup created at $BACKUP_DIR/$BACKUP_NAME.tar.gz"
  else
    tar -czf "$BACKUP_DIR/$BACKUP_NAME.tar.gz" -C "$BACKUP_TMP" "$BACKUP_NAME"
    i_log "Backup created at $BACKUP_DIR/$BACKUP_NAME.tar.gz"
  fi
}

create_symlink() {
  if [ "$DRY_RUN" -eq 1 ]; then
    dry_run "mkdir -p $CONFIG_DST"
  else
    mkdir -p "$CONFIG_DST"
  fi

  local ln_opts=(-s)

  if [ "$FORCE" -eq 1 ]; then
    ln_opts=(-s -f -n)
  fi

  for target in "${TARGET_LIST[@]}"; do
    local src="$CONFIG_SRC/$target"
    local dst="$CONFIG_DST/$target"

    if should_skip_symlink "$target"; then
      w_log "Skip $dst because it already exists"
      continue
    fi

    if [ "$DRY_RUN" -eq 1 ]; then
      dry_run "ln ${ln_opts[*]} $src $dst"
    else
      d_log "execute 'ln ${ln_opts[*]} $src $dst'"
      ln "${ln_opts[@]}" "$src" "$dst"
      i_log "Linked $dst -> $src"
    fi
  done
}

#========== Commands ==========#
help() {
  cat <<EOF
Usage:
  $(basename "$0") [options]

Description:
  Create symbolic links for dotfiles managed under config/
  into \$XDG_CONFIG_HOME or \$HOME/.config.

Options:
  -n, --dry-run
      Print commands without executing them.

      Default: disabled

  -d, --debug
      Enable debug logging.

      Default: disabled

  -f, --force
      Overwrite existing symbolic links/files.

      Default: disabled

  --no-backup
      Skip backup creation before replacing existing files.

      Default: backup enabled

  -y, --yes
      Skip confirmation prompt.

      Default: disabled

  -h, --help
      Show this help message and exit.

Behavior:
  1. Detect targets under config/
  2. Check existing files/directories
  3. Backup existing files into:
       $BACKUP_DIR/<timestamp>.tar.gz
  4. Create symbolic links

Examples:
  Dry run with debug output:
    $(basename "$0") --dry-run --debug

  Force overwrite existing files:
    $(basename "$0") --force

  Skip backup:
    $(basename "$0") --no-backup
EOF
}

link() {
  create_target_list
  check_exist
  confirm
  backup
  create_symlink
}

#========== Entry point ==========#
_main() {
  parse_args "$@"
  link
}
_main "$@"
