local db = require('dashboard')


db.setup {
	theme = 'hyper',
	config = {
		header = {
			[[]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⠤⠶⠶⠶⠶⠶⠶⢀⣾⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⠀⣀⡴⠞⠋⠁⠀⠀⠀⠀⠀⠀⠀⢠⣿⡿⠀⠙⠳⢦⣀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⣠⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠃⠀⠀⠀⠀⠉⠳⣄⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⢠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣇⣠⣴⡶⠀⠀⠀⠀⠈⠳⣄⠀⠀⠀]],
			[[⠀⠀⣰⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀]],
			[[⠀⣰⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠘⣆⠀]],
			[[⢠⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⢿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄]],
			[[⢸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⢠⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇]],
			[[⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⠃⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿]],
			[[⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣷⣾⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿]],
			[[⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡇]],
			[[⠈⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠁]],
			[[⠀⠘⣇⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⠀]],
			[[⠀⠀⠘⢧⠀⠀⠀⠀⠀⠀⠘⠋⠉⣼⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠃⠀⠀]],
			[[⠀⠀⠀⠈⠳⣄⠀⠀⠀⠀⠀⠀⢰⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠈⠳⣤⡀⠀⠀⢀⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠞⠁⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⠂⣾⣿⠃⠀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡿⠁⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⢀⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[]],
		},
	},
}
