SMODS.Shader({ key = 'unpleasant', path = 'unpleasant.fs' })

SMODS.Edition({
	key = "unpleasant",
	order = 2,
	loc_txt = {
		name = "unpleasant",
		label = "unpleasant",
		text = {
			"{X:mult,C:white} X#1#{} mult",
			"{X:chips,C:white} X#2#{} chips",
		}
	},
	weight = 13,
	shader = "unpleasant",
	in_shop = true,
	extra_cost = 3,
	config = { Xmult_mod = 1.01, Xchip_mod = 0.99 },

	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.Xmult_mod, self.config.Xchip_mod } }
	end,
	calculate = function(self, card, context)
		if  context.edition -- for when on jonklers
			and context.cardarea == G.jokers -- checks if should trigger
			and card.config.trigger -- fixes double trigger
			or context.main_scoring -- for when on playing cards
			and context.cardarea == G.play then
			return { x_chips = self.config.Xchip_mod, x_mult = self.config.Xmult_mod } -- updated value
		end

		if context.joker_main then
			card.config.trigger = true -- context.edition triggers twice, this makes it only trigger once (only for jonklers)
		end

		if context.after then
			card.config.trigger = nil
		end
	end,
})

local miscitems = {
	unpleasant_shader,
	unpleasant,
}

return {
	name = "Misc.",
	items = miscitems,
}