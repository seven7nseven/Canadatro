--- STEAMODDED HEADER
--- MOD_NAME: Canadatro
--- MOD_ID: CANADATRO
--- MOD_AUTHOR: luma lumatic
--- MOD_DESCRIPTION: canada
--- PREFIX: cand
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{
    key = 'firstjoker',
    path = 'balalatemplate.png',
    px = 71,
    py = 95,
}

SMODS.Sound({key = "congrats", path = "congrats.ogg"})

SMODS.Joker{
    key = 'testjoker',
    loc_txt = {
        name = 'thumbs up dude',
        text = {'gives you a {C:attention}BIG thumbs up{}',
                'at the end of the round'}
    },
    atlas = 'firstjoker',
    rarity = 1,
    cost = 0,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            G.showthumbsup = 230
            return 
                {
                sound = "canadatro_congrats",
                message = "+1",
                }
            end
        end,
}

SMODS.Atlas{
    key = 'thumbsdown',
    path = 'evilguy.png',
    px = 71,
    py = 95,
}

SMODS.Sound({key = "uncongrats", path = "uncongrats.ogg"})

SMODS.Joker{
    key = 'thumbsdown',
    loc_txt = {
        name = 'thumbs down dude',
        text = {'gives you a {C:red}BIG thumbs DOWN{}',
                'at the end of the round',
                'and {C:red}TAKES AWAY ONE {C:blue}chip..{}'}
    },
    atlas = 'thumbsdown',
    rarity = "canadatro_fuck",
    cost = 0,
    pools = {["Canadaaddition"] = true, ["Messedjokers"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chip = -1}},

    calculate = function(self, card, context)
        if context.joker_main then
            return 
                {
                chips = card.ability.extra.chip,
                }
            end
        if context.end_of_round and context.cardarea == G.jokers then
            G.showthumbsdown = 230
            return 
                {
                sound = "canadatro_uncongrats",
                message = "-1",
                }
            end
        end,
}

-- a MEAN country
SMODS.Atlas{
    key = 'canadamult',
    path = 'agoodcountry.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'ameancountry',
    loc_txt = {
        name = 'a MEAN country',
        text = {'{C:red} +#1#{} mult',
                'and a {C:attention}PUNCH{} in the face...'}
    },
    atlas = 'canadamult',
    rarity = 1,
    cost = 2,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {mult = 5.4}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.mult }  }
	end,

    calculate = function(self, card, context)
    if context.joker_main then
        return 
            {
            mult = card.ability.extra.mult,
            }
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- a MEAN country
SMODS.Atlas{
    key = 'canadachips',
    path = 'abadcountry.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'agoodcountry',
    loc_txt = {
        name = 'a NICE country',
        text = {'{C:blue} +#1#{} chips, {X:chips,C:white}#2#x{} chips',
                'and a {C:blue}PAT{} on the back...'}
    },
    atlas = 'canadachips',
    rarity = 1,
    cost = 3,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chips = 10.9, xchips = 1.19}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips, center.ability.extra.xchips }  }
	end,

    calculate = function(self, card, context)
    if context.joker_main then
        return 
            {
            chips = card.ability.extra.chips,
            Xchip_mod = card.ability.extra.xchips,
            }
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- trigonometry
SMODS.Atlas{
    key = 'trigonometry',
    path = 'trigonometryrp.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'trigonometryrp',
    loc_txt = {
        name = 'trigonometry rp',
        text = {'{C:red}+pi{} mult and',
                'earn {C:attention}$sin(90){} at the end of the round',
                '{C:inactive}what in the ACTUAL FUCK is this?{}'}
    },
    atlas = 'trigonometry',
    rarity = 1,
    cost = 3,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {mult = 3.141, dollar = 1}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.mult, center.ability.extra.dollar}}
	end,

    calculate = function(self, card, context)
    if context.joker_main then
        return 
            {
            mult = card.ability.extra.mult,
            }
        end
    end,

    calc_dollar_bonus = function(self,card)
        return card.ability.extra.dollar
    end,


    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- devesto
SMODS.Atlas{
    key = 'devestoo',
    path = 'devesto.png',
    px = 71,
    py = 95,
}

SMODS.Sound({key = "build", path = "build.ogg"})

