--Transmutation crafts
minetest.register_craft({
    output = "default:gold_ingot",
    recipe = {
        {"default:copper_ingot"},
        {"azoth:mese_bucket_azoth"}
    },
    replacements = {{"azoth:mese_bucket_azoth", "azoth:mese_bucket_empty"}}
})

minetest.register_craft({
    output = "moreores:silver_ingot",
    recipe = {
        {"default:tin_ingot"},
        {"azoth:mese_bucket_azoth"}
    },
    replacements = {{"azoth:mese_bucket_azoth", "azoth:mese_bucket_empty"}}
})

-- Mese bucket crafts
minetest.register_craft({
	output = "azoth:mese_bucket_empty",
	recipe = {
		{"default:mese_crystal", "", "default:mese_crystal"},
		{"", "default:mese_crystal", ""}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "azoth:mese_bucket_lava",
	burntime = 60,
	replacements = {{"azoth:mese_bucket_lava", "azoth:mese_bucket_empty"}},
})