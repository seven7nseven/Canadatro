SMODS.Atlas{
    key = 'ginormous',
    path = 'ginormousblind.png',
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Sound({key = "ginormous", path = "ginormous.ogg"})

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