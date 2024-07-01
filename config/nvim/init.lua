-- option
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.fixendofline = true
vim.opt.endofline = true
vim.g.editorconfig = true

-- keymap

-- nvim
vim.g.mapleader = ' '
vim.keymap.set('i', 'jj', '<ESC>')

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    spec = {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        opts = {
        style = 'warm',
      },
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
        options = {
          theme = 'onedark',
        },
      },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"},
        config = function()
        require('mason').setup({})
        require('mason-lspconfig').setup_handlers({function(server)
          local opt = {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            on_attach = function(client, bufnr)
              if client.supports_method "textDocument/documentHighlight" then
                local lsp_document_highlight = vim.api.nvim_create_augroup("lsp_document_highlight", {})
                vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
                  group = lsp_document_highlight,
                  buffer = bufnr,
                  callback = function ()
                    vim.lsp.buf.document_highlight()
                  end
                })
                vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"},{
                  group = lsp_document_highlight,
                  buffer = bufnr,
                  callback = function ()
                    vim.lsp.buf.clear_references()
                  end,
                })
              end
            end,
          }
          require('lspconfig')[server].setup(opt)
        end,
        })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {"hrsh7th/cmp-nvim-lsp","hrsh7th/cmp-path","hrsh7th/cmp-buffer","hrsh7th/cmp-cmdline"},
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                mapping = {
                    ["<C-[>"] = cmp.mapping.select_prev_item(),
                    ["<C-]>"] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm {
                        select = true
                    }
                },
                sources = {{
                    name = 'nvim_lsp'
                },{"buffer"},{"path"}},
                experimental = {
                    ghost_text = true
                }
            })
        cmp.setup.cmdline('/',{
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer'}
          }
        })
        cmp.setup.cmdline(':',{
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' },
            { name = 'cmdline' },
          }
        })
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            local opts = {
                ensure_installed = {'go'},
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                }
            }
            require('nvim-treesitter.configs').setup(opts)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = {
                    text = '┃'
                },
                change = {
                    text = '┃'
                },
                delete = {
                    text = '_'
                },
                topdelete = {
                    text = '‾'
                },
                changedelete = {
                    text = '~'
                },
                untracked = {
                    text = '┆'
                }
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                follow_files = true
            },
            auto_attach = true,
            attach_to_untracked = false,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            }
        }
    },
    {
        'ibhagwan/fzf-lua',
        dependencies = {"kyazdani42/nvim-web-devicons"},
        opts = {
            winopts = {
                height = 0.85,
                width = 0.80,
                row = 0.35,
                col = 0.50,
                border = 'rounded',
                fullscreen = false
            }
        }
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
        animation = true,
      },
        version = '^1.0.0'
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            vim.opt.termguicolors = true
            require("nvim-tree").setup({
                actions = {
                    open_file = {
                        quit_on_open = true
                    }
                }
            })
        end
    },
    {
      "Wansmer/treesj",
      keys = { '<leader>m' },
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      config = function ()
        require('treesj').setup({})
      end,
    },
    {
      "github/copilot.vim",
      lazy = false,
    },
  },
    -- automatically check for plugin updates
    checker = {
        enabled = false
    }
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                local params = vim.lsp.util.make_range_params()
                params.context = {
                    only = {"source.organizeImports"}
                }
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
                for cid, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                        if r.edit then
                            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                            vim.lsp.util.apply_workspace_edit(r.edit, enc)
                        end
                    end
                end
                vim.lsp.buf.format({
                    async = false
                })
            end
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = {"*.rs", "*.py", "*.ts"},
            callback = function()
                vim.lsp.buf.format({
                    buffer = ev.buf,
                    filter = function(f_client)
                        return f_client.name ~= "null-ls"
                    end,
                    async = false
                })
            end
        })
    end
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.fn.getline('$') ~= '' then
      vim.api.nvim_buf_set_lines(0, -1, -1, false, {''})
    end
  end
})

vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true
})

vim.cmd [[
set updatetime=400
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
]]

vim.keymap.set('n', '<leader>p', "<cmd>lua require('fzf-lua').files()<CR>")
vim.keymap.set('n', '<leader>/', "<cmd>lua require('fzf-lua').blines()<CR>")
vim.keymap.set('n', '<leader>r', "<cmd>lua require('fzf-lua').lsp_references()<CR>")
vim.keymap.set('n', '<leader>d', "<cmd>lua require('fzf-lua').lsp_definitions()<CR>")
vim.keymap.set('n', '<leader>D', "<cmd>lua require('fzf-lua').lsp_declarations()<CR>")
vim.keymap.set('n', '<leader>i', "<cmd>lua require('fzf-lua').lsp_implementations()<CR>")
vim.keymap.set('n', '<leader>s', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>")
vim.keymap.set('n', '<leader>t', "<cmd>lua require('fzf-lua').lsp_typedefs()<CR>")
vim.keymap.set('n', '<leader>l', "<cmd>lua require('fzf-lua').diagnostics_document()<CR>")

vim.keymap.set('n', '<C-j>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<C-k>', '<Cmd>BufferNext<CR>')
vim.keymap.set('n', '<leader>w', '<Cmd>BufferClose<CR>')

-- filer
vim.keymap.set('n', '<C-b>', '<Cmd>NvimTreeToggle .<CR>')

