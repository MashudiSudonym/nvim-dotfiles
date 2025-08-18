-- lua/plugins/comment-cleaner.lua
return {
  -- ini plugin dummy supaya LazyVim mau load
  {
    "nvim-lua/plenary.nvim", -- dependency ringan
    config = function()
      -- Helper function untuk bersihin komentar sesuai filetype
      local function clean_comments()
        local ft = vim.bo.filetype
        if ft == "python" or ft == "yaml" or ft == "yml" then
          -- # style
          vim.cmd([[%g/^\s*#/d]])
          vim.cmd([[%s/\s#\s.*$//e]])
        elseif ft == "javascript" or ft == "typescript" or ft == "dart" or ft == "java" or ft == "c" or ft == "cpp" then
          -- // style
          vim.cmd([[%g/^\s*\/\//d]])
          vim.cmd([[%s/\s\/\/\s.*$//e]])
          -- Block /* ... */
          vim.cmd([[%g/\/\*\_.\{-}\*\//d]])
        elseif ft == "html" or ft == "xml" or ft == "vue" then
          -- <!-- --> style
          vim.cmd([[%g/<!--\_.\{-}-->/d]])
        else
          vim.notify("No cleaner defined for filetype: " .. ft, vim.log.levels.WARN)
        end
      end

      -- Keymap global
      vim.keymap.set("n", "<leader>cx", clean_comments, { desc = "Clean comments (auto-detect by filetype)" })
    end,
  },
}