SMODS.Joker{
    key = 'devesto',
    loc_txt = {
        name = 'devesto',
        text = {'creates a {C:attention}wall{} at the end of the round',
                '{C:inactive}(must have room){}'}
    },
    atlas = 'devestoo',
    rarity = 2,
    cost = 7,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            if #G.jokers.cards + G.GAME.joker_buffer <= G.jokers.config.card_limit then
                local wallslimits = 1
			    G.GAME.joker_buffer = G.GAME.joker_buffer + wallslimits
                local m = create_card('Joker', G.Jokers, nil, nil, nil, nil, 'j_canadatro_wall')
                m:add_to_deck()
                G.jokers:emplace(m)
                return {
                    sound = "canadatro_build",
                    message = "nothin' to see here!",    
                }
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- wall
SMODS.Atlas{
    key = 'wall',
    path = 'wall.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'wall',
    loc_txt = {
        name = 'wall',
        text = {'{C:blue} +#1#{} chips',
                '{C:inactive}nothing to see here!{}'}
    },
    atlas = 'wall',
    rarity = 1,
    cost = 2,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    hidden = true,

    pos = {x=0, y= 0},
    config = { extra = {chips = 30}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips}  }
	end,

    calculate = function(self, card, context)
    if context.joker_main then
        return 
            {
            chips = card.ability.extra.chips,
            }
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- trial joker
SMODS.Atlas{
    key = 'trialjoker',
    path = 'trialjoker.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'trialjoker',
    loc_txt = {
        name = 'trial joker',
        text = {'gains {X:mult,C:white} X#2#{} mult at end of round,',
                '{C:inactive}(currently{} {X:mult,C:white} X#1# {} {C:inactive}mult){}'}
    },
    atlas = 'trialjoker',
    rarity = 3,
    cost = 10,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {Xmult = 1,
    Xmult_mod = 0.185334324,}},

	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.Xmult),
				number_format(center.ability.extra.Xmult_mod),
			},
		}
	end,

    calculate = function(self, card, context)
		if context.joker_main and to_big(card.ability.extra.Xmult) > to_big(1) then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { number_format(card.ability.extra.Xmult) },
				}),
				Xmult_mod = lenient_bignum(card.ability.extra.Xmult),
			}
		end
        if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.Xmult = lenient_bignum(to_big(card.ability.extra.Xmult) + card.ability.extra.Xmult_mod)
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { number_format(card.ability.extra.Xmult) },
				}),
				colour = G.C.FILTER,
			}
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- trial joker
SMODS.Atlas{
    key = 'memberjoker',
    path = 'memberjoker.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'memberjoker',
    loc_txt = {
        name = 'full membership joker',
        text = {'gains {X:chips,C:white} X#2#{} chips at end of round,',
                '{C:inactive}(currently{} {X:chips,C:white} X#1# {} {C:inactive}mult){}'}
    },
    atlas = 'memberjoker',
    rarity = 3,
    cost = 10,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {Xchips = 1,
    Xchips_mod = 0.185334324,}},

	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.Xchips),
				number_format(center.ability.extra.Xchips_mod),
			},
		}
	end,

    calculate = function(self, card, context)
		if context.joker_main and to_big(card.ability.extra.Xchips) > to_big(1) then
			return {
				message = localize({
					type = "variable",
					key = "a_xchips",
					vars = { number_format(card.ability.extra.Xchips) },
				}),
				Xchip_mod = lenient_bignum(card.ability.extra.Xchips),
			}
		end
        if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.Xchips = lenient_bignum(to_big(card.ability.extra.Xchips) + card.ability.extra.Xchips_mod)
			return {
				message = localize({
					type = "variable",
					key = "a_xchips",
					vars = { number_format(card.ability.extra.Xchips) },
				}),
				colour = G.C.FILTER,
			}
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- france
SMODS.Atlas{
    key = 'france',
    path = 'france.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'france',
    loc_txt = {
        name = 'france^3',
        text = {'gives you {X:mult,C:white} X#1#{} mult',
                '{C:inactive}also halves your {C:attention}money {C:inactive}when sold!{}'}
    },
    atlas = 'france',
    rarity = "canadatro_fuck",
    cost = 2,
    pools = {["Messedjokers"] = true, ["Country"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {negativeXmult = 0.5}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.negativeXmult}}
	end,

    calculate = function(self, card, context)
		if context.joker_main then
            return {
                color = G.C.RED,
                message = "X".. card.ability.extra.negativeXmult,
                Xmult_mod = card.ability.extra.negativeXmult,
                }
        end
        if context.selling_self and not context.blueprint_card and not context.retrigger_joker then
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_dollars(math.floor(0.5 * G.GAME.dollars - G.GAME.dollars))
                    return true
                end,
            }))
            return nil, true
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- france
SMODS.Atlas{
    key = 'finland',
    path = 'finland.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'finland',
    loc_txt = {
        name = 'finland^3',
        text = {'{X:mult,C:white}x#1#{} mult',
                'decrease by {X:mult,C:white}x#2#{} after every round'}
    },
    atlas = 'finland',
    rarity = 2,
    cost = 5,
    pools = {["Canadaaddition"] = true, ["Country"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {Xmult = 2, loss = 0.01}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.Xmult, center.ability.extra.loss}}
	end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            if card.ability.extra.Xmult > (1 + card.ability.extra.loss) then
                card.ability.extra.Xmult = (card.ability.extra.Xmult - card.ability.extra.loss)
                return{message = "-" .. card.ability.extra.loss,}
            else
                card:start_dissolve({G.C.RED})
                return{
                    message = "googbye suomi",
                }
            end
        end

        if context.joker_main then
            return{
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = 'X' .. card.ability.extra.Xmult,
            }
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- emilia jump
SMODS.Atlas{
    key = 'canada',
    path = 'canada.png',
    px = 71,
    py = 96,
}

SMODS.Joker{
    key = 'canada',
    loc_txt= {
        name = 'canada',
        text = { "{X:dark_edition,C:white}+^#1#{} mult",
                    "for every {C:dark_edition}canadatro joker{} in your possession",
                    "{C:inactive}(currently {X:dark_edition,C:white}^#2#{C:inactive} mult)",}
    },
    atlas = 'canada',
    rarity = 4,
    cost = 25,
    pools = {["Canadaaddition"] = true, ["Country"] = true},

    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {emult = 0.5, emulttotal=1.5}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.emult, center.ability.extra.emulttotal, }  }
	end,

    calculate = function(self, card, context)
        canadacount = 0
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.Canadaaddition then
            canadacount = canadacount + 1
        end
    end
    card.ability.extra.emulttotal = canadacount * card.ability.extra.emult
    if context.joker_main then
        return {
            message = localize({
                type = "variable",
                key = "a_powmult",
                vars = {
                    number_format(card.ability.extra.emulttotal),
                },
            }),
            Emult_mod = card.ability.extra.emulttotal
        }
    end
    end,

        check_for_unlock = function(self, args)
            if args.type == 'test' then --not a real type, just a joke
                unlock_card(self)
            end
            unlock_card(self) --unlocks the card if it isnt unlocked
        end,
    }  

SMODS.Sound({key = "concidered", path = "concidered.ogg"})

-- concidered
SMODS.Atlas{
    key = 'is6am',
    path = 'is6amconsidered.png',
    px = 70,
    py = 95,
}

SMODS.Joker{
    key = 'is6am',
    loc_txt= {
        name = 'is 6 am concidered night?',
        text = {"{C:red}+#1#{} mult, {C:attention}#2# zloty{}",
                "and {X:chips,C:white}x#3#{} chips",
                "when a {C:blue}6.....{} is scored",
                "{C:inactive}is 6 am concidered night?{}",
    },},
    atlas = 'is6am',
    rarity = 3,
    cost = 6,
    pools = {["Canadaaddition"] = true, ["SixAmJoker"] = true},
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {mult = 6, money = 6, xchips = 1.6}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.mult, center.ability.extra.money, center.ability.extra.xchips }  }
	end,

    calculate = function(self, card, context)
    if context.cardarea == G.play and context.individual and context.other_card then
        local _trigger = false
        if context.other_card:get_id() == 6 then _trigger = true end
        if _trigger == true then
            return {
                mult = card.ability.extra.mult,
                dollars = card.ability.extra.money,
                Xchip_mod = card.ability.extra.xchips,
                message = "is 6 am concidered night?",
                sound = "canadatro_concidered",
            }
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- emilia jump
SMODS.Atlas{
    key = 'emilia',
    path = 'emiliajump.png',
    px = 71,
    py = 96,
}

SMODS.Joker{
    key = 'emilia',
    loc_txt= {
        name = 'emilia jump',
        text = { "{X:mult,C:white}X#1#{} mult",
                    "for every {C:attention}emilia jump{} in your possession",
                    "{C:inactive}(currently {X:mult,C:white}X#2#{C:inactive} mult)",}
    },
    atlas = 'emilia',
    rarity = 2,
    cost = 5,
    pools = {["Canadaaddition"] = true, ["Emiliajump"] = true },

    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {xmult = 1, xmulttotal=1}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.xmult, center.ability.extra.xmulttotal, }  }
	end,

    calculate = function(self, card, context)
    emiliacount = 0
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.Emiliajump then
            emiliacount = emiliacount + 1
        end
    end
    card.ability.extra.xmulttotal = emiliacount * card.ability.extra.xmult
    if context.joker_main then
        return {
            color = G.C.RED,
            message = "x".. card.ability.extra.xmulttotal,
            Xmult_mod = card.ability.extra.xmulttotal
        }
    end
    end,

        check_for_unlock = function(self, args)
            if args.type == 'test' then --not a real type, just a joke
                unlock_card(self)
            end
            unlock_card(self) --unlocks the card if it isnt unlocked
        end,
    }  

