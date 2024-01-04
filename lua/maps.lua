-- BACK TO FILE DIR
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--from primes stuff
--moving blocks around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--prime says its the best remap EVER
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- FOR TELESCOPE
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.api.nvim_set_keymap(
  "n",
  "<space>ff",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})


require('telescope').setup({
	defaults = {
	  sorting_strategy = "ascending",
	  layout_strategy = "horizontal",
	  layout_config = { prompt_position = "top" },
	  border = true
	},
	extensions = {
		file_browser = {
		  hijack_netrw = true,
		  theme = "ivy",
		  mappings = {
			i = {
			  ["<C-y>"] = function()
				local entry = require("telescope.actions.state").get_selected_entry()
				local cb_opts = vim.opt.clipboard:get()
				if vim.tbl_contains(cb_opts, "unnamed") then vim.fn.setreg("*", entry.path) end
				if vim.tbl_contains(cb_opts, "unnamedplus") then
				  vim.fn.setreg("+", entry.path)
				end
				vim.fn.setreg("", entry.path)
			  end,
			},
		  },
		},
	  },
  })
