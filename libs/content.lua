SMODS.Sound({
	key = "music_mainmenu",
	path = "music_mainmenu.ogg",
	volume = 0.7,
	pitch = 1,
	select_music_track = function()
		return G.STAGE == G.STAGES.MAIN_MENU
	end,
})

SMODS.Rarity({
	key = "fuck",
	loc_txt = {},
	badge_colour = HEX("d86890"),
	default_weight = 0.008,
	pools = { ["Joker"] = true },
})

SMODS.Rarity({
	key = "amrt",
	loc_txt = {},
	badge_colour = HEX("6d7bc9"),
	default_weight = 0.001,
	pools = { ["Joker"] = true },
})

SMODS.Rarity({
	key = "unversale",
	loc_txt = {},
	badge_colour = HEX("00ffea"),
})