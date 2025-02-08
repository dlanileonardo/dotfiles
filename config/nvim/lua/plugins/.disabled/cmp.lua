local M = {
  enabled = true,
  "hrsh7th/nvim-cmp",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  opts = function()
    local cmp = require("cmp")
    local check_backspace = function()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    return {
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "snippets" },
        { name = "path" },
        { name = "nvim_lua" },
      },
      window = {
        completion = {
           winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
           col_offset = -3,
           side_padding = 0,
        },
        documentation = require("cmp").config.window.bordered({
           winhighlight = "Normal:FloatBorder,FloatBorder:FloatBorder,Search:None",
        }),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
             local kind = require("lspkind").cmp_format({
                   symbol_map = require("lspkind").presets,
                   mode = "symbol_text",
                   maxwidth = 50,  -- I also tried to modify this value but nothing changes
             })(entry, vim_item)
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
      }
    }
  end
}

-- function M.config()
--   local cmp = require "cmp"
--   local luasnip = require "luasnip"
--   require("luasnip/loaders/from_vscode").lazy_load()

--   local check_backspace = function()
--     local col = vim.fn.col "." - 1
--     return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
--   end

--   local kind_icons = {
--     Text = "",
--     Method = "",
--     Function = "",
--     Constructor = "",
--     Field = "",
--     Variable = "",
--     Class = "",
--     Interface = "",
--     Module = "",
--     Property = "",
--     Unit = "",
--     Value = "",
--     Enum = "",
--     Keyword = "",
--     Snippet = "",
--     Color = "",
--     File = "",
--     Reference = "",
--     Folder = "",
--     EnumMember = "",
--     Constant = "",
--     Struct = "",
--     Event = "",
--     Operator = "",
--     TypeParameter = "",
--   }

--   cmp.setup {
--     snippet = {
--       expand = function(args)
--         luasnip.lsp_expand(args.body) -- For `luasnip` users.
--       end,
--     },
--     mapping = cmp.mapping.preset.insert {
--       ["<C-k>"] = cmp.mapping.select_prev_item(),
--       ["<C-j>"] = cmp.mapping.select_next_item(),
--       ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
--       ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
--       ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
--       ["<C-e>"] = cmp.mapping {
--         i = cmp.mapping.abort(),
--         c = cmp.mapping.close(),
--       },
--       -- Accept currently selected item. If none selected, `select` first item.
--       -- Set `select` to `false` to only confirm explicitly selected items.
--       ["<CR>"] = cmp.mapping.confirm { select = true },
--       ["<Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_next_item()
--         elseif luasnip.expandable() then
--           luasnip.expand()
--         elseif luasnip.expand_or_jumpable() then
--           luasnip.expand_or_jump()
--         elseif check_backspace() then
--           fallback()
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       }),
--       ["<S-Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_prev_item()
--         elseif luasnip.jumpable(-1) then
--           luasnip.jump(-1)
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       }),
--     },
--     formatting = {
--       fields = { "kind", "abbr", "menu" },
--       format = function(entry, vim_item)
--         vim_item.kind = kind_icons[vim_item.kind]
--         vim_item.menu = ({
--           nvim_lsp = "",
--           nvim_lua = "",
--           luasnip = "",
--           buffer = "",
--           path = "",
--           emoji = "",
--         })[entry.source.name]
--         return vim_item
--       end,
--     },
--     sources = {
--       { name = "nvim_lsp" },
--       { name = "nvim_lua" },
--       { name = "luasnip" },
--       { name = "buffer" },
--       { name = "path" },
--     },
--     confirm_opts = {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = false,
--     },
--     window = {
--       completion = cmp.config.window.bordered(),
--       documentation = cmp.config.window.bordered(),
--     },
--     experimental = {
--       ghost_text = true,
--     },
--   }
-- end

return M
