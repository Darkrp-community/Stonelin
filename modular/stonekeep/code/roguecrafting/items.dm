/* CRAFTING	uses the Crafting skill, natch. Pretty much every recipe that doesn't fit somewhere else.
==========================================================*/

/*========= NO SKILL LEVEL REQUIRED ==========*/

/datum/blueprint_recipe/carpentry
	abstract_type = /datum/blueprint_recipe/carpentry
	skillcraft = /datum/skill/craft/carpentry
	category = "Carpentry"
	construct_tool = /obj/item/weapon/hammer
	craftsound = 'sound/foley/Building-01.ogg'
	verbage = "build"
	verbage_tp = "builds"
	edge_density = FALSE

/datum/blueprint_recipe/carpentry/barrel
	name = "wooden barrel"
	desc = "A sturdy wooden barrel for fermentation."
	result_type = /obj/structure/fermentation_keg
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	craftdiff = 0

/datum/blueprint_recipe/carpentry/door
	name = "wooden door"
	desc = "A basic wooden door."
	result_type = /obj/structure/door
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/swing_door
	name = "swing door"
	desc = "A door that swings both ways."
	result_type = /obj/structure/door/swing
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/deadbolt_door
	name = "wooden door (deadbolt)"
	desc = "A reinforced wooden door with a deadbolt."
	result_type = /obj/structure/door/weak/bolt
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/grown/log/tree/stick = 1
	)
	supports_directions = TRUE
	craftdiff = 1

/datum/blueprint_recipe/torch
	name = "torch"
	result_type = /obj/item/flashlight/flare/torch
	required_materials = list(
		/obj/item/natural/fibers = 1,
		/obj/item/grown/log/tree/stick = 1
	)

/datum/blueprint_recipe/tneedle
	name = "sewing needle"
	result_type = /obj/item/needle/thorn
	required_materials = list(/obj/item/natural/thorn = 1,
				/obj/item/natural/fibers = 1)

/datum/blueprint_recipe/cloth
	name = "cloth"
	result_type = /obj/item/natural/cloth
	required_materials = list(/obj/item/natural/fibers = 2)
	construct_tool = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage = "sew"
	verbage_tp = "sews"

/datum/blueprint_recipe/cloththree
	name = "cloth (x3)"
	result_type = list(/obj/item/natural/cloth, /obj/item/natural/cloth, /obj/item/natural/cloth)//fixes the output of the cloth
	required_materials = list(/obj/item/natural/fibers = 6)
	construct_tool = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage = "sew"
	verbage_tp = "sews"

/datum/blueprint_recipe/pipe
	name = "wood pipe"
	result_type = /obj/item/clothing/face/cigarette/pipe
	required_materials = list(/obj/item/grown/log/tree/stick = 2)

/datum/blueprint_recipe/sigdry
	name = "westleach zig"
	result_type = /obj/item/clothing/face/cigarette/rollie/nicotine
	required_materials = list(/obj/item/reagent_containers/food/snacks/produce/dry_westleach = 1,
				/obj/item/paper = 1)
	verbage = "roll"
	verbage_tp = "rolls"

/datum/blueprint_recipe/sigsweet
	name = "swampweed zig"
	result_type = /obj/item/clothing/face/cigarette/rollie/cannabis
	required_materials = list(/obj/item/reagent_containers/food/snacks/produce/swampweed_dried = 1,
				/obj/item/paper = 1)
	verbage = "roll"
	verbage_tp = "rolls"



/datum/blueprint_recipe/rope
	name = "rope"
	result_type = /obj/item/rope
	required_materials = list(/obj/item/natural/fibers = 3)
	verbage = "braid"
	verbage_tp = "braids"

/datum/blueprint_recipe/zigbox
	name = "paper zigbox"
	result_type = list(/obj/item/storage/fancy/cigarettes/zig/empty)
	required_materials = list(/obj/item/paper = 1)


