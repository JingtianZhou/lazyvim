return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

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

      --Color
      vim.fn.sign_define("DapBreakpoint", {
        text = "🔴",
        texthl = "DapBreakpoint",
      })
      vim.fn.sign_define("DapStopped", {
        text = "👉",
        texthl = "DapStopped",
        linehl = "DapStoppedLine",
        numhl = "DapStoppedLine",
      })
      vim.api.nvim_set_hl(0, "DapBreakpoint", {
        fg = "#ff5555",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "DapStopped", {
        fg = "#50fa7b",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "DapStoppedLine", {
        bg = "#2a2a2a",
      })

      -- C++ debugger config
      dap.adapters.codelldb = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Debug CompressibleFlowSolver",
          type = "codelldb",
          request = "launch",

          -- 🔴 executable (not command line string)
          program = "/Users/zhoujingtian/gitlab/nektar_ale/debug/dist/bin/CompressibleFlowSolver-g",
          cwd = "/Users/zhoujingtian/Downloads/ALE",

          -- 🔴 THIS is your CLI:
          args = {
            "/Users/zhoujingtian/Downloads/ALE/h-adapt2.xml",
            "/Users/zhoujingtian/Downloads/ALE/session.xml",
            "-v",
          },
          env = {
            DYLD_LIBRARY_PATH = "/usr/local/lib",
          },

          stopOnEntry = false,
        },
      }

      -- C shares config
      dap.configurations.c = dap.configurations.cpp
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "codelldb" },
      automatic_installation = true,
    },
  },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
}
