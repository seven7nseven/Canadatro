SMODS.Atlas{
    key = 'ginormous',
    path = 'ginormousblind.png',
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Sound({key = "ginormous", path = "ginormous.ogg"})
SMODS.Sound({key = "gradient", path = "gradient.ogg"})

SMODS.Blind {
    name = "boss_ginormous",
    key = "boss_ginormous",
    atlas = "ginormous",
    pos = { y = 0 },
    dollars = 15,
    mult = 10,
    loc_txt = {
        name = 'guys this orange...',
        text = {
            'its ginamourasourus,',
            'whateva you say',
        }
    },
    boss = {  min = 3 },
    boss_colour = HEX('e28743'),

    set_blind= function(self)
        play_sound("canadatro_ginormous")
    end,   
}

SMODS.Atlas{
    key = 'its6amblind',
    path = 'its6amblind.png',
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind {
    name = "boss_6am",
    key = "boss_6am",
    atlas = "its6amblind",
    pos = { y = 0 },
    dollars = 10,
    mult = 6,
    loc_txt = {
        name = 'ITS F###### 6 AM!!!',
        text = {
            'debuffs ALL',
            '6 am jokers',
        }
    },
    boss = {  min = 3 },
    boss_colour = HEX('2a2a2e'),

    recalc_debuff = function(self, card)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.SixAmJoker then
                G.jokers.cards[i]:set_debuff(true)
            end
        end
    end,

    disable = function(self)
       for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
       end
    end,

    defeat = function(self)
       for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
       end
    end,
}

SMODS.Atlas{
    key = 'franceblind',
    path = 'franceblind.png',
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind {
    name = "boss_franceblind",
    key = "boss_franceblind",
    atlas = "franceblind",
    pos = { y = 0 },
    dollars = 12,
    mult = 5,
    loc_txt = {
        name = 'FRANCE^10',
        text = {
            'debuffs ALL',
            'canadatro jokers',
        }
    },
    boss = {  min = 4 },
    boss_colour = HEX('b63030'),

    recalc_debuff = function(self, card)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.Canadaaddition then
                G.jokers.cards[i]:set_debuff(true)
            end
        end
    end,

    disable = function(self)
       for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
       end
    end,

    defeat = function(self)
       for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
       end
    end,
}

SMODS.Atlas{
    key = 'unpleasantgradient',
    path = 'unpleasantgradient.png',
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind {
    name = "boss_unpleasantgradient",
    key = "boss_unpleasantgradient",
    atlas = "unpleasantgradient",
    pos = { y = 0 },
    dollars = 9.5,
    mult = 1.9999,
    loc_txt = {
        name = 'unpleasant gradient',
        text = {
            'WHY IS THIS ASSHOLE HERE',
            'WHY ARE YOU HERE',
            'GET OUTTA MY FUCKING PORCH',
            'WHAT THE FUCK IS WRONG WITH YOU!!!',
        }
    },
    boss = {  min = 3 },
    boss_colour = HEX('fd2ef6'),

    debuff_hand = function(self)
        for i = 1, #G.play.cards do
            if G.play.cards[i].edition == nil then
                SMODS.juice_up_blind()
                G.play.cards[i]:set_edition({canadatro_unpleasant = true}, true)
                play_sound("canadatro_gradient")
                delay(0.3)
            end
        end
        G.showgradient = 175
        play_sound("canadatro_gradient")
        end,
    
    set_blind= function(self)
        G.showgradient = 175
        play_sound("canadatro_gradient")
    end,
}