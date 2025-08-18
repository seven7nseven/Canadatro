--- STEAMODDED HEADER
--- MOD_NAME: Canadatro
--- MOD_ID: CANADATRO
--- MOD_AUTHOR: luma lumatic
--- MOD_DESCRIPTION: canada
--- PREFIX: cand
----------------------------------------------
------------MOD CODE -------------------------

if not Canadatro then
	Canadatro = {}
end

G.C.CANADARED = HEX("ff7676")
G.C.CANADAWHITE = HEX("fff3f3")
G.C.CANADABLUE = HEX("00a2a2")
G.C.CANADAGRAY = HEX("777777")
G.C.mid_flash = 0
G.C.vort_time = 7
G.C.vort_speed = 0.25

local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
	local ret = oldfunc(change_context)
	G.SPLASH_BACK:define_draw_steps({
			{
				shader = "splash",
				send = {
					{ name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
					{name = 'vort_speed', val = G.C.vort_speed},
					{name = 'colour_1', ref_table = G.C, ref_value = 'CANADARED'},
					{name = 'colour_2', ref_table = G.C, ref_value = 'CANADAWHITE'},
					{name = 'mid_flash', ref_table = G.C, ref_value = 'mid_flash'},
				},
			},
		})
	return ret
end

local mod_path = "" .. SMODS.current_mod.path
Canadatro.path = mod_path
Canadatro_config = SMODS.current_mod.config

SMODS.current_mod.optional_features = {
	retrigger_joker = true,
	post_trigger = true,
}

SMODS.ObjectType({
	key = "Canadaaddition",
	default = "j_reserved_parking",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

SMODS.ObjectType({
	key = "Emiliajump",
	default = "j_reserved_parking",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

SMODS.ObjectType({
	key = "Messedjokers",
	default = "j_reserved_parking",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

SMODS.ObjectType({
	key = "Country",
	default = "j_canadatro_finland",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

SMODS.ObjectType({
	key = "SixAmJoker",
	default = "j_canadatro_is6am",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

SMODS.ObjectType({
	key = "Deity",
	default = "j_canadatro_unversale",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

local files = NFS.getDirectoryItems(mod_path .. "items")
for _, file in ipairs(files) do
	print("[CANADATRO] sending a fuck you to " .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err) 
	end
	f()
end

local files = NFS.getDirectoryItems(mod_path .. "libs/")
for _, file in ipairs(files) do
	print("[CANADATRO] kill yourself " .. file)
	local f, err = SMODS.load_file("libs/" .. file)
	if err then
		error(err) 
	end
	f()
end

----------------------------------------------
------------MOD CODE END----------------------