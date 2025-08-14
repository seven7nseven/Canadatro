SMODS.Sound({key = "truckapply", path = "truckapply.ogg",})

SMODS.Atlas{
    key = 'truck_tarot',
    path = 'trucktarot.png',
    px = 71,
    py = 95,
}

SMODS.Consumable {
    set = "Tarot",
    key = "canadatro_truck",
	config = {
        -- How many cards can be selected.
        max_highlighted = 1,
        -- the key of the seal to change to
        extra = 'truck_seal',
    },
    loc_vars = function(self, info_queue, card)
        -- Handle creating a tooltip with seal args.
        info_queue[#info_queue+1] = G.P_SEALS[(card.ability or self.config).extra]
        -- Description vars
        return {vars = {(card.ability or self.config).max_highlighted}}
    end,
    loc_txt = {
        name = 'truck',
        text = {
            "select {C:attention}#1#{} card to",
            "apply a {C:attention}truck seal{} to"
        }
    },
    cost = 4,
    atlas = "truck_tarot",
    pos = {x=0, y=0},
    use = function(self, card, area, copier)
        for i = 1, math.min(#G.hand.highlighted, card.ability.max_highlighted) do
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('canadatro_truckapply')
                card:juice_up(0.3, 0.5)
                return true end }))
            
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.hand.highlighted[i].seal = "canadatro_truckseal"
                return true end }))
            
            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

SMODS.Atlas{
    key = 'pagecollector',
    path = 'pagecollector.png',
    px = 71,
    py = 95,
}

SMODS.Consumable {
    set = "Tarot",
    key = "canadatro_pagecollector",
	config = {
        -- How many cards can be selected.
        max_highlighted = 1,
        -- the key of the seal to change to
        extra = 'page_seal',
    },
    loc_vars = function(self, info_queue, card)
        -- Handle creating a tooltip with seal args.
        info_queue[#info_queue+1] = G.P_SEALS[(card.ability or self.config).extra]
        info_queue[#info_queue+1] = {key = 'canadatro_ideacredit', set = 'Other', vars = { "kalp" }}
        -- Description vars
        return {vars = {(card.ability or self.config).max_highlighted}}
    end,
    loc_txt = {
        name = 'page collector',
        text = {
            "select {C:attention}#1#{} card to",
            "apply a {C:dark_edition}page{} to"
        }
    },
    cost = 4,
    atlas = "pagecollector",
    pos = {x=0, y=0},
    use = function(self, card, area, copier)
        for i = 1, math.min(#G.hand.highlighted, card.ability.max_highlighted) do
            G.E_MANAGER:add_event(Event({func = function()
                card:juice_up(0.3, 0.5)
                return true end }))
            
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.hand.highlighted[i].seal = "canadatro_pageseal"
                return true end }))
            
            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

SMODS.Atlas{
    key = 'summon',
    path = 'tsummon.png',
    px = 71,
    py = 95,
}

SMODS.Consumable {
    set = "Spectral",
    key = "summon",
    loc_txt = {
        name = 'summon deity',
        text = {
            "use to summon",
            "a {X:dark_edition,C:white}deity{} joker"
        }
    },
    cost = 50,
    atlas = "summon",
    pos = {x=0, y=0},
    hidden = true,
    can_use = function(self, card)
		--Don't allow use if everything is eternal and there is no room
		return #Canadatro.advanced_find_joker(nil, nil, nil, { "eternal" }, true, "j") < G.jokers.config.card_limit
	end,
    use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			func = function()
				play_sound("timpani")
				local card = create_card("Deity", G.jokers, nil, nil, nil, nil, nil, "canadatro_summon")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		delay(0.6)
    end,
    force_use = function(self, card, area)
		self:use(card, area)
	end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}