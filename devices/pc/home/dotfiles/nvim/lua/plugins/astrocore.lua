
-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec


return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {

    -- Each line number is the actual line number in the file
    options = {
      opt = {
          number = true,
          relativenumber = false,
        },
      },
    
    -- Disables python and node repl terminals
    mappings = {
      n = {
        ["<Leader>tp"] = false,
        ["<Leader>tn"] = false,
        ["<Leader>tt"] = false,

      }
    },
      
    -- Disables macro recording with q
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
