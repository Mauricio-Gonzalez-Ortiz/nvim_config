return {

	"goolord/alpha-nvim",
	-- dependencies = { 'echasnovski/mini.icons' },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("math")
		require("os")
		math.randomseed(os.time())
		local function getLen(str, start_pos)
			local byte = string.byte(str, start_pos)
			if not byte then
				return nil
			end

			return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
		end
		local function colorize(header, header_color_map, colors)
			for letter, color in pairs(colors) do
				local color_name = "AlphaJemuelKwelKwelWalangTatay" .. letter
				vim.api.nvim_set_hl(0, color_name, color)
				colors[letter] = color_name
			end

			local colorized = {}

			for i, line in ipairs(header_color_map) do
				local colorized_line = {}
				local pos = 0

				for j = 1, #line do
					local start = pos
					pos = pos + getLen(header[i], start + 1)

					local color_name = colors[line:sub(j, j)]
					if color_name then
						table.insert(colorized_line, { color_name, start, pos })
					end
				end

				table.insert(colorized, colorized_line)
			end

			return colorized
		end
		local function random_color()
			local r = math.random(50, 255)
			local g = math.random(50, 255)
			local b = math.random(50, 255)
			return string.format("#%02X%02X%02X", r, g, b)
		end

		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local headers = {
			{
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
				"▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
			},
			{
				"  ███╗   ███╗ █████╗ ██╗  ██╗██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗ ████║██╔══██╗██║  ██║██║   ██║██║████╗ ████║ ",
				"  ██╔████╔██║███████║██║  ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╔╝██║██╔══██║██║  ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚═╝ ██║██║  ██║╚█████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝     ╚═╝╚═╝  ╚═╝ ╚════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			},
			{
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⣀⣤⠖⠛⠉⠉⠛⠀⠀⠀⠸⠉⠛⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⣠⠔⠋⡀⠀⠀⠐⠟⠂⠀⠀⠚⠃⠀⠀⢦⠀⠈⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⢠⠞⠃⠀⠚⠃⢀⣠⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣰⠏⢀⡄⠀⡠⠊⠁⣀⣀⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⠀⠉⠀⠈⢁⠔⠋⠁⢀⣀⣤⠤⠴⠶⠀⠀⠀⠀⠀⠀⠀⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⡏⣠⡀⠀⠰⠃⢀⣴⣚⣉⡴⠋⠙⠓⢦⡀⠀⠀⠀⠀⠀⢠⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⣤⣤⡤⠤⢦",
				"⣇⠉⠀⠀⠀⡴⡿⠋⠉⠹⡇⠀⠀⠀⠀⣿⣤⠀⠀⠀⣰⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⡼",
				"⠹⡄⠀⠀⠘⢱⡇⠀⠀⣀⣿⡷⢺⣯⠉⠉⢹⡀⠐⣾⣅⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠞⠁⠀⠀⠀⠀⠀⢀⣀⡀⣠⠞⠁",
				"⠀⠙⢦⣀⠀⠀⣷⠿⣾⡅⠀⢧⠈⢿⣧⡀⠈⡇⠐⠊⣉⣁⣈⣙⣦⠀⠀⠀⠀⠀⢀⣀⡠⠴⠚⢩⠀⠀⠀⠀⠀⢀⣤⣤⣿⠿⠛⠁⠀⠀",
				"⠀⠀⠀⠈⠉⠙⠻⡄⠹⣿⣄⡼⠱⢄⣙⣁⣜⣡⠔⠋⠉⠀⠀⠈⠉⠙⠓⠲⢶⠚⠉⠁⠀⢀⣀⡬⠴⠒⠋⠙⠛⠋⠉⠁⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠛⣦⣌⣻⡇⠀⠀⣹⠾⠻⣀⣤⣀⡀⠀⣤⣄⡀⢀⣀⣠⡾⠶⠒⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⢠⠞⠀⠀⣸⣀⡤⠊⠁⠀⡴⣟⢿⡟⠛⠶⠿⠿⠖⣿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⣿⠀⠔⣩⠜⠁⠀⠀⡠⠊⠀⠘⣎⣧⠀⣀⣀⡤⠖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠘⢲⠞⠁⠀⠀⡠⠊⠀⠀⠀⠀⡿⠉⠈⠻⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⢰⢃⠀⠀⢀⠜⠓⠤⣄⣀⣤⠞⠁⠀⠀⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠘⠷⣶⣾⣥⠤⠶⠚⠉⠀⢿⠀⠀⠀⠀⠀⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠋⣀⣠⣤⣤⣀⣀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠉⠁⠀⠀⠀⠀⠉⠙⠾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			},
			{

				"             ███████████             ",
				"         ███████████████████         ",
				"       ███████████████████████       ",
				"     ███████████████████████████     ",
				"   ███████████████████████████████   ",
				"  █████████████████████████████████  ",
				" ███████████████████████████████████ ",
				"█████████████████████████████████████",
				"█████████████████████████████████████",
				"█████████████████████████████████████",
				"█████████████████████████████████████",
				"█████████████████████████████████████",
				" ███████████████████████████████████ ",
				"  █████████████████████████████████  ",
				"    █████████████████████████████    ",
				"      █████████████████████████      ",
				"        █████████████████████        ",
				"       ███████████████████████       ",
				"     ███████████████████████████     ",
				"     ███████████████████████████     ",
				"       ███████████████████████       ",
				"         ███████████████████         ",
				"           ███████████████           ",
				"             ███████████             ",
			},
			{
				"                    ███████                      ",
				"                  ███████████                    ",
				"                ███████████████                  ",
				"               ██████████████████                ",
				"             █████████████████████               ",
				"           ███████████████████████               ",
				"         █████████████████████████               ",
				"       ███████████████████████████   ███████     ",
				"      █████████████████████████████████████████  ",
				"     ███████████████████████████████████████████ ",
				"     ████████████████████████████████████████████",
				"     ████████████████████████████████████████████",
				"      ██████████████████████████████████████████ ",
				"        ███████████████████████████████████      ",
				"          ██████████████████                     ",
				"          ███████████████████                    ",
				"        ██████████████████████                   ",
				"     ██████████████████████████                  ",
				"   █████████████████████████████                 ",
				" ████████████████   █████████████                ",
				"█████████████████   ██████████████               ",
				"█████████████████   ██████████████               ",
			},
			{
				"                    ████████████                    ",
				"               ██████████████████████               ",
				"           ██████████████████████████████           ",
				"         ██████████████████████████████████         ",
				"       ██████████████████████████████████████       ",
				"     ██████████████████████████████████████████     ",
				"     ██████████████████████████████████████████     ",
				"   ██████████████████████████████████████████████   ",
				"   ██████████████████████████████████████████████   ",
				"   ██████████████████████████████████████████████   ",
				" ██████████████████████████████████████████████████ ",
				" ██████████████████████████████████████████████████ ",
				" ██████████████████████████████████████████████████ ",
				" ██████████████████████████████████████████████████ ",
				" ██████████████████████████████████████████████████ ",
				" ██████████████████████████████████████████████████ ",
				" ██████████████████████████████████████████████████ ",
				"   ██████████████████████████████████████████████   ",
				"   ██████████████████████████████████████████████   ",
				"   ██████████████████████████████████████████████   ",
				"     ██████████████████████████████████████████     ",
				"     ██████████████████████████████████████████     ",
				"       ██████████████████████████████████████       ",
				"         ██████████████████████████████████         ",
				"           ██████████████████████████████           ",
				"               ██████████████████████               ",
				"                    ████████████                    ",
			},
		}
		local color_maps = {
			{
				"TTTTTTTTTTRRRRRRRRRRRRPPPNNNLLLLLLL",
				"TTTTTTTRRRRRRRRRRRRRPNLJJJHHHHHHJLL",
				"TTPNNLHHHHHHLNPRPPNNLHHFFFFFDDDDDFF",
				"PJLLJHJJJJLLNNRRRPNJHHHJLLNNNNJJHFF",
				"LNRRRRPNLLNNPRRTRPNJHHHLNNLLLLHHHJJ",
				"RRNPNFDFFHHPRRTTRRNJJHJHHNFDFDFDFHJ",
				"RPJLPPJLNNPRRRTTRRNLJJHJJJJJJHHHHHH",
				"RTRTRRRPPPRTTTTTRRNLJJJJJJLLLLLJJJJ",
				"TTTTTTRRRTTTTTTTTRNLLJJJJJJLLLLLLLL",
				"TTTVTTTTTTTTRTTTTRPLLJJJJJJLLLLLLLJ",
				"TTTVTTTTTTTTTTTTRPPLLJJHJLLLLLLLLJJ",
				"TTTTTTTTTRRRRPRRPNLJJJJJJJLLLLLLJJJ",
				"TTTTTTTTRRRRNPRRLJHFFFHHJJLLLLLLJLJ",
				"TTTVVTTTRRRRRRRRNNNJHHJJJJLLLLLLLJL",
				"TTTTTTTTTRRPPNPPLPRLJJHJJJJJLLLJLJL",
				"TTTTTTRPPRRRRRPPPPNJLLJJHHHHHJJJJJJ",
				"TTTTTRPNLPPPNNNLJJJHHHHHHFFJJJJJJJJ",
				"TTTTTRPLNTRRRRRPPPNNLJJHHHJLLJJJHHJ",
				"RTTRRRPRTTTRRRPNLLJLJJJJJJJJJJJHHHH",
			},
			{
				"  AAAA   AAAA BBBBBB CCC  CCCDDD   DDDEEEFFFF   FFFF ",
				"  AAAAA AAAAABBBBBBBBCCC  CCCDDD   DDDEEEFFFFF FFFFF ",
				"  AAAAAAAAAAABBBBBBBBCCC  CCCDDD   DDDEEEFFFFFFFFFFF ",
				"  AAAAAAAAAAABBBBBBBBCCC  CCCDDDD DDDDEEEFFFFFFFFFFF ",
				"  AAA AAA AAABBB  BBBCCCCCCCC DDDDDDD EEEFFF FFF FFF ",
				"  AAA     AAABBB  BBB CCCCCC   DDDDD  EEEFFF     FFF ",
			},
			{
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAACCAADDAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAA",
				"AAAAAAAACCADCCCCDDAAAAAAAAAAAABBBBBBAAAAAAAAAAAAAA",
				"AAAAAADDCCCDDDCCDAAAAAAAAAAABBBBABBBAAAAAAAAAAAAAA",
				"AAAAAAADDCCDAADAAAAAAAAAAAAABBBBBBAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAAAAAAABBBAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAABBAAAAAAAAAAAAAABBAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAABBBBBBBBBABAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAAABAAAAAABBAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAAABBAAAAAABBAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAABBBBBBBBABBAAAAAAAAAAAAAAAAAAAAAAAAA",
				"AAAAAAAAAAAAAABBBAAAABBBBAAAAAAAAAAAAAAAAAAAAAAAAA",
			},
			{

				"             ZZZZZZZZZZZ             ",
				"         ZZZZAAAAAAAAAAAZZZZ         ",
				"       ZZAAAATTTTTTTTTTTAAAAZZ       ",
				"     ZZAAAATXXXXXXXXXXXXXTAAAAZZ     ",
				"   ZZAATXXXXXXXXXXXXXXXXXXXXXTAAZZ   ",
				"  ZZAATXXXXXXXXXXXXXXXXXXXXXXXTAAZZ  ",
				" ZZAATXXXXXXXXXXXXXXXXXXXXXXXXXTAAZZ ",
				"ZZAAAXXXXXXXXXXXXXXXXXXXXXXXXXXXAAAZZ",
				"ZAATTXTAAAAATTXXXXXXXXXXTAAAAATXTTAAZ",
				"ZAATTXAOOOAAAAXXXXXXXXXXAOOAAAAXTTAAZ",
				"ZAATTTAAAAAAAAXXAAAAAXXXAAAAAAATTTAAZ",
				"ZZAAATAAAAAAAAXAOOOOOAXXAAAAAAATAAAZZ",
				" ZZAAATVVVVTXXXAAAAAAAXXXTVVVVTAAAZZ ",
				"  ZZAAPVVVVXXXXXXXXXXXXXXXVVVVPAAZZ  ",
				"    ZZAAPPVTXXXXXXXXXXXXXTVPPAAZZ    ",
				"      ZZAAAPTXXXXXXXXXXXTPAAAZZ      ",
				"        ZZAAAAAAAAAAAAAAAAAZZ        ",
				"       ZZAATXKAAAAAAAAATXTAAZZ       ",
				"     ZZAAATXATTXXXXXXXTTAXTAAAZZ     ",
				"     ZZAAATXATXXXXXXXXXTAXTAAAZZ     ",
				"       ZZZAAATXXXAAATXXTAAAZZZ       ",
				"         ZZAAAAXXAAATXAAAAZZ         ",
				"           ZZAAAAZZZAAAAZZ           ",
				"             ZZZZZZZZZZZ             ",
			},
			{
				"                    ZZZZZZZ                      ",
				"                  ZZZZAAAAAZZ                    ",
				"                ZZAAAAAKKKKAAZZ                  ",
				"               ZAKKKKKKKKAAAAAAZZ                ",
				"             ZZZAKKKKKKKKARRRRRAAZ               ",
				"           ZZZZARKKKKKKKKKKAAAKAAZ               ",
				"         ZZAAAAARKKKKWWWWWWKKKWWAZ               ",
				"       ZZAKKKKKKRKKKKWWOOAAAWOAAAZ   ZZZZZZZ     ",
				"      ZARRRRRRRRAKKWWWOOOAAAWOAAWAZZZZAAAAAAZZZ  ",
				"     ZAKKRRRRRRRAKKWWWWOOOOOWOOWAAAAAAKKKKKAAAAZ ",
				"     ZAKKKKKRARRRAAKKWAAAAAAWWAAARRRAKKRRRRAARAAZ",
				"     ZAKKKKKARRRRRRAAWWWWWWWAARRRRRRAKKKKKKAAAAAZ",
				"      ZZZAKKKKKKARRRRRRRRRRRAAAAAAAAZAAAAAAZZZZZ ",
				"        ZZAKKKKARRRRRRRRRRRAZZZZZZZZZZZZZZZ      ",
				"          ZZAAAKKRRRRRRRRAAZ                     ",
				"          ZZZAKKKKKKKKKKKAAZZ                    ",
				"        ZZARRRRRKKKKKKRRRRRAZZ                   ",
				"     ZZZZAKKRRRRRAAAARRRRKKKAAZ                  ",
				"   ZZZAAKKKKKRRRAZZZZAKKKKKKAAZZ                 ",
				" ZZAAKKKKKKKKKKAZ   ZAKKKKKAAAAZZ                ",
				"ZAAAAAAAAAAAAAAAZ   ZAAAAAAAAAAAAZ               ",
				"ZZZZZZZZZZZZZZZZZ   ZZZZZZZZZZZZZZ               ",
			},
			{
				"                    FFFFFFFFFFFF                    ",
				"               FFFFFFAAAAAAAAAAFFFFFF               ",
				"           FFFFFAAAAABBDBBBBDBBAAAAAFFFFF           ",
				"         FFFAAAABBBAACCCCCEBBCCBBBBBAAAAFFF         ",
				"       FFFAABBAACCCBBAACCCCCCBBAAAAADDBBAAFFF       ",
				"     FFFAAEBBEBBAACCCBBAACCAAAADDBDDBBBBBBAAFFF     ",
				"     FAAEBCCCCBBEAACCCCBBAABBDDBBDDBDDBDBBEBAAF     ",
				"   FFFAABBCCCCCCCEBAACCAABBAABBBBDDDBBDDDDEBAAFFF   ",
				"   FAABBCCCCCCCCCCCBBAACCDDBBAAAABBBDDBBDDBBEEAAF   ",
				"   FAABBAAAAAACCCCCAACCAACCDDBBDDAAABBBBBBDDDDAAF   ",
				" FFFAAAABEEBBBAACAACCEEBBAACCDDDDDDBAAAAAABBBBAAFFF ",
				" FAAEBBBCCECBCBEAACEBCCBBBBAACBDDDDDBBDDBBAAAAAAAAF ",
				" FAABECCCCCCCCAABAABCBEEEBBBBAACCDDDDDBBDDBBDDBBAAF ",
				" FAABBCCCCCCAAEBCEEAACCBBBBBBBBAACEDBBDDBBBBBBBEAAF ",
				" FAABECCCCAABECCCCCAACCCCEEBBBBBBAACBBBBBBBBEBBEAAF ",
				" FAABBCCCCAABBCCCCCAACCBBCCBBBBBEBEACCEBBBBBBBBBAAF ",
				" FFFAABBAAEECCCCECCBECACCEBCCBBBBBBBAACBDBCCBBAAFFF ",
				"   FAABBAACCCCCCCCCCCAACCCCEBECBBCCECCAACCBBBBAAF   ",
				"   FAABBAACCCCCCCCCCCAACCCCCCBECCBBCBBCCAACCBBAAF   ",
				"   FFFAAEECCCCCCCCCCCBEAACCCCCCECCCCCCCCCCAAAAFFF   ",
				"     FAABECCCCCCCCCCCCCAACCCECCCCCCCCCCCCCEBAAF     ",
				"     FFFAADECCCCCCCCCCCAACCCCCCBCCCCCCCCEBAAFFF     ",
				"       FFFAABEBBCCCCCCCAACCCCCCCCCCCBBEBAAFFF       ",
				"         FFFAAAABBBBBAACCCCCCCCBBBBBAAAAFFF         ",
				"           FFFFFAAAAABBBBBEBBBBAAAAAFFFFF           ",
				"               FFFFFFAAAAAAAAAAFFFFFF               ",
				"                    FFFFFFFFFFFF                    ",
			},
		}

		local colors = {
			{
				["T"] = { fg = "#d9bcb1" },
				["D"] = { fg = "#4d392f" },
				["R"] = { fg = "#d5a798" },
				["P"] = { fg = "#b9a29d" },
				["N"] = { fg = "#86554e" },
				["J"] = { fg = "#876247" },
				["H"] = { fg = "#755b4c" },
				["F"] = { fg = "#5d4942" },
				["L"] = { fg = "#9c745b" },
				["V"] = { fg = "#e9d5ce" },
			},
			{
				["A"] = { fg = random_color() },
				["B"] = { fg = random_color() },
				["C"] = { fg = random_color() },
				["D"] = { fg = random_color() },
				["E"] = { fg = random_color() },
				["F"] = { fg = random_color() },
			},
			{
				["A"] = { fg = "#bbdfd1" },
				["B"] = { fg = "#ad902c" },
				["C"] = { fg = "#5c2c28" },
				["D"] = { fg = "#ffffff" },
			},
			{
				["A"] = { fg = "#070000" },
				["X"] = { fg = "#e3c6c5" },
				["T"] = { fg = "#cf9c9b" },
				["V"] = { fg = "#9dc9cd" },
				["P"] = { fg = "#6b9ba0" },
				["O"] = { fg = "#ffffff" },
				["Z"] = { fg = "#d08385" },
			},
			{
				["A"] = { fg = "#070000" },
				["K"] = { fg = "#0072ef" },
				["R"] = { fg = "#39bffc" },
				["W"] = { fg = "#fee5a5" },
				["O"] = { fg = "#ffffff" },
				["Z"] = { fg = "#cbeef7" },
			},
			{
				["A"] = { fg = "#000000" },
				["B"] = { fg = "#fe9107" },
				["C"] = { fg = "#b84f00" },
				["D"] = { fg = "#ffb407" },
				["E"] = { fg = "#fd7206" },
				["F"] = { fg = "#f5bb8e" },
			},
		}
		dashboard.section.buttons.val = {
			dashboard.button("e", "   Let's MAU", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "   Find a MAU", ":Telescope find_files<CR>"),
			dashboard.button("r", "   Grep a MAU", ":Telescope live_grep<CR>"),
			dashboard.button("s", "   Oh shit birthright", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			dashboard.button("q", "󰐂  Leave the MAU", ":qa<CR>"),
		}
		local index = math.random(1, 6)
		dashboard.section.header.val = headers[index]
		dashboard.section.header.opts = {
			hl = colorize(headers[index], color_maps[index], colors[index]),
			position = "center",
		}
		dashboard.section.footer.val = { "There's no end to MAUri time" }
		alpha.setup(dashboard.opts)
	end,
}