SMODS.Sound({key = "yess", path = "dallasyippee.ogg"})
SMODS.Sound({key = "noooo", path = "dallasouch.ogg"})

-- Sisyphus
SMODS.Atlas{
    key = 'dallas',
    path = 'dallas.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'dallas',
    loc_txt= {
        name = 'dallas',
        text = { "{C:green}#4# in #5#{} chance to gain {C:red}+#2# mult every round",
                    "otherwise, lose {C:red}#3# mult every round",
                    "{C:inactive}(currently {C:red}+#1#{C:inactive} Mult)",}
    },
    atlas = 'dallas',
    rarity = 1,
    cost = 3,
    pools = {["Canadaaddition"] = true},
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {mult = 10, additional = 10, negative = 5, chance = 2}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.mult, center.ability.extra.additional, center.ability.extra.negative, G.GAME.probabilities.normal, center.ability.extra.chance }  }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
        end
        if context.setting_blind then
            if pseudorandom('dallas') < (G.GAME.probabilities.normal / card.ability.extra.chance) then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.additional
                return {
                    message = "yippee!",
                    sound = "canadatro_yess",
                }
            else
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.negative
                return {
                    message = "FUCK",
                    sound = "canadatro_noooo",
                }
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- Sisyphus
SMODS.Atlas{
    key = 'gallas',
    path = 'gallas.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'gallas',
    loc_txt= {
        name = 'gallas',
        text = { "{C:green}#4# in #5#{} chance to gain {X:mult,C:white}#2#x{} mult every round",
                    "otherwise, lose {X:mult,C:white}#3#x{} mult every round",
                    "{C:inactive}(currently {X:mult,C:white}#1#x{C:inactive} mult)",}
    },
    atlas = 'gallas',
    rarity = 'canadatro_fuck',
    cost = 5,
    pools = {["Canadaaddition"] = true, ["Messedjokers"] = true},
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {Xmult = 1, additional = 1, negative = 0.25, chance = 10}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult, center.ability.extra.additional, center.ability.extra.negative, G.GAME.probabilities.normal, center.ability.extra.chance }  }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.Xmult
			}
        end
        if context.setting_blind then
            if pseudorandom('dallas') < (G.GAME.probabilities.normal / card.ability.extra.chance) then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.additional
                return {
                    message = "yippee!",
                    sound = "canadatro_yess",
                }
            else
                card.ability.extra.Xmult = card.ability.extra.Xmult - card.ability.extra.negative
                return {
                    message = "FUCK",
                    sound = "canadatro_noooo",
                }
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

SMODS.Sound({key = "pretzels", path = "pretzels.ogg"})
SMODS.Sound({key = "firetrigger", path = "onfuckingfire.ogg"})

-- pretzels on fucking fire
SMODS.Atlas{
    key = 'britishdish',
    path = 'pretzelsonfire.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'britishdish',
    loc_txt = {
        name = 'proper british dish (pt. 35)',
        text = {'gains {C:attention}#2#${} at end of round if {C:red}fire effects{} are triggered',
                '{C:inactive}(currently{} {C:attention}#1#${}{C:inactive}){}'}
    },
    atlas = 'britishdish',
    rarity = 1,
    cost = 3,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {money = 0, money_mod = 2}},

	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.money),
				number_format(center.ability.extra.money_mod),
			},
		}
	end,

    calculate = function(self, card, context)
		if context.joker_main then
			return {
                dollars = card.ability.extra.money,
				message = "pretzels.",
                sound = "canadatro_pretzels",
			}
		end
        if context.end_of_round and context.cardarea == G.jokers then
			if G.ARGS.chip_flames.real_intensity > 0.000001 then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod
			return {
				message = "on fucking fire.",
                sound = "canadatro_firetrigger",
				colour = G.C.FILTER,
			}
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

SMODS.Sound({key = "OH", path = "OH.ogg"})
SMODS.Sound({key = "OHGOD", path = "OHGOD.ogg"})

-- pretzels on fucking fire
SMODS.Atlas{
    key = 'britishdish2',
    path = 'pickles.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'britishdish2',
    loc_txt = {
        name = 'proper british dish (pt. 36)',
        text = {'gains {C:attention}#2#${} at end of round if {C:red}fire effects{} are {C:red}not{} triggered',
                '{C:inactive}(currently{} {C:attention}#1#${}{C:inactive}){}'}
    },
    atlas = 'britishdish2',
    rarity = 1,
    cost = 3,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {money = 0, money_mod = 2}},

	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.money),
				number_format(center.ability.extra.money_mod),
			},
		}
	end,

    calculate = function(self, card, context)
		if context.joker_main then
			return {
                dollars = card.ability.extra.money,
				message = "OH.",
                sound = "canadatro_OH",
			}
		end
        if context.end_of_round and context.cardarea == G.jokers then
			if G.ARGS.chip_flames.real_intensity < 0.000001 then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod
			return {
				message = "OH GOD.",
                sound = "canadatro_OHGOD",
				colour = G.C.FILTER,
			}
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}


-- wall
SMODS.Atlas{
    key = 'loss',
    path = 'lossofnicks.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'loss',
    loc_txt = {
        name = 'loss of nicks',
        text = {'i am at a loss of nicks...',
                '{C:inactive}(has a special interaction with {C:attention}sevens...{C:inactive}){}'}
    },
    atlas = 'loss',
    rarity = 3,
    cost = 10,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    hidden = true,

    pos = {x=0, y= 0},
    config = { extra = {mult = 7, Xmult = 2}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.mult}  }
	end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and context.other_card then
            local _trigger = false
            if context.other_card:get_id() == 7 then _trigger = true end
            if _trigger == true then
                return {
                    message = "i am at a loss..",
                    Xmult_mod = lenient_bignum(card.ability.extra.Xmult),
                }
                end
            end
        end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

SMODS.Sound({key = "thedread", path = "burst.ogg"})

-- Sisyphus
SMODS.Atlas{
    key = 'thedreaded',
    path = '5percent.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'thedreaded',
    loc_txt= {
        name = 'the dreaded 5%',
        text = { "{C:green}#4# in #5#{} chance for {X:mult,C:white}x#1#{} mult and {X:chips,C:white}x#2#{} chips",
                    "but, gain {C:attention}#3#${}",}
    },
    atlas = 'thedreaded',
    rarity = 'canadatro_fuck',
    cost = 5,
    pools = {["Canadaaddition"] = true, ["Messedjokers"] = true},
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {Xmult = 0.25, Xchips = 0.25, money = 15, chance = 20}},

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'canadatro_ideacredit', set = 'Other', vars = { "Remi" }}
		return { vars = { center.ability.extra.Xmult, center.ability.extra.Xchips, center.ability.extra.money, G.GAME.probabilities.normal, center.ability.extra.chance }  }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
            if pseudorandom('thedreaded') < (G.GAME.probabilities.normal / card.ability.extra.chance) then
                return {
                    message = "danteh..",
                    Xmult_mod = card.ability.extra.Xmult,
                    Xchip_mod = card.ability.extra.Xchips,
                    dollars = card.ability.extra.money,
                    sound = 'canadatro_thedread',
                }
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

