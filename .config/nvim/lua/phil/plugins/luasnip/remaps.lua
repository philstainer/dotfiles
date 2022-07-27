local luasnip = require "luasnip"
local select_choice = require "luasnip.extras.select_choice"

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({"i", "s"}, "<c-k>", function()
  if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
end, {silent = true})

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({"i", "s"}, "<c-j>", function()
  if luasnip.jumpable(-1) then luasnip.jump(-1) end
end, {silent = true})

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
  -- if luasnip.choice_active() then luasnip.change_choice(1) end
  if select_choice then select_choice() end
end)

-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s",
               "<cmd>source ~/.config/nvim/lua/phil/plugins/snippets<CR>")
