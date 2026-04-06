local icons = require("icons")

require("fzf-lua").setup({
  fzf_opts = {
    ["--info"] = "default",
    ["--layout"] = "reverse-list",
  },
  grep = {
    -- Search in hidden files by default
    hidden = true,
    header_prefix = icons.misc.search .. " ",
    rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g "!.git" -e',
    rg_glob_fn = function(query, opts)
      local regex, flags = query:match(string.format("^(.*)%s(.*)$", opts.glob_separator))
      -- Return the original query if there's no separator
      return (regex or query), flags
    end,
  },
  lsp = {
    symbols = {
      symbol_icons = icons.symbol_kinds,
    },
    code_actions = {
      winopts = {
        width = 70,
        height = 20,
        relative = "cursor",
        preview = {
          hidden = true,
          vertical = "down:50%",
        },
      },
    },
  },
  diagnostics = {
    -- Remove the dashed line between diagnostic items
    multiline = 1,
    diag_icons = {
      icons.diagnostics.ERROR,
      icons.diagnostics.WARN,
      icons.diagnostics.INFO,
      icons.diagnostics.HINT,
    },
    actions = {
      ["ctrl-e"] = {
        fn = function(_, opts)
          -- If not filtering by severity, show all diagnostics
          if opts.severity_only then
            opts.severity_only = nil
          else
            -- Else only show errors
            opts.severity_only = vim.diagnostic.severity.ERROR
          end
          require("fzf-lua").resume(opts)
        end,
        noclose = true,
        desc = "toggle-all-only-errors",
        header = function(opts)
          return opts.severity_only and "show all" or "show only errors"
        end,
      },
    },
  },
  oldfiles = {
    include_current_session = true,
    winopts = {
      preview = { hidden = true },
    },
  },
})

---@diagnostic disable-next-line: duplicate-set-field
vim.ui.select = function(items, opts, on_choice)
  local ui_select = require("fzf-lua.providers.ui_select")

  if not ui_select.is_registered() then
    ui_select.register(function(ui_opts)
      if ui_opts.kind == "color_presentation" then
        ui_opts.winopts = {
          relative = "cursor",
          height = 0.35,
          width = 0.3,
        }
      else
        ui_opts.winopts = { height = 0.5, width = 0.4 }
      end

      -- Use the kind (if available) to set the previewer's title
      if ui_opts.kind then
        ui_opts.winopts.title = string.format(" %s ", ui_opts.kind)
      end

      return ui_opts
    end)
  end

  -- Don't show the picker if there's nothing to pick
  if #items > 0 then
    return vim.ui.select(items, opts, on_choice)
  end
end

vim.keymap.set("n", "<leader>fB", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", "<cmd>FzfLua highlights<cr>", { desc = "Highlights" })
vim.keymap.set("n", "<leader>fd", "<cmd>FzfLua lsp_document_diagnostics<cr>", { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "Help" })
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recently opened files" })
vim.keymap.set("n", "<leader>f<", "<cmd>FzfLua resume<cr>", { desc = "Resume last fzf command" })
vim.keymap.set("n", "z=", "<cmd>FzfLua spell_suggest<cr>", { desc = "Spelling suggestions" })
