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
    pools = {["Canadaaddition"] = true, ["Messedjokers"] = true},

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
    pools = {["Canadaaddition"] = true},

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
    pools = {["Canadaaddition"] = true},

    
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
                    number_format(card.ability.extra.emult),
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
        text = {"{C:red}+#1#{} mult and {C:attention}6 zloty{}",
                "when a {C:blue}6.....{} is scored",
                "{C:inactive}is 6 am concidered night?{}",
    },},
    atlas = 'is6am',
    rarity = 2,
    cost = 6,
    pools = {["Canadaaddition"] = true},
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {mult = 6, money = 6}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.mult, center.ability.extra.Xmult }  }
	end,

    calculate = function(self, card, context)
    if context.cardarea == G.play and context.individual and context.other_card then
        local _trigger = false
        if context.other_card:get_id() == 6 then _trigger = true end
        if _trigger == true then
            return {
                mult = card.ability.extra.mult,
                dollars = card.ability.extra.money,
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
    key = 'evillerril',
    path = 'evillerril.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'evillerril',
    loc_txt = {
        name = 'lirrel',
        text = {'BYE'},
    },
    atlas = 'evillerril',
    rarity = "Canadatro_fuck",
    cost = 1,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chance = 500, money = -973542}},

    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.money, G.GAME.probabilities.normal, center.ability.extra.chance }  }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
            if pseudorandom('evillerril') < (G.GAME.probabilities.normal / card.ability.extra.chance) then
                return {
                    message = "just wanted to say BYE",
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
                '{X:chip,C:white}:3{}'}
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
    rarity = 'canadatro_unversale',
    cost = 185334324,
    pools = {["Canadaaddition"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    hidden = true,

    pos = {x=0, y= 0},
    config = { extra = {exponent = 1.5, repetitions = 5}},

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

        if G.showthumbsup and G.showthumbsup > 0 then G.showthumbsup = G.showthumbsup - 1 end

        if G.showthumbsdown and G.showthumbsdown > 0 then G.showthumbsdown = G.showthumbsdown - 1 end

        if G.showhumpscare and G.showhumpscare > 0 then G.showhumpscare = G.showhumpscare - 1 end
    end
end

local drawhook = love.draw
function love.draw()
    drawhook()

    function loadImagePlease(fn)
        local full_path = (Canadatro.path 
        .. "canadatroimages/" .. fn)
        local file_data = assert(NFS.newFileData(full_path),("Epic fail"))
        local tempimagedata = assert(love.image.newImageData(file_data),("Epic fail 2"))
        --print ("LTFNI: Successfully loaded " .. fn)
        return (assert(love.graphics.newImage(tempimagedata),("Epic fail 3")))
    end

    local _xscale = love.graphics.getWidth()/1920
    local _yscale = love.graphics.getHeight()/1080

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
end
----------------------------------------------
------------MOD CODE END----------------------