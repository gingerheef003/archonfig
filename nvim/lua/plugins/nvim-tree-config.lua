return {
	'nvim-tree/nvim-tree.lua',
	version = '*',
	lazy = false,
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	init = function ()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true
	end,
	config = function ()
		require('nvim-tree').setup({
			renderer = {
				group_empty = true,
				highlight_git = true,
			},
			filters = {
				dotfiles = true,
			},
		})

		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
		-- Telescope nvim-tree options
		local api = require('nvim-tree.api')

		local tree_actions = {
			{
				name = "Create node",
				handler = api.fs.create,
			},
			{
				name = "Remove node",
				handler = api.fs.remove,
			},
			{
				name = "Trash node",
				handler = api.fs.trash,
			},
			{
				name = "Rename node",
				handler = api.fs.rename,
			},
			{
				name = "Fully rename node",
				handler = api.fs.rename_sub,
			},
			{
				name = "Copy",
				handler = api.fs.copy.node,
			},
		}

		local function tree_actions_menu(node)
			local entry_maker = function(menu_item)
				return {
					value = menu_item,
					ordinal = menu_item.name,
					display = menu_item.name,
				}
			end

			local finder = require('telescope.finders').new_table({
				results = tree_actions,
				entry_maker = entry_maker,
			})

			local sorter = require('telescope.sorters').get_generic_fuzzy_sorter()

			local default_options = {
				finder = finder,
				sorter = sorter,
				attach_mappings = function(prompt_buffer_number)
					local actions = require('telescope.actions')
					actions.select_default:replace(function()
						local state = require('telescope.actions.state')
						local selection = state.get_selected_entry()
						actions.close(prompt_buffer_number)
						selection.value.handler(node)
					end)

					actions.add_selection:replace(function() end)
					actions.remove_selection:replace(function() end)
					actions.toggle_selection:replace(function() end)
					actions.select_all:replace(function() end)
					actions.drop_all:replace(function() end)
					actions.toggle_all:replace(function() end)

					return true
				end
			}

			require('telescope.pickers').new({prompt_title = "Tree menu"}, default_options):find()
		end

		vim.keymap.set('n', '<C-Space>', tree_actions_menu, {buffer = buffer, noremap = true, silent = true})
	end
}
