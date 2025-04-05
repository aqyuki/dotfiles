-- Utility functions
local if_nil = vim.F.if_nil

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 3,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}
	if keybind then
		keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

-- Compoments

local banner = {
	[[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
	[[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
	[[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
	[[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
	[[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
	[[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
}

local header = {
	type = "text",
	val = banner,
	opts = {
		position = "center",
		hl = "Type",
	},
}

local buttons = {
	type = "group",
	val = {
		button("e", "  New File", "<cmd>enew<CR>"),
		button("f", "󰍉  Find File", "<cmd>FzfLua files<CR>"),
		button("h", "  Recently Opened Files", "<cmd>FzfLua oldfiles<CR>"),
		button("g", "󰊄  Find word", "<cmd>FzfLua live_grep<CR>"),
	},
	opts = { spacing = 1 },
}

return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"ibhagwan/fzf-lua",
	},
	event = "VimEnter",
	opts = {
		layout = {
			{ type = "padding", val = 5 },
			header,
			{ type = "padding", val = 2 },
			buttons,
		},
		opts = { margin = 5 },
	},
}
