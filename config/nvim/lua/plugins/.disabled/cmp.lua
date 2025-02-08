local M = {
  enabled = true,
  "hrsh7th/nvim-cmp",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  opts = function(_, opts)
    local cmp = require "cmp"
    local check_backspace = function()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    return {
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "snippets" },
        { name = "path" },
        { name = "codeium", group_index = 1, priority = 100 },
      }, {
        { name = "buffer" },
        -- { name = "lazydev" },
      }),
      window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          col_offset = -3,
          side_padding = 0,
        },
        documentation = require("cmp").config.window.bordered {
          winhighlight = "Normal:FloatBorder,FloatBorder:FloatBorder,Search:None",
        },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format {
            symbol_map = require("lspkind").presets,
            mode = "symbol_text",
            maxwidth = 50, -- I also tried to modify this value but nothing changes
          }(entry, vim_item)
          local custom_menu_icon = {
            calc = "󰃬",
            codeium = "󰚩",
          }
          if entry.source.name == "calc" or entry.source.name == "codeium" then
            vim_item.kind = custom_menu_icon[entry.source.name]
          end
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "(" .. (strings[2] or "") .. ")"

          return kind
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
    }
  end,
}

return M
