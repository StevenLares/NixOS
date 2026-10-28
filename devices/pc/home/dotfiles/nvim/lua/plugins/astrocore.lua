
-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec

--TODO: disable Python terminal button
--TODO: disable nodejs terminal button
--TODO: disable macro recording altogether
--TODO: Most likely not here, but change line numbering

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {

    -- Disables macro recording with q, and moves it to Leader key
    autocmds = {
      smart_q = {
        {
          event = "VimEnter",
          desc = "Disable macro recording on 'q'.",
          callback = function()
            
            -- When q is pressed in normal more:
            vim.keymap.set("n", "q", function()

              -- disable starting a macro
              vim.notify("Macro recording is disabled in this config. ", vim.log.levels.WARN, { title = "Macro" })
              return ""
            end, { expr = true, noremap = true, silent = true })

          end,
        },
      },


      -- autocmd group, that adds the ability to switch to normal mode in terminal:
      terminal_keymaps = {
        {
          event = "TermOpen",
          pattern = "term://*",
          desc = "Custom terminal keymaps",
          callback = function()
            local opts = { buffer = 0 }
            -- Use Ctrl-x to leave terminal mode safely
            vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], opts)
          end,
        },
      },
    },
  },

}
