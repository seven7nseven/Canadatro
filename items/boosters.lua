G.C.CAN_BOOOOO = { 0, 0, 0, 0 }

SMODS.Atlas({
	key = 'booster1',
	path = 'boosterpack1.png',
	px = 71,
	py = 96,
})

SMODS.Sound({
	key = "music_booster", 
	path = "music_booster.ogg",
	pitch = 1,
	volume = 0.6,
	select_music_track = function()
		if G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
			if G.pack_cards
				and G.pack_cards.cards
				and G.pack_cards.cards[1]
				and G.pack_cards.cards[1].config
				and G.pack_cards.cards[1].config.center
				and G.pack_cards.cards[1].config.center.mod
				and G.pack_cards.cards[1].config.center.mod.id 
				and G.pack_cards.cards[1].config.center.mod.id == "Canadatro" then
				return true 
			end
		end
	end,
})

-- Booster Pack 1
SMODS.Booster({
	key = 'booster_canada',
	group_key = "k_canadatro_booster",
	atlas = 'booster1', 
	pos = { x = 0, y = 0 },
	discovered = true,
	loc_txt= {
		name = 'the country of canada',
		text = { "hi so you draw {C:attention}#2#{} jokers out",
				"and then pick {C:attention}#1#{} jokers",
				"k thx"},
		group_name = {"will you pick it"},
	},
	
	draw_hand = false,
	config = {
		extra = 3,
		choose = 1, 
	},

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.choose, card.ability.extra } }
	end,

	weight = 1,
	cost = 5,
	kind = "CanadatroPack",
	
	create_card = function(self, card, i)
		return SMODS.create_card({
			set = "Canadaaddition",
			area = G.pack_cards,
			skip_materialize = true,
			soulable = true,
		})
	end,
	select_card = 'jokers',

	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.CAN_BOOOOO)
		ease_background_colour({ new_colour = G.C.CAN_BOOOOO, special_colour = G.C.CANADARED, contrast = 1 })
	end,

	in_pool = function() return true end
})

SMODS.Atlas({
	key = 'booster2',
	path = 'boosterpack2.png',
	px = 71,
	py = 96,
})

-- Booster Pack 2
SMODS.Booster({
	key = 'booster_adanac',
	group_key = "k_canadatro_booster_evil",
	atlas = 'booster2', 
	pos = { x = 0, y = 0 },
	discovered = true,
	loc_txt= {
		name = 'adanac fo yrtnuoc eht',
		text = { "what the fuck who made canada evil?"},
		group_name = {"will you pick it"},
	},
	
	draw_hand = false,
	config = {
		extra = 3,
		choose = 1, 
	},

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.choose, card.ability.extra } }
	end,

	weight = 1,
	cost = 5,
	kind = "CanadatroPack",
	
	create_card = function(self, card, i)
		return SMODS.create_card({
			set = "Messedjokers",
			area = G.pack_cards,
			skip_materialize = true,
			soulable = true,
		})
	end,
	select_card = 'jokers',
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.CAN_BOOOOO)
		ease_background_colour({ new_colour = G.C.CAN_BOOOOO, special_colour = G.C.CANADABLUE, contrast = 1 })
	end,

	in_pool = function() return true end
})

SMODS.Atlas({
	key = 'booster3',
	path = 'boosterpack3.png',
	px = 71,
	py = 96,
})

SMODS.Sound({
	key = "music_booster", 
	path = "music_booster.ogg",
	pitch = 1,
	volume = 0.6,
	select_music_track = function()
		if G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
			if G.pack_cards
				and G.pack_cards.cards
				and G.pack_cards.cards[1]
				and G.pack_cards.cards[1].config
				and G.pack_cards.cards[1].config.center
				and G.pack_cards.cards[1].config.center.mod
				and G.pack_cards.cards[1].config.center.mod.id 
				and G.pack_cards.cards[1].config.center.mod.id == "Canadatro" then
				return true 
			end
		end
	end,
})

-- 6 am booster pack (CURRENTLY USES THE REGULAR CANADATRO POOL DUE TO US HAVING ONLY 2 (two) 6 AM JOKERS)
SMODS.Booster({
	key = 'booster_6am',
	group_key = "k_canadatro_booster_6am",
	atlas = 'booster3', 
	pos = { x = 0, y = 0 },
	discovered = true,
	loc_txt= {
		name = 'is 6 am concidered a pack',
		text = { "pick {C:attention}#1#{} {C:dark_edition}6 am...{} joker out",
				"out of {C:attention}#2#{} {C:dark_edition}6 am...{} jokers"},
		group_name = {"will you pick it"},
	},
	
	draw_hand = false,
	config = {
		extra = 3,
		choose = 1, 
	},

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.choose, card.ability.extra } }
	end,

	weight = 1,
	cost = 5,
	kind = "CanadatroPack",
	
	create_card = function(self, card, i)
		return SMODS.create_card({
			set = "Canadaaddition",
			area = G.pack_cards,
			skip_materialize = true,
			soulable = true,
		})
	end,
	select_card = 'jokers',

	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.CAN_BOOOOO)
		ease_background_colour({ new_colour = G.C.CAN_BOOOOO, special_colour = G.C.CANADAGRAY, contrast = 2 })
	end,

	in_pool = function() return true end
})
