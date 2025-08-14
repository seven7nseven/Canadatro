SMODS.Sound({key = "truck", path = "trucktrigger.ogg",})

SMODS.Atlas {
    key = "truck_seal",
    path = "itaintmyfault.png",
    px = 71,
    py = 96
}

SMODS.Seal {
    name = "truckseal",
    key = "truckseal",
    badge_colour = HEX("ff7676"),
	config = {Xchips = 1.5, mult = 3},
    loc_txt = {
        -- Badge name (displayed on card description when seal is applied)
        label = 'truck seal',
        -- Tooltip description
        name = 'truck seal',
        text = {
            '{X:chips,C:white}X#1#{} chips',
            '{C:mult}+#2#{} mult',
        }
    },


    sound = { sound = 'canadatro_truck', per = 1, vol = 0.4 },

    loc_vars = function(self, info_queue)
        return { vars = {self.config.Xchips, self.config.mult} }
    end,
    atlas = "truck_seal",
    pos = {x=0, y=0},

    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- main_scoring context is used whenever the card is scored
        
        if context.main_scoring and context.cardarea == G.play then
            return {
                G.E_MANAGER:add_event(Event({func = function()
                play_sound('canadatro_truck')
                return true end })),
                
                message = "it aint my fault!",
                mult = self.config.mult,
                Xchip_mod = self.config.Xchips,
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

SMODS.Atlas {
    key = "page_seal",
    path = "pageseal.png",
    px = 71,
    py = 96
}

SMODS.Seal {
    name = "pageseal",
    key = "pageseal",
    badge_colour = HEX("ff7676"),
	config = {chips = 45},
    loc_txt = {
        -- Badge name (displayed on card description when seal is applied)
        label = 'page',
        -- Tooltip description
        name = 'page',
        text = {
            '{C:blue}+#1#{} chips',
            '{C:inactive}collect my pages..{}'
        }
    },

    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = {key = 'canadatro_ideacredit', set = 'Other', vars = { "kalp" }}
        return { vars = {self.config.chips} }
    end,
    atlas = "page_seal",
    pos = {x=0, y=0},

    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- main_scoring context is used whenever the card is scored
        
        if context.main_scoring and context.cardarea == G.play then
            return {
                G.E_MANAGER:add_event(Event({func = function()
                return true end })),
                chips = self.config.chips,
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