/*========= HUNTING ==========*/
/datum/blueprint_recipe/rod
	name = "fishing rod"
	result_type = /obj/item/fishingrod
	required_materials = list(/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 2)
	construct_tool = list(/obj/item/weapon/knife)
	craftdiff = 1

/obj/item/fishingrod/crafted

/datum/blueprint_recipe/bait
	name = "bait"
	result_type = /obj/item/bait
	required_materials = list(/obj/item/storage/sack = 1,
				/obj/item/reagent_containers/food/snacks/produce/grain/wheat = 2)

/datum/blueprint_recipe/sbaita
	name = "bait (sweetbait apple)"
	result_type = /obj/item/bait/sweet
	required_materials = list(/obj/item/storage/sack = 1,
				/obj/item/reagent_containers/food/snacks/produce/fruit/apple = 2)

/datum/blueprint_recipe/sbait
	name = "bait (sweetbait berry)"
	result_type = /obj/item/bait/sweet
	required_materials = list(/obj/item/storage/sack = 1,
				/obj/item/reagent_containers/food/snacks/produce/fruit/jacksberry = 2)

/datum/blueprint_recipe/bloodbait
	name = "bait (bloodbait)"
	result_type = /obj/item/bait/bloody
	required_materials = list(/obj/item/storage/sack = 1,
				/obj/item/reagent_containers/food/snacks/meat = 1)

/datum/blueprint_recipe/earnecklace
	name = "ear necklace"
	result_type = /obj/item/clothing/neck/menears
	required_materials = list(/obj/item/organ/ears = 4,
				/obj/item/rope = 1)

/datum/blueprint_recipe/elfearnecklace
	name = "elf ear necklace"
	result_type = /obj/item/clothing/neck/elfears
	required_materials = list(/obj/item/organ/ears = 4,
				/obj/item/rope = 1)

/*========= FISHING ==========*/
/datum/blueprint_recipe/fishbait
	name = "fishbait (red)"
	result_type = list(/obj/item/fishing/bait/meat,
				/obj/item/fishing/bait/meat)
	required_materials = list(/obj/item/reagent_containers/food/snacks/meat/mince = 1)
	verbage = "starts rolling some bait"
	verbage_tp = "starts rolling some bait"

/datum/blueprint_recipe/fishbait/dough
	name = "fishbait (dough)"
	result_type = list(/obj/item/fishing/bait/dough,
				/obj/item/fishing/bait/dough)
	required_materials = list(/obj/item/reagent_containers/food/snacks/dough_slice = 1)

/datum/blueprint_recipe/fishreel
	name = "fishing line (fibre)"
	result_type = /obj/item/fishing/reel/twine
	required_materials = list(/obj/item/natural/fibers = 2, /obj/item/grown/log/tree/stick = 1)
	verbage ="starts weaving a reel"
	verbage_tp ="starts weaving a reel"

/datum/blueprint_recipe/fishreel/silk
	name = "fishing line (silk)"
	result_type = /obj/item/fishing/reel/silk
	required_materials = list(/obj/item/natural/silk = 1, /obj/item/grown/log/tree/stick = 1)

/datum/blueprint_recipe/fishreel/leather
	name = "fishing line (leather)"
	result_type = /obj/item/fishing/reel/leather
	required_materials = list(/obj/item/natural/hide = 1, /obj/item/grown/log/tree/stick = 1)

/datum/blueprint_recipe/fishbobber
	name = "fishing bobber (wood)"
	result_type = /obj/item/fishing/line/bobber
	required_materials = list(/obj/item/natural/fibers = 1, /obj/item/grown/log/tree/stick = 1)

/datum/blueprint_recipe/fishsinker
	name = "fishing sinker (stone)"
	result_type = /obj/item/fishing/line/sinker
	required_materials = list(/obj/item/natural/fibers = 1, /obj/item/natural/stone = 1)

/datum/blueprint_recipe/fishhook
	name = "fishing hook (wood)"
	result_type = /obj/item/fishing/line/sinker
	required_materials = list(/obj/item/grown/log/tree/stick = 2)