SMODS.Atlas{
    key = 'whydoesnt',
    path = 'itdontwork.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'whydoesnt',
    loc_txt = {
        name = 'why doesnt it work',
        text = {'when {C:attention}blind{} clicked',
                'set {C:blue}chips{} to 0',
                '{X:mult,C:white}forever{}',
                '{C:green}if {C:blue}chips{} > 50 then',
                '{C:attention}say(i win this trust){}',
                '{C:inactive}]',
                '{C:inactive}]',
                'when {C:green}space{} key pressed',
                'change {C:blue}chips{} by 1',
                '{C:inactive}]'},
    },
    atlas = 'whydoesnt',
    rarity = 'canadatro_fuck',
    cost = 10,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
}

-- wall
SMODS.Atlas{
    key = 'apixel',
    path = 'straypixel.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'apixel',
    loc_txt = {
        name = 'stray pixel',
        text = {'{C:blue} +#1#{} chips',
                '{C:red} +#2#{} mult',
                '{C:attention} +#3#${}'}
    },
    atlas = 'apixel',
    rarity = 1,
    cost = 1,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    hidden = true,

    pos = {x=0, y= 0},
    config = { extra = {chips = 1, mult = 0.1, money = 0.1}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips, center.ability.extra.mult, center.ability.extra.money}  }
	end,

    calculate = function(self, card, context)
    if context.joker_main then
        return 
            {
            chips = card.ability.extra.chips,
            mult = card.ability.extra.mult,
            dollars = card.ability.extra.money,
            }
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- trial joker
SMODS.Atlas{
    key = 'unplasma',
    path = 'unplasmadeck.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'unplasma',
    loc_txt = {
        name = 'unplasma deck',
        text = {'{X:chips,C:white}x#1#{} chips',
                '{X:mult,C:white}x#2#{} mult'}
    },
    atlas = 'unplasma',
    rarity = 'canadatro_fuck',
    cost = 5,
    pools = {["Canadaaddition"] = true, ["Messedjokers"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {Xchips = 2,
    Xmult = 0.5,}},

	loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'canadatro_ideacredit', set = 'Other', vars = { "Remi" }}
		return {
			vars = {
				number_format(center.ability.extra.Xchips),
				number_format(center.ability.extra.Xmult),
			},
		}
	end,

    calculate = function(self, card, context)
		if context.joker_main then
			return {
                message = 'Unbalanced!',
				Xchip_mod = lenient_bignum(card.ability.extra.Xchips),
                Xmult_mod = lenient_bignum(card.ability.extra.Xmult),
			}
		end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

SMODS.Atlas{
    key = 'lerril',
    path = 'lerril.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'lerril',
    loc_txt = {
        name = 'lerril',
        text = {'hi'},
    },
    atlas = 'lerril',
    rarity = 1,
    cost = 1,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chance = 500, money = 973542}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.money, G.GAME.probabilities.normal, center.ability.extra.chance }  }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
            if pseudorandom('lerril') < (G.GAME.probabilities.normal / card.ability.extra.chance) then
                return {
                    message = "just wanted to say hi",
                    dollars = card.ability.extra.money,
                }
            else
                return {
                    message = "hello",
                }
            end
        end
    end,
}

SMODS.Atlas{
    key = 'lirrel',
    path = 'lirrel.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'lirrel',
    loc_txt = {
        name = 'lirrel',
        text = {'BYE'},
    },
    atlas = 'lirrel',
    rarity = 'canadatro_fuck',
    cost = 1,
    pools = {["Canadaaddition"] = true, ["Messedjokers"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chance = 100, money = -1000000000000000000}},

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'canadatro_ideacredit', set = 'Other', vars = { "Ghost/Lerril" }}
		return { vars = {center.ability.extra.money, G.GAME.probabilities.normal, center.ability.extra.chance }  }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
            if pseudorandom('lirrel') < (G.GAME.probabilities.normal / card.ability.extra.chance) then
                return {
                    message = "just DIDNT want to say BYE",
                    dollars = card.ability.extra.money,
                }
            else
                return {
                    message = "GOODBYE",
                }
            end
        end
    end,
}

