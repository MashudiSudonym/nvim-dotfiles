return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#000000',
				base01 = '#000000',
				base02 = '#a5988c',
				base03 = '#a5988c',
				base04 = '#ffeee0',
				base05 = '#fff8f2',
				base06 = '#fff8f2',
				base07 = '#fff8f2',
				base08 = '#ff4a3f',
				base09 = '#ff4a3f',
				base0A = '#ff8e26',
				base0B = '#6aff4c',
				base0C = '#ffc38c',
				base0D = '#ff8e26',
				base0E = '#ffa24c',
				base0F = '#ffa24c',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#a5988c',
				fg = '#fff8f2',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#ff8e26',
				fg = '#000000',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#a5988c' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffc38c', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#ffa24c',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#ff8e26',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#ff8e26',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#ffc38c',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#6aff4c',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#ffeee0' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#ffeee0' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#a5988c',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