/datum/blueprint_recipe/fishhook/thorn
	name = "fishing hook (thorn)"
	result_type = /obj/item/fishing/line/sinker
	required_materials = list(/obj/item/natural/thorn = 1)




/*========= SKILL LEVEL: 1 REQUIRED ==========*/
/datum/blueprint_recipe/candle
	name = "candle (x2)"
	result_type = list(/obj/item/candle/yellow,
				/obj/item/candle/yellow)
	required_materials = list(/obj/item/reagent_containers/food/snacks/tallow = 1,
				/obj/item/natural/fibers= 1,
				)
	craftdiff = 1

/datum/blueprint_recipe/basket_wicker
	name = "wicker basket"
	result_type = /obj/structure/closet/crate/chest/wicker
	required_materials = list(/obj/item/natural/fibers = 4)
	craftdiff = 1

/datum/blueprint_recipe/broom
	name = "broom"
	result_type = /obj/item/broom
	required_materials = list(/obj/item/natural/fibers = 1,
			/obj/item/grown/log/tree/stick = 4)
	craftdiff = 1





/*========= ALCHEMY ==========*/
/datum/blueprint_recipe/pestle
	name = "alchemny ( stone pestle )"
	result_type = /obj/item/pestle
	required_materials = list(/obj/item/natural/stone = 1)
	construct_tool = list(/obj/item/weapon/chisel)
	verbage = "crafts"
	skillcraft = /datum/skill/craft/masonry

/datum/blueprint_recipe/pestle/bone
	name = "alchemy ( bone pestle )"
	required_materials = list(/obj/item/alch/bone = 1)
	construct_tool = /obj/item/weapon/knife
	skillcraft = /datum/skill/craft/crafting

/datum/blueprint_recipe/alchmortar
	name = "alchemy ( stone mortar )"
	result_type = /obj/item/reagent_containers/glass/mortar
	required_materials = list(/obj/item/natural/stone = 3)
	construct_tool = list(/obj/item/weapon/chisel)
	verbage = "crafts"
	skillcraft = /datum/skill/craft/masonry

/datum/blueprint_recipe/alchmortar/bone
	name = "alchemy ( bone mortar )"
	required_materials = list(/obj/item/alch/bone = 3)
	construct_tool = /obj/item/weapon/knife
	skillcraft = /datum/skill/craft/crafting


/*========= AMMO CRAFTING ==========*/
/datum/blueprint_recipe/stonearrow
	name = "arrows (x2 stone)"
	result_type = list(/obj/item/ammo_casing/caseless/arrow/stone,
				/obj/item/ammo_casing/caseless/arrow/stone)
	required_materials = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 1)

/datum/blueprint_recipe/stonearrow_five
	name = "arrows (x10 stone)"
	result_type = list(
				/obj/item/ammo_casing/caseless/arrow/stone,
				/obj/item/ammo_casing/caseless/arrow/stone,
				/obj/item/ammo_casing/caseless/arrow/stone,
				/obj/item/ammo_casing/caseless/arrow/stone,
				/obj/item/ammo_casing/caseless/arrow/stone,
				/obj/item/ammo_casing/caseless/arrow/stone,
				/obj/item/ammo_casing/caseless/arrow/stone,
				/obj/item/ammo_casing/caseless/arrow/stone,
				/obj/item/ammo_casing/caseless/arrow/stone,
				/obj/item/ammo_casing/caseless/arrow/stone)
	required_materials = list(/obj/item/grown/log/tree/stick = 5,
				/obj/item/natural/stone = 5)

/datum/blueprint_recipe/poisonarrow
	name = "arrow (poison)"
	result_type = /obj/item/ammo_casing/caseless/arrow/poison
	required_materials = list(/obj/item/ammo_casing/caseless/arrow = 1,
				/obj/item/reagent_containers/food/snacks/produce/fruit/jacksberry/poison = 1)
	craftdiff = 1