-- a MEAN country
SMODS.Atlas{
    key = 'vendetta',
    path = 'vendetta.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'vendetta',
    loc_txt = {
        name = 'another vendetta',
        text = {'{C:blue} +27.18281828459045235306287471352662497759995957496696762{} chips',
                '{C:inactive}(do not go home until you finish reciting the value of e){}'}
    },
    atlas = 'vendetta',
    rarity = 1,
    cost = 2,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chips = 27.18281828459045235306287471352662497759995957496696762}},

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'canadatro_ideacredit', set = 'Other', vars = { "Remi" }}
		return { vars = { center.ability.extra.chips}  }
	end,

    calculate = function(self, card, context)
    if context.joker_main then
        return 
            {
            chips = card.ability.extra.chips,
            }
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- a MEAN country
SMODS.Atlas{
    key = 'amrt',
    path = 'amrt.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'amrt',
    loc_txt = {
        name = 'amrt :3',
        text = {'{C:blue}:3{}',
                '{C:red}:3{}',
                '{X:chips,C:white}:3{}'}
    },
    atlas = 'amrt',
    rarity = 'canadatro_amrt',
    cost = 3,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chips = 3}},

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'canadatro_ideacredit', set = 'Other', vars = { "Remi" }}
		return { vars = { center.ability.extra.chips}  }
	end,

    calculate = function(self, card, context)
    if context.joker_main then
        return 
            {
            chips = card.ability.extra.chips,
            }
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- a MEAN country
SMODS.Atlas{
    key = 'unversale',
    path = 'unversale.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'unversale',
    loc_txt = {
        name = 'unversale',
        text = {'retrigger every card {C:attention}#2#{} times',
                'every card gives {X:dark_edition,C:white}^#1#{} {C:blue}chips and {C:red}mult{} when scored'}
    },
    atlas = 'unversale',
    rarity = 'canadatro_deity',
    cost = 185334324,
    pools = {["Deity"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    hidden = true,

    pos = {x=0, y= 0},
    config = { extra = {exponent = 1.15, repetitions = 2}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.exponent, center.ability.extra.repetitions}  }
	end,

    calculate = function(self, card, context)
		if context.repetition then
			if context.cardarea == G.play then
				return {
					message = localize("k_again_ex"),
					repetitions = card.ability.extra.repetitions,
					card = card,
				}
			    end
		    elseif context.individual then
			    if context.cardarea == G.play then
				    return {
                        message = localize({
                            type = "variable",
                            key = "a_powmultchips",
                            vars = {
                                number_format(card.ability.extra.exponent),
                            },
                        }),
                        Emult_mod = lenient_bignum(card.ability.extra.exponent),
                        Echip_mod = lenient_bignum(card.ability.extra.exponent),
                        colour = G.C.DARK_EDITION,
					    card = card,
				    }
			        end
		        end
            end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- devesto
SMODS.Atlas{
    key = 'step3',
    path = 'step3.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'step3',
    loc_txt = {
        name = 'step 3',
        text = {'{C:dark_edition}a simple ending to your run!{'}
    },
    atlas = 'step3',
    rarity = 'canadatro_fuck',
    cost = 3,
    pools = {["Canadaaddition"] = true, ["Messedjokers"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},

    calculate = function(self, card, context)
        if context.end_of_round then
            SMODS.restart_game() 
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- Sisyphus
SMODS.Atlas{
    key = 'humpscare',
    path = 'humpscare.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'humpscare',
    loc_txt= {
        name = 'humpscare',
        text = { "{C:green}#1# in #2#{} chance for {C:dark_edition}something{} to happen",}
    },
    atlas = 'humpscare',
    rarity = 1,
    cost = 4,
    pools = {["Canadaaddition"] = true},
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chance = 10}},

    loc_vars = function(self, info_queue, center)
		return { vars = {G.GAME.probabilities.normal, center.ability.extra.chance }  }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
            if pseudorandom('humpscare') < (G.GAME.probabilities.normal / card.ability.extra.chance) then
                G.showhumpscare = 10
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- pretzels on fucking fire
SMODS.Atlas{
    key = 'badge',
    path = 'badgeofhonor.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'badge',
    loc_txt = {
        name = 'badge of honor',
        text = {'gain {C:attention}#1#${}',
                'if blind was defeated with {C:red}FIRE...{}'}
    },
    atlas = 'badge',
    rarity = 1,
    cost = 3,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {money = 5}},

	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.money),
			},
		}
	end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
			if G.ARGS.chip_flames.real_intensity > 0.000001 then
                return {
                    dollars = card.ability.extra.money
                }
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- a MEAN country
SMODS.Atlas{
    key = 'color4',
    path = 'color4.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'color4',
    loc_txt = {
        name = 'color 4',
        text = {'{C:blue}+#1#{} chips',
                '{C:red}+#2#{} mult',
                '{C:attention}+#3#${}',
                'and {C:attention}+#3#${} more',
                '{C:inactive}(thats a letter.){}'}
    },
    atlas = 'color4',
    rarity = 2,
    cost = 4,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chips = 44, mult = 4, money1 = 4, money2 = 8}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips, center.ability.extra.mult, center.ability.extra.money1, center.ability.extra.money2}  }
	end,

    calculate = function(self, card, context)
    if context.joker_main then
        return 
            {
            chips = card.ability.extra.chips,
            mult = card.ability.extra.mult,
            dollars = card.ability.extra.money2,
            }
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

SMODS.Sound({key = "guarded", path = "ROYALGUARD.ogg"})

-- a MEAN country
SMODS.Atlas{
    key = 'royalguard',
    path = 'royalguard.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'royalguard',
    loc_txt = {
        name = 'royal guard',
        text = {'{X:chips,C:white}x#1#{} chips and {X:mult,C:white}x#2#{} mult on {C:attention}boss blind{}',
                '{C:inactive}(self-destructs after boss blind){}'}
    },
    atlas = 'royalguard',
    rarity = 2,
    cost = 6,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {xchips = 10, xmult = 10}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.xchips, center.ability.extra.xmult}}
	end,

    calculate = function(self, card, context)
    if context.joker_main and (G.GAME.blind:get_type() == 'Boss') then
        return 
            {
            Xchip_mod = card.ability.extra.xchips,
            Xmult_mod = card.ability.extra.xmult,
            message = 'ROYAL GUARD!',
            sound = 'canadatro_guarded',
            }
        end
        if context.end_of_round and (G.GAME.blind:get_type() == 'Boss') then
            card:start_dissolve({G.C.RED})
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- a MEAN country
SMODS.Atlas{
    key = 'awe',
    path = 'awe.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'awe',
    loc_txt = {
        name = 'awe',
        text = {'sell this joker to gain {C:attention}#2#{} campfire(s)',
                'increases by {C:attention}#1#{} after every round'}
    },
    atlas = 'awe',
    rarity = 2,
    cost = 6,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {amount = 0, amount_mod = 1}, immutable = {max_amount = 200}},

	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_campfire
		return {
			vars = {
				math.max(1, center.ability.extra.amount_mod),
				math.min(center.ability.immutable.max_amount, math.floor(center.ability.extra.amount)),
			},
		}
	end,

    calculate = function(self, card, context)
		if
			context.end_of_round
			and to_big(card.ability.extra.amount) < to_big(card.ability.immutable.max_amount)
			and not (context.individual or context.repetition or context.blueprint)
		then
			card.ability.extra.amount =
				lenient_bignum(card.ability.extra.amount + math.max(1, to_big(card.ability.extra.amount_mod)))
			if to_big(card.ability.extra.amount) > to_big(card.ability.immutable.max_amount) then
				card.ability.extra.amount = lenient_bignum(card.ability.immutable.max_amount)
			end
			return nil, true
		end
		if
			context.selling_self
			and not (context.blueprint or context.retrigger_joker_check or context.retrigger_joker)
			and to_big(card.ability.extra.amount) > to_big(0)
		then
			for i = 1, math.min(card.ability.immutable.max_amount, math.floor(card.ability.extra.amount)) do
				local campfires = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_campfire")
				campfires:add_to_deck()
				G.jokers:emplace(campfires)
			end
		end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- a MEAN country
SMODS.Atlas{
    key = 'joeseppe',
    path = 'joeseppe.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'joeseppe',
    loc_txt = {
        name = 'joeseppe',
        text = {'{C:blue}+#1#{} chips, {C:red}+#2#{} mult',
                '{X:chips,C:white}x#3#{} chips, {X:mult,C:white}x#4#{} mult,',
                'earn {C:attention}#5#${} at the end of the round',
                '{C:inactive}an amalgamation..{}'}
    },
    atlas = 'joeseppe',
    rarity = 4,
    cost = 25,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chips = 500, mult = 250, xchips = 7.5, xmult = 5, money = 25}},

    loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.chips, center.ability.extra.mult, center.ability.extra.xchips, center.ability.extra.xmult, center.ability.extra.money}}
	end,

    calculate = function(self, card, context)
    if context.joker_main then
        return 
            {
            chips = card.ability.extra.chips,
            mult = card.ability.extra.mult,
            Xchip_mod = card.ability.extra.xchips,
            Xmult_mod = card.ability.extra.xmult,
            }
        end
    end,

    calc_dollar_bonus = function(self,card)
        return card.ability.extra.money
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- a MEAN country
SMODS.Atlas{
    key = 'alook',
    path = 'letstakealook.png',
    px = 71,
    py = 95,
}

