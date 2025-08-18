SMODS.Sound({
	key = "music_mainmenu",
	path = "music_mainmenu.ogg",
	volume = 0.7,
	pitch = 1,
	select_music_track = function()
		return G.STAGE == G.STAGES.MAIN_MENU
	end,
})


function determine_song()
	return	 G.video_soundtrack or
			(G.STATE == G.STATES.SPLASH and '') or
			(G.booster_pack_sparkles and not G.booster_pack_sparkles.REMOVED and 'music2') or
			(G.booster_pack_meteors and not G.booster_pack_meteors.REMOVED and 'music3') or
			(G.booster_pack and not G.booster_pack.REMOVED and 'music2') or
			(G.shop and not G.shop.REMOVED and 'music4') or
			(G.GAME.blind and G.GAME.blind.boss and 'music5') or 
			('music1') 
end

G.amen = false

function shouldIReallyBePlayingThisSongAmIAllowedToPleaseTellMeRightNow(key)
	if key == 'music_canadatro' then return not G.amen end
	if key == 'music_dnb' then return G.amen end
	return true
end

function doesThePlayerHaveAnAwesomeJokerSomewhere()
	local wawa = false
	if G.jokers then
		for _, v in pairs(G.jokers.cards) do
			wawa = wawa or (v.ability.name:find('canadatro') ~= nil)
		end
	end
	return wawa
end

SMODS.Sound({
	key = "music_canadatro",
	path = "music_theme_canadatro.ogg",
	select_music_track = function()
		local wawa = doesThePlayerHaveAnAwesomeJokerSomewhere()
		local wewe = shouldIReallyBePlayingThisSongAmIAllowedToPleaseTellMeRightNow('music_canadatro')
		local wiwi = (determine_song() == 'music1')
		return wawa and wewe and wiwi
	end,
})


SMODS.Sound({
	key = "music_dnb",
	path = "music_theme_dnb.ogg",
	select_music_track = function()
		local wawa = doesThePlayerHaveAnAwesomeJokerSomewhere()
		local wewe = shouldIReallyBePlayingThisSongAmIAllowedToPleaseTellMeRightNow('music_dnb')
		local wiwi = (determine_song() == 'music1')
		return wawa and wewe and wiwi
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
	key = "hepten",
	loc_txt = {},
	badge_colour = HEX("2d2131"),
	default_weight = 0.0001,
	pools = { ["Joker"] = true },
})

SMODS.Rarity({
	key = "deity",
	loc_txt = {},
	badge_colour = HEX("4cd482"),
})