return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      dap_python.setup("python")
      dapui.setup()

      -- Auto-load project-local config
      vim.api.nvim_create_autocmd("DirChanged", {
        callback = function()
          local config_path = vim.fn.getcwd() .. "/.nvim-dap.lua"
          if vim.fn.filereadable(config_path) == 1 then
            dofile(config_path)
          end
        end,
      })

      -- Load on startup too
      local config_path = vim.fn.getcwd() .. "/.nvim-dap.lua"
      if vim.fn.filereadable(config_path) == 1 then
        dofile(config_path)
      end

      -- Auto open/close UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Keymaps
      vim.keymap.set("n", "<F5>", dap.continue, {})
      vim.keymap.set("n", "<F10>", dap.step_over, {})
      vim.keymap.set("n", "<F11>", dap.step_into, {})
      vim.keymap.set("n", "<F12>", dap.step_out, {})
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, {})
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, {})
      vim.keymap.set("n", "<leader>dr", dap.repl.open, {})
      vim.keymap.set("n", "<leader>du", dapui.toggle, {})
      vim.keymap.set("n", "<leader>dc", function()
        dap.run(dap.configurations.python)
      end, {})  -- choose config
    end,
  },
}