SMODS.Joker {
    key = "alook",
    loc_txt = {
        name = 'LETS TAKE A LOOK...',
        text = {'retrigger {C:attention}leftmost{} and',
                '{C:attention}rightmost{} jokers {C:attention}#1#{} times'}
    },
    rarity = 'canadatro_hepten',
    cost = 40,
    blueprint_compat = false,
    unlocked = true,
	discovered = true,
    eternal_compat = true,
    pools = { ["Canadaaddition"] = true },
    atlas = "alook",
    pos = { x = 0, y = 0 },
    config = {extra = {repetitions = 5}},
    loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.repetitions}}
	end,
    calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if context.other_card == (G.jokers.cards[1].debuff and G.jokers.cards[2] or G.jokers.cards[1]) or context.other_card == ((G.jokers.cards[#G.jokers.cards].debuff and G.jokers.cards[#G.jokers.cards - 1]) and G.jokers.cards[#G.jokers.cards - 1] or G.jokers.cards[#G.jokers.cards]) then
				return {
					message = localize('k_again_ex'),
					repetitions = card.ability.extra.repetitions,
					card = card
				}
			else
				return nil, true
			end
        end
	end
}

-- a MEAN country
SMODS.Atlas{
    key = 'starwalker',
    path = 'starwalker.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'starwalker',
    loc_txt = {
        name = 'starwalker',
        text = {'scored {C:attention}diamonds{} give {X:mult,C:white}x#1#{} mult'}
    },
    atlas = 'starwalker',
    rarity = 2,
    cost = 6,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    hidden = true,

    pos = {x=0, y= 0},
    config = { extra = {xmult = 1.3, suit = "Diamonds"}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.xmult}  }
	end,

    calculate = function(self, card, context)
            if context.cardarea == G.play and context.individual and context.other_card then
                local _trigger = false
                if context.other_card:is_suit(card.ability.extra.suit) then _trigger = true end
                if _trigger == true then
                    return {
                        message = "STAR WALK  ER",
                        Xmult_mod = card.ability.extra.xmult,
                    }
                    end
                end
            end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- trigonometry
SMODS.Atlas{
    key = 'squidgame',
    path = 'squidgame.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'squidgame',
    loc_txt = {
        name = 'squid game gif',
        text = {'IF WE WIN WHAT DO WE GET',
                '{C:attention}#1# robux{}'}
    },
    atlas = 'squidgame',
    rarity = 1,
    cost = 3,
    pools = {["Canadaaddition"] = true},

    pixel_size = { w = 71 , h = 95 },
    frame = 0,

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {dollar = 4}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.dollar}}
	end,

    calc_dollar_bonus = function(self,card)
        return card.ability.extra.dollar
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- trigonometry
SMODS.Atlas{
    key = 'dough',
    path = 'dough.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'dough',
    loc_txt = {
        name = 'dough',
        text = {'{C:red}+#1#{} mult',
                '{C:inactive}(transforms into {C:dark_edition}donut {C:inactive}in {C:attention}#2#{C:inactive} rounds){}'}
    },
    atlas = 'dough',
    rarity = 2,
    cost = 3,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {mult = 1, roundsleft = 10, loss = 1}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.mult, center.ability.extra.roundsleft}}
	end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            if card.ability.extra.roundsleft > (1 + card.ability.extra.loss) then
                card.ability.extra.roundsleft = (card.ability.extra.roundsleft - card.ability.extra.loss)
                return{message = card.ability.extra.roundsleft .. "rounds left!"}
            else
                local donutcreation = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_canadatro_donut')
				donutcreation:add_to_deck()
				G.jokers:emplace(donutcreation)
                card:start_dissolve({G.C.RED})
                return{
                    message = "baked a donut for you!",
                }
            end
        end

        if context.joker_main then
            return 
                {
                mult = card.ability.extra.mult,
                }
            end
        end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- france
