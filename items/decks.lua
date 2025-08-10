SMODS.Atlas{
    key = 'deckof6',
    path = 'deckof6.png',
    px = 71,
    py = 95,
}

SMODS.Back{
    key = "6amdeck",
    loc_txt = {
        name = "the deck that you play at 6 am",
        text={
        "start with a negative",
        "{C:red}is 6 am considered night?{}",
        "and a deck full of {C:attention}SIXES{}",
        },
    },
	
	config = {only_one_rank = '6'},
	pos = { x = 0, y = 0 },
	order = 1,
	atlas = "deckof6",
    unlocked = true,

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_canadatro_is6am", "canadatro_deck")
                card:set_edition({ negative = true })
                card:add_to_deck()
                --card:start_materialize()
                G.jokers:emplace(card)

                for _, card in ipairs(G.playing_cards) do
                    assert(SMODS.change_base(card, nil, self.config.only_one_rank))
                end
                return true
            end
        }))
    end,

    check_for_unlock = function(self, args)
		if args.type == "win_deck" then
            unlock_card(self)
        else
			unlock_card(self)
		end
	end,
}