/datum/blueprint_recipe/poisonarrow/alt
	required_materials = list(/obj/item/ammo_casing/caseless/arrow = 1,
				/datum/reagent/berrypoison = 5)

/datum/blueprint_recipe/poisonarrow/potent
	name = "arrow (potent poison)"
	result_type = /obj/item/ammo_casing/caseless/arrow/poison/potent
	required_materials = list(/obj/item/ammo_casing/caseless/arrow = 1,
				/datum/reagent/strongpoison = 5)

/datum/blueprint_recipe/poisonbolt
	name = "bolt (poison)"
	result_type = /obj/item/ammo_casing/caseless/bolt/poison
	required_materials = list(/obj/item/ammo_casing/caseless/bolt = 1,
				/obj/item/reagent_containers/food/snacks/produce/fruit/jacksberry/poison = 1)
	craftdiff = 1

/datum/blueprint_recipe/poisonbolt/alt
	required_materials = list(/obj/item/ammo_casing/caseless/bolt = 1,
				/datum/reagent/berrypoison = 5)

/datum/blueprint_recipe/poisonbolt/potent
	name = "bolt (potent poison)"
	result_type = /obj/item/ammo_casing/caseless/bolt/poison/potent
	required_materials = list(/obj/item/ammo_casing/caseless/bolt = 1,
				/datum/reagent/strongpoison = 5)

/datum/blueprint_recipe/shinobiarrow
	name = "sedative arrow(5)"
	result_type = list(/obj/item/ammo_casing/caseless/arrow/poison/fog,
			/obj/item/ammo_casing/caseless/arrow/poison/fog,
			/obj/item/ammo_casing/caseless/arrow/poison/fog,
			/obj/item/ammo_casing/caseless/arrow/poison/fog,
			/obj/item/ammo_casing/caseless/arrow/poison/fog)
	required_materials = list(/obj/item/ammo_casing/caseless/arrow = 5,
				/obj/item/reagent_containers/food/snacks/fogdart = 1)
	craftdiff = 1

/datum/blueprint_recipe/shinobibolt
	name = "sedative bolt(5)"
	result_type = list(/obj/item/ammo_casing/caseless/bolt/poison/fog,
			/obj/item/ammo_casing/caseless/bolt/poison/fog,
			/obj/item/ammo_casing/caseless/bolt/poison/fog,
			/obj/item/ammo_casing/caseless/bolt/poison/fog,
			/obj/item/ammo_casing/caseless/bolt/poison/fog)
	required_materials = list(/obj/item/ammo_casing/caseless/bolt = 5,
				/obj/item/reagent_containers/food/snacks/fogdart = 1)
	craftdiff = 1

/datum/blueprint_recipe/kusaripeasant
	name = "handmade kusarigama"
	result_type = /obj/item/weapon/flail/kusarigama/peasant
	required_materials = list(/obj/item/weapon/sickle/kama = 1,
				/obj/item/rope/chain = 1)
	craftdiff = 0 //Any farmer should be able to make this. It's just a sickle and a chain.

/*========= ENGINEEERING CRAFTING ==========*/
/datum/blueprint_recipe/mantrap
	name = "mantrap"
	result_type = list(/obj/item/restraints/legcuffs/beartrap,
				/obj/item/restraints/legcuffs/beartrap)
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 2,
				/obj/item/ingot/iron = 1)
	skillcraft = /datum/skill/craft/traps
	craftdiff = 1
	verbage = "put together"
	verbage_tp = "puts together"

/datum/blueprint_recipe/flint
	name = "flint"
	result_type = /obj/item/flint
	required_materials = list(
			/obj/item/natural/stone = 1,
			/obj/item/ingot/iron = 1)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 0 // Something to practice engineering with.

/datum/blueprint_recipe/pyroarrow
	name = "pyroclastic arrow"
	result_type = /obj/item/ammo_casing/caseless/arrow/pyro
	required_materials = list(/obj/item/ammo_casing/caseless/arrow = 1,
				/obj/item/reagent_containers/food/snacks/produce/fyritius = 1)
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/blueprint_recipe/pyrobolt
	name = "pyroclastic bolt"
	result_type = /obj/item/ammo_casing/caseless/bolt/pyro
	required_materials = list(/obj/item/ammo_casing/caseless/bolt = 1,
				/obj/item/reagent_containers/food/snacks/produce/fyritius = 1)
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering



/*========= LITERATURE CRAFTING ==========*/
/datum/blueprint_recipe/paperscroll
	name = "parchment scroll x5"
	result_type = list(/obj/item/paper/scroll,
				/obj/item/paper/scroll,
				/obj/item/paper/scroll,
				/obj/item/paper/scroll,
				/obj/item/paper/scroll)
	required_materials = list(/obj/item/grown/log/tree/small = 1,
	/datum/reagent/water = 50)
	construct_tool = list(/obj/item/weapon/knife/hunting)
	craftdiff = 1

/datum/blueprint_recipe/readingscroll
	name = "novice's guide to literature"
	result_type = list(/obj/item/literary)
	required_materials = list(/obj/item/paper/scroll = 3)
	construct_tool = list(/obj/item/natural/feather)
	skillcraft = /datum/skill/misc/reading
	craftdiff = 2
	verbage = "write"
	verbage_tp  = "writes"

/datum/blueprint_recipe/readingscroll/apprentice
	name = "apprentice's guide to literature"
	result_type = list(/obj/item/literary/apprentice)
	craftdiff = 3

/datum/blueprint_recipe/readingscroll/journeyman
	name = "journeyman's guide to literature"
	result_type = list(/obj/item/literary/journeyman)
	craftdiff = 4

/datum/blueprint_recipe/readingscroll/expert
	name = "expert's guide to literature"
	result_type = list(/obj/item/literary/expert)
	craftdiff = 5

/datum/blueprint_recipe/readingscroll/master
	name = "master's guide to literature"
	result_type = list(/obj/item/literary/master)
	craftdiff = 6

/datum/blueprint_recipe/parchment_scroll
	name = "parchment scroll"
	result_type = /obj/item/paper/scroll
	required_materials = list(/obj/item/paper = 3)

/datum/blueprint_recipe/confessional
	name = "confession"
	result_type = /obj/item/paper/confession
	required_materials = list(/obj/item/paper = 1)
	construct_tool = list(/obj/item/natural/feather)
	skillcraft = /datum/skill/misc/reading
	craftsound = null
	craftdiff = 0


/*========= COOKING ==========*/
/datum/blueprint_recipe/pot_stone
	name = "cooking pot (stone)"
	result_type = list(/obj/item/reagent_containers/glass/bucket/pot/stone)
	required_materials = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry


// ---------	WEAPONS		-------------
/datum/blueprint_recipe/woodstaff//this is the simple staff anyone can make
	name = "wood staff"
	result_type = list(/obj/item/weapon/polearm/woodstaff,
	/obj/item/weapon/polearm/woodstaff,
	/obj/item/weapon/polearm/woodstaff)
	required_materials = list(/obj/item/grown/log/tree = 1)
	craftdiff = 1

/datum/blueprint_recipe/stoneaxe
	name = "stone axe"
	result_type = /obj/item/weapon/axe/stone
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stone = 1)

/datum/blueprint_recipe/stoneknife
	name = "stone knife"
	result_type = /obj/item/weapon/knife/stone
	required_materials = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 1)

/datum/blueprint_recipe/stonespear
	name = "stone spear"
	result_type = /obj/item/weapon/polearm/spear/stone
	required_materials = list(/obj/item/weapon/polearm/woodstaff = 1,
				/obj/item/natural/stone = 1)

/datum/blueprint_recipe/woodclub
	name = "wood club"
	result_type = /obj/item/weapon/mace/woodclub
	required_materials = list(/obj/item/grown/log/tree/small = 1)

/datum/blueprint_recipe/steelstaff
	name = "quarterstaff (steel)"
	skillcraft = /datum/skill/craft/carpentry
	required_materials = list(/obj/item/weapon/polearm/woodstaff/quarterstaff = 1, /obj/item/ingot/steel = 1)
	result_type = list(/obj/item/weapon/polearm/woodstaff/quarterstaff/steel)
	craftdiff = 3

/datum/blueprint_recipe/ironstaff
	name = "quarterstaff (iron)"
	skillcraft = /datum/skill/craft/carpentry
	required_materials = list(/obj/item/weapon/polearm/woodstaff/quarterstaff = 1, /obj/item/ingot/iron = 1)
	construct_tool = list(/obj/item/weapon/hammer)
	result_type = list(/obj/item/weapon/polearm/woodstaff/quarterstaff/iron)
	craftdiff = 2


/datum/blueprint_recipe/woodengreatflail
	name = "thresher"
	skillcraft = /datum/skill/craft/carpentry
	required_materials = list(/obj/item/rope = 1,
			/obj/item/grown/log/tree/stick = 1, /obj/item/grown/log/tree/small = 1)
	construct_tool = list(/obj/item/weapon/hammer)
	result_type = list(/obj/item/weapon/thresher)
	craftdiff = 1

/datum/blueprint_recipe/bigflail
	name = "militia flail"
	skillcraft = /datum/skill/craft/carpentry
	required_materials = list(/obj/item/rope/chain = 1,
			/obj/item/weapon/thresher = 1)
	construct_tool = list(/obj/item/weapon/hammer)
	result_type = list(/obj/item/weapon/thresher/military)
	craftdiff = 2

/datum/blueprint_recipe/ironcudgel
	name = "studded club"
	skillcraft = /datum/skill/craft/carpentry
	required_materials = list(/obj/item/grown/log/tree/small = 1, /obj/item/ingot/iron = 1)
	construct_tool = list(/obj/item/weapon/hammer)
	result_type = list(/obj/item/weapon/mace/cudgel/carpenter, /obj/item/weapon/mace/cudgel/carpenter)
	craftdiff = 2

/datum/blueprint_recipe/bonespear
	name = "bone spear"
	result_type = /obj/item/weapon/polearm/spear/bonespear
	required_materials = list(/obj/item/weapon/polearm/woodstaff = 1,
				/obj/item/alch/bone = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/blueprint_recipe/dart
	name = "dart"
	result_type = /obj/item/ammo_casing/caseless/dart
	required_materials = list(/obj/item/natural/thorn = 1,
				/obj/item/grown/log/tree/stick = 1)
	craftdiff = 1

/datum/blueprint_recipe/blowgun
	name = "blowgun"
	result_type = /obj/item/gun/ballistic/revolver/grenadelauncher/blowgun
	required_materials = list(/obj/item/grown/log/tree/stick = 1)
	craftdiff = 3


// ---------	CLOTHING		-------------
/datum/blueprint_recipe/skullmask
	name = "mask (skull)"
	result_type = /obj/item/clothing/face/skullmask
	required_materials = list(/obj/item/alch/bone = 3,
				/obj/item/natural/fibers = 1)
	verbage = "crafted"
	craftdiff = 0

/datum/blueprint_recipe/wickercloak
	name = "cloak (wicker)"
	result_type = /obj/item/clothing/cloak/wickercloak
	required_materials = list(/obj/item/natural/dirtclod = 1,
				/obj/item/grown/log/tree/stick = 5,
				/obj/item/natural/fibers = 3)
	craftdiff = 1

/datum/blueprint_recipe/bogcowl
	name = "hood (bogcowl)"
	result_type = /obj/item/clothing/neck/bogcowl
	required_materials = list(/obj/item/natural/dirtclod = 1,
				/obj/item/grown/log/tree/stick = 3,
				/obj/item/natural/fibers = 2)
	craftdiff = 1

/datum/blueprint_recipe/clothsash
	name = "cloth sash"
	result_type = /obj/item/storage/belt/leather/cloth
	required_materials = list(/obj/item/natural/cloth = 1)
	verbage = "tie"
	verbage_tp = "ties"

/datum/blueprint_recipe/unclothsash
	name = "untie cloth sash"
	result_type = /obj/item/natural/cloth
	required_materials = list(/obj/item/storage/belt/leather/cloth = 1)
	verbage = "untie"
	verbage_tp = "unties"

/datum/blueprint_recipe/ropebelt
	name = "rope belt"
	result_type = /obj/item/storage/belt/leather/rope
	required_materials = list(/obj/item/rope = 1)
	verbage = "tie"
	verbage_tp = "ties"

/datum/blueprint_recipe/unropebelt
	name = "untie rope belt"
	result_type = /obj/item/rope
	required_materials = list(/obj/item/storage/belt/leather/rope = 1)
	verbage = "untie"
	verbage_tp  = "unties"

/datum/blueprint_recipe/reinforce_gloves
	name = "reinforce gloves"
	result_type = /obj/item/clothing/gloves/reinforced
	required_materials = list(/obj/item/clothing/gloves/leather = 1, /obj/item/ingot/iron = 1)
	verbage = "modifies"
	verbage_tp  = "modifies"


// ---------	LUMBERJACKING RECIPE		-------------
/datum/blueprint_recipe/lumberjacking
	skillcraft = /datum/skill/labor/lumberjacking
	construct_tool = list(/obj/item/weapon/knife/hunting = 1)
/*
/datum/blueprint_recipe/lumberjacking/cart_upgrade
	name = "upgrade cog"
	result_type = /obj/item/cart_upgrade/level_1
	required_materials = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/natural/stone = 1)
	craftdiff = 2

/datum/blueprint_recipe/lumberjacking/cart_upgrade2
	name = "advanced upgrade cog"
	result_type = /obj/item/cart_upgrade/level_2
	required_materials = list(/obj/item/grown/log/tree/small = 4,
				/obj/item/cart_upgrade/level_1 = 1,
				/obj/item/ingot/iron = 1)
	craftdiff = 4
*/
/datum/blueprint_recipe/wood_hammer
	name = "tool (wooden mallet)"
	result_type = /obj/item/weapon/hammer/wood
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	craftdiff = 0


/datum/blueprint_recipe/wpsycross
	name = "handheld psycross"
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	result_type = /obj/item/clothing/neck/psycross
	craftdiff = 0

/datum/blueprint_recipe/impsaw
	name = "surgery (crude saw)"
	result_type = /obj/item/weapon/surgery/saw/improv
	required_materials = list(/obj/item/natural/fibers = 1, /obj/item/natural/stone = 1, /obj/item/grown/log/tree/stick = 1)
	craftdiff = 1

/datum/blueprint_recipe/impretra
	name = "surgery (crude clamp)"
	result_type = /obj/item/weapon/surgery/hemostat/improv
	required_materials = list(/obj/item/natural/fibers = 1, /obj/item/grown/log/tree/stick = 2)
	craftdiff = 1

/datum/blueprint_recipe/imphemo
	name = "surgery (crude retractor)"
	result_type = /obj/item/weapon/surgery/retractor/improv
	required_materials = list(/obj/item/natural/fibers = 1, /obj/item/grown/log/tree/stick = 2)
	craftdiff = 1
/* back to slapcraft since the recipes are only in the Vanderbook describing painting, too confusing like this
// ---------	PAINTING		-------------
/datum/blueprint_recipe/canvas
	name = "painting (canvas)"
	result_type = /obj/item/canvas
	required_materials = list(/obj/item/paper = 3)
	craftdiff = 1

/datum/blueprint_recipe/paintbrush
	name = "painting (brush)"
	result_type = /obj/item/paint_brush
	required_materials = list(/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/feather = 1)
	craftdiff = 1

/datum/blueprint_recipe/palette
	name = "painting (palette)"
	result_type = /obj/item/paint_palette
	required_materials = list(/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/wood/plank = 1)
	craftdiff = 1
*/