SMODS.Atlas{
    key = 'donut',
    path = 'donut.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'donut',
    loc_txt = {
        name = 'donut',
        text = {'{X:mult,C:white}x#1#{} mult',
                'gain {X:mult,C:white}x#2#{} mult per {C:attention}country joker{}',
                'summon a {C:dark_edition}negative {C:attention}finland^3{} at the end of the round',
                '{C:inactive}(currently {X:mult,C:white}x#3#{C:inactive} mult){}'}
    },
    atlas = 'donut',
    rarity = 'canadatro_deity',
    cost = 12839812598,
    pools = {["Deity"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    pos = {x=0, y= 0},
    soul_pos = { x = 0, y = 1 },
    config = {extra = {Xmult = 5, Xmultgain = 1, Xmulttotal = 5}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.Xmult, center.ability.extra.Xmultgain, center.ability.extra.Xmulttotal}}
	end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            if #G.jokers.cards <= G.jokers.config.card_limit then
                local finlandia = create_card('Joker', G.Jokers, nil, nil, nil, nil, 'j_canadatro_finland')
                finlandia:set_edition({ negative = true })
                finlandia:add_to_deck()
                G.jokers:emplace(finlandia)
                return {
                    message = "FINLAND FOREVER!!",    
                }
            end
        end

        finlandcount = 0
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.Country then
                finlandcount = finlandcount + 1
            end
        end
        card.ability.extra.Xmulttotal = finlandcount + card.ability.extra.Xmult

        if context.joker_main then
            return{
                card = card,
                Xmult_mod = card.ability.extra.Xmulttotal,
                message = 'X' .. card.ability.extra.Xmulttotal,
            }
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- trigonometry
SMODS.Atlas{
    key = 'butterfinger',
    path = 'butterfinger.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'butterfinger',
    loc_txt = {
        name = 'butterfinger in orlando',
        text = {'either gives',
                '{C:blue}+#1#{} chips',
                'or {C:red}+#2#{} mult'}
    },
    atlas = 'butterfinger',
    rarity = 1,
    cost = 3,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {chips = 40, mult = 5}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.chips, center.ability.extra.mult}}
	end,

    calculate = function(self, card, context)
        if context.joker_main then
            if math.random(1,2) == 1 then
                return {
                    color = G.C.BLUE,
                    message = "+".. card.ability.extra.chips,
                    chip_mod = card.ability.extra.chips
                }
            else
                return {
                    color = G.C.RED,
                    message = "+".. card.ability.extra.mult,
                    mult_mod = card.ability.extra.mult
                }
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- trigonometry
SMODS.Atlas{
    key = 'conciderance',
    path = 'conciderance.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'conciderance',
    loc_txt = {
        name = 'conciderance',
        text = {'retrigger scored {C:green}6s...{}',
                '{C:attention}#1#...{} times'}
    },
    atlas = 'conciderance',
    rarity = 'canadatro_hepten',
    cost = 40,
    pools = {["Canadaaddition"] = true, ["SixAmJoker"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {retriggers = 6}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.retriggers}}
	end,

	calculate = function(self, card, context)
		if context.repetition then
			if context.cardarea == G.play then
				if context.other_card:get_id() == 6 then
					return {
						message = localize("k_again_ex"),
						repetitions = card.ability.extra.retriggers,
						card = card,
					}
				end
			end
		end
	end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- devesto
SMODS.Atlas{
    key = 'roberto',
    path = 'roberto.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'roberto',
    loc_txt = {
        name = 'roberto',
        text = {'placeholder, HOWEVER has to be the most powerful joker in the mod'}
    },
    atlas = 'roberto',
    rarity = 'canadatro_deity',
    cost = 521357129379273876,
    pools = {["Deity"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {placeholder = "true!"}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.placeholder}}
	end,
    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- devesto
SMODS.Atlas{
    key = 'balatroirl',
    path = 'balatroirl.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'balatroirl',
    loc_txt = {
        name = 'balatro in real life',
        text = {'slows the game down to {C:attention}0.25x{}',
                'while its in your inventory',
                'also can sometimes subtract {C:red}mult{} due to a miscalculation'}
    },
    atlas = 'balatroirl',
    rarity = 'canadatro_fuck',
    cost = 1,
    pools = {["Canadaaddition"] = true, ["Messedjokers"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {mult = 50, chance = 6}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.chance, center.ability.extra.mult}}
	end,

    calculate = function(self, card, context)
        if context.joker_main then
            if pseudorandom('balatroirl') < (G.GAME.probabilities.normal / card.ability.extra.chance) then
                return {
                    mult = card.ability.extra.mult,
                }
            end
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- devesto
SMODS.Atlas{
    key = 'melanie',
    path = 'melanie.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'melanie',
    loc_txt = {
        name = 'melanie',
        text = {'steel cards give extra {X:mult,C:white}x#1#{} mult'}
    },
    atlas = 'melanie',
    rarity = 1,
    cost = 4,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    hidden = true,

    pos = {x=0, y= 0},
    config = { extra = {steelenhc = 1.25}},

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'canadatro_bothcredit', set = 'Other', vars = { "sinnvakr" }}
		return { vars = {center.ability.extra.steelenhc}  }
	end,

    calculate = function(self, card, context)
        if context.individual
            and context.cardarea == G.hand
            and not context.end_of_round
            and SMODS.has_enhancement(context.other_card, "m_steel")
            and to_big(card.ability.extra.steelenhc) ~= to_big(1)
        then
            if context.other_card.debuff then
                return {
                    message = localize("k_debuffed"),
                    colour = G.C.RED,
                    card = card,
                }
            else
                return { xmult = lenient_bignum(card.ability.extra.steelenhc) }
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- seven7nseven (EFFECT NOT IMPLEMENTED YET)
SMODS.Atlas{
    key = 'seven7nseven',
    path = 'seven7n77.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'seven7nseven',
    loc_txt = {
        name = 'seven7nseven',
        text = {'retrigger scored {C:attention}7s{} {C:green}#2#{} times',
                '{C:attention}7s{} give {X:dark_edition,C:white}x#1#{} {C:red}mult{} + {C:blue}chips{} and {C:attention}#3#${} when scored',
                '{C:inactive}of course a dev self insert has the best art..{}'}
    },
    atlas = 'seven7nseven',
    rarity = 'canadatro_deity',
    cost = 7777777777777777777,
    pools = {["Deity"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    soul_pos = { x = 0, y = 1 },
    config = {extra = {retriggers = 7, multiplier = 7, dollars = 77}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.multiplier, center.ability.extra.retriggers, center.ability.extra.dollars}}
	end,

    calculate = function(self, card, context)
		if context.repetition then
			if context.cardarea == G.play then
				if context.other_card:get_id() == 7 then
					return {
                        message = localize({
                            type = "variable",
                            key = "a_xmult_chips",
                            vars = { number_format(card.ability.extra.multiplier) },
                        }),
                        Xmult_mod = card.ability.extra.multiplier,
                        Xchip_mod = card.ability.extra.multiplier,
                        dollars = card.ability.extra.dollars,
						repetitions = card.ability.extra.retriggers,
                        card = card,
					}
				end
			end
		end
	end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

-- seven7nseven (EFFECT NOT IMPLEMENTED YET)
SMODS.Atlas{
    key = 'collectmypages',
    path = 'collectmypages.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'collectmypages',
    loc_txt = {
        name = 'COLLECT MY 7 PAGES...',
        text = {'gains {C:blue}+#1#{} chips per scored {C:dark_edition}PAGE.',
                '{C:inactive}(currently {C:blue}+#2# {C:inactive}chips){}'}
    },
    atlas = 'collectmypages',
    rarity = 2,
    cost = 6,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    hidden = true,

    pos = {x=0, y= 0},
    config = { extra = {chip_mod = 10, chips = 0}},

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'canadatro_ideacredit', set = 'Other', vars = { "kalp" }}
		return { vars = {center.ability.extra.chip_mod, center.ability.extra.chips}  }
	end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
			if context.other_card.seal == "canadatro_pageseal" then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            end
		end
        if context.joker_main then
            return 
                {
                chips = card.ability.extra.chips,
                }
            end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

SMODS.Joker{
    key = 'placeholderjoker',
    loc_txt = {
        name = 'placeholder joker',
        text = {'placeholder joker for effect testing',
                'todays effect: nothing'}
    },
    atlas = 'apixel',
    rarity = 1,
    cost = 1,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    hidden = true,

    pos = {x=0, y= 0},
    config = { extra = {chip_mod = 10, chips = 0}},

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'canadatro_artcredit', set = 'Other', vars = { "blabla" }}
        info_queue[#info_queue+1] = {key = 'canadatro_ideacredit', set = 'Other', vars = { "blabla" }}
		return { vars = {center.ability.extra.chip_mod, center.ability.extra.chips}  }
	end,

    --calculate = function(self, card, context)
    --end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

SMODS.Atlas{
    key = 'ps3',
    path = 'ps3.png',
    px = 71,
    py = 95,
}

SMODS.Sound({key = "ps3beep", path = "ps3.wav"})
SMODS.Sound({key = "ps3tbeep", path = "ps3_tbeep.wav"})

G._yellowness = 0
G.yellowness = 0

SMODS.Joker{
    key = 'ps3',
    loc_txt = {
        name = 'fat playstation 3',
        text = {'{X:mult,C:white} X#1#{} mult, {C:green}#2# in #3#{} chance for the game to get more {B:1,C:white}yellow{} tinted',
                '{C:inactive}those who bumpgate{}'}
    },
    atlas = 'ps3',
    rarity = 2,
    cost = 1,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    hidden = true,

    pos = {x=0, y= 0},
    config = { extra = { Xmult_mod = 8, odds = 4} },

    loc_vars = function(self, info_queue, center)
        return { vars = {
            number_format(center.ability.extra.Xmult_mod), 
            number_format(G.GAME.probabilities.normal), 
            number_format(center.ability.extra.odds), 
            colours = { HEX('FFC652') }
        }}
    end,

   calculate = function(self, card, context)
        if context.joker_main then
            if pseudorandom('ps3') < (G.GAME.probabilities.normal / card.ability.extra.odds) then
                return {
                    message = "#bumpgate",
                    sound = "canadatro_ps3tbeep",
                    colour = G.C.FILTER,
                    -- Xmult_mod = lenient_bignum(card.ability.extra.Xmult_mod),
                    func = function()
                        self.pos.x = 1
                        G._yellowness = G._yellowness + 0.05;
                        print('wawa')
                        G.E_MANAGER:add_event(Event({
                            trigger = "after", 
                            delay = 5, 
                            func = function() 
                                self.pos.x = 0
                                return true 
                            end,
                            blocking = false
                        }))
                    end
                }
            end
            return {
                message = localize({
                    type = "variable",
                    key = "a_xmult",
                    vars = { number_format(card.ability.extra.Xmult_mod) },
                }),
                sound = "canadatro_ps3beep",
                Xmult_mod = lenient_bignum(card.ability.extra.Xmult_mod),
            }
        end
   end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}


function getJokerID(card)
    if G.jokers then
        local _selfid = 0
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then _selfid = i end
        end
        return _selfid
    end
end

function jokerExists(abilityname)
    local _check = false
    if G.jokers and G.jokers.cards then
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.name == abilityname then _check = true end
        end
    end
    return _check
end

function decrementingTickEvent(type,tick)
    if type == "j_canadatro_squidgame" then
        if math.fmod(Canadatro.ticks,12) == 0 then
            local _subcardcenter = G.P_CENTERS.j_canadatro_squidgame
            _subcardcenter.frame = _subcardcenter.frame + 1
            local _fr = _subcardcenter.frame
            _subcardcenter.pos.x = math.fmod(_fr,5)
            _subcardcenter.pos.y = math.floor(_fr/5)
            if _subcardcenter.frame > 12 then _subcardcenter.frame = 0 end
        end
    end
end

function llerp(v0, v1, t)
    return (1 - t) * v0 + t * v1;
end

local upd = Game.update
function Game:update(dt)
    upd(self, dt)

    -- tick based events
    if Canadatro.ticks == nil then Canadatro.ticks = 0 end
    if Canadatro.dtcounter == nil then Canadatro.dtcounter = 0 end
    Canadatro.dtcounter = Canadatro.dtcounter+dt
    Canadatro.dt = dt
    
    while Canadatro.dtcounter >= 0.010 do
        Canadatro.ticks = Canadatro.ticks + 1
        Canadatro.dtcounter = Canadatro.dtcounter - 0.010

        if jokerExists("j_canadatro_squidgame") then decrementingTickEvent("j_canadatro_squidgame",0) end

        if G.showthumbsup and G.showthumbsup > 0 then G.showthumbsup = G.showthumbsup - 1 end

        if G.showthumbsdown and G.showthumbsdown > 0 then G.showthumbsdown = G.showthumbsdown - 1 end

        if G.showhumpscare and G.showhumpscare > 0 then G.showhumpscare = G.showhumpscare - 1 end

        if G.showgradient and G.showgradient > 0 then G.showgradient = G.showgradient - 1 end
    end

    if G.jokers then
        if jokerExists("j_canadatro_balatroirl") then
            G.SETTINGS.GAMESPEED = 0.25
        else
            if G.GAME.normalgamespeed == nil and G.SETTINGS.GAMESPEED ~= 0.25 then G.GAME.normalgamespeed = G.SETTINGS.GAMESPEED end
        end
    end

    G.yellowness = llerp(G.yellowness, G._yellowness, dt * G.SETTINGS.GAMESPEED)
end

local drawhook = love.draw
function love.draw()
    local _xscale = love.graphics.getWidth()/1920
    local _yscale = love.graphics.getHeight()/1080
    love.graphics.clear()
    love.graphics.setBlendMode('alpha')
    drawhook()

    function loadImagePlease(fn)
        local full_path = (Canadatro.path 
        .. "canadatroimages/" .. fn)
        local file_data = assert(NFS.newFileData(full_path),("Epic fail"))
        local tempimagedata = assert(love.image.newImageData(file_data),("Epic fail 2"))
        --print ("LTFNI: Successfully loaded " .. fn)
        return (assert(love.graphics.newImage(tempimagedata),("Epic fail 3")))
    end

    -- cantaloupe
    if G.showthumbsup and (G.showthumbsup > 0) then
        if Canadatro.thumbsup == nil then Canadatro.thumbsup = loadImagePlease("goodjob.png") end
        love.graphics.setColor(1, 1, 1, 1) 
        love.graphics.draw(Canadatro.thumbsup, 0*_xscale*2, 0*_yscale*2,0,_xscale*2*2,_yscale*2*2)
    end

    -- cantaloupe
    if G.showthumbsdown and (G.showthumbsdown > 0) then
        if Canadatro.thumbsdown == nil then Canadatro.thumbsdown = loadImagePlease("fuckyou.png") end
        love.graphics.setColor(1, 1, 1, 1) 
        love.graphics.draw(Canadatro.thumbsdown, 0*_xscale*2, 0*_yscale*2,0,_xscale*2*2,_yscale*2*2)
    end

        -- cantaloupe
    if G.showhumpscare and (G.showhumpscare > 0) then
        if Canadatro.humpscare == nil then Canadatro.humpscare = loadImagePlease("humpscare.png") end
        love.graphics.setColor(1, 1, 1, 1) 
        love.graphics.draw(Canadatro.humpscare, 0*_xscale*2, 0*_yscale*2,0,_xscale*2*2,_yscale*2*2)
    end

    if G.showgradient and (G.showgradient > 0) then
        if Canadatro.showgradient == nil then Canadatro.showgradient = loadImagePlease("gradient.png") end
        love.graphics.setColor(1, 1, 1, 1) 
        love.graphics.draw(Canadatro.showgradient, 0*_xscale*2, 0*_yscale*2,0,_xscale*2*2,_yscale*2*2)
    end


    love.graphics.setBlendMode('lighten', 'premultiplied')
    love.graphics.setColor((255 / 255) * G.yellowness, (198 / 255) * G.yellowness, (82 / 255) * G.yellowness, G.yellowness)
    love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end
----------------------------------------------
------------MOD CODE END----------------------