-- REMOVE THIS LINE TO ACTIVATE THIS FILE
-- if true then return {} end 

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
          desc = "Disable macro recording on 'q', allow stopping existing macros, allow closing popups",
          callback = function()
            -- When q is pressed in normal more:
            vim.keymap.set("n", "q", function()
              local buftype = vim.bo.buftype
              local filetype = vim.bo.filetype
              local recording = vim.fn.reg_recording() -- currently recording register

              if recording ~= "" then
                -- already recording: allow 'q' to stop
                return "q"
              end

              -- allow 'q' to close floating/special buffers
              if buftype == "prompt" or buftype == "help" or buftype == "quickfix" then
                return "q"
              elseif filetype == "TelescopePrompt" or filetype == "lazy" then
                return "q"
              end

              -- otherwise, disable starting a macro
              vim.notify("Macro recording disabled. I don't like it :)", vim.log.levels.WARN, { title = "Macro" })
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
