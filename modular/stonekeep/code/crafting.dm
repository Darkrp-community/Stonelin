/* * * * * * * * * * * **
 *						*
 *		 Crafting		*
 *						*
 *						*
 * * * * * * * * * * * **/

// =================================================================================
/*-----------------\
| Crafting Recipes |
\-----------------*/

/datum/blueprint_recipe/structure/stonetable
	name = "stone table (long mid)"
	result_type = /obj/structure/table/stone
	required_materials = list(/obj/item/natural/stone = 2)
	verbage = "build"
	verbage_tp = "builds"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 3
/datum/blueprint_recipe/structure/stonetable/end
	name = "stone table (long end)"
	result_type = /obj/structure/table/stone_end

/datum/blueprint_recipe/structure/stonetable/small
	name = "stone table (single)"
	result_type = /obj/structure/table/stone_small


/*--------------\
| Anvil Recipes |
\--------------*/
/datum/anvil_recipe/weapons/iron/lucerne
	name = "Poleaxe (+Bar, +Small Log)"
	recipe_name = "a Poleaxe"
	created_item = /obj/item/weapon/polearm/eaglebeak/lucerne/poleaxe

/datum/anvil_recipe/weapons/iron/spear_iron
	name = "Spear (+Small Log)"
	recipe_name = "a Spear"

/datum/anvil_recipe/weapons/steel/peasant_flail
	name = "Crusher (+Chain, +Small Log)"
	recipe_name = "a two-handed flail"

/datum/anvil_recipe/weapons/copper/cbludgeon
	name = "Studded club (+Club)"
	recipe_name = "a Studded Club"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/weapon/mace/woodclub)
	created_item = /obj/item/weapon/mace/copperbludgeon
	craftdiff = 0


// Disabled?
/datum/anvil_recipe/tools/hoe/copper
	req_bar = /obj/item/natural/stoneblock

/datum/anvil_recipe/tools/pitchfork/copper
	req_bar = /obj/item/natural/stoneblock

/datum/anvil_recipe/tools/pick/copper
	req_bar = /obj/item/natural/stoneblock

/datum/anvil_recipe/tools/hammer/copper
	req_bar = /obj/item/natural/stoneblock

/datum/anvil_recipe/weapons/copper/cmesser
	req_bar = /obj/item/natural/stoneblock

/datum/anvil_recipe/weapons/copper/cfalx
	req_bar = /obj/item/natural/stoneblock



/datum/blueprint_recipe/woodflail
	name = "wooden flail x2"
	skillcraft = /datum/skill/craft/carpentry
	required_materials = list(/obj/item/weapon/flail/towner = 1,
			/obj/item/ingot/iron = 10)
	construct_tool = list(/obj/item/weapon/hammer)
	craftdiff = 2

/datum/blueprint_recipe/militia_flail
	name = "militia flail"
	skillcraft = /datum/skill/craft/carpentry
	required_materials = list(/obj/item/weapon/flail/towner = 1, /obj/item/ingot/iron = 10)
	construct_tool = list(/obj/item/weapon/hammer)
	craftdiff = 3



/datum/anvil_recipe/tools/iron/handsaw
	name = "Handsaw (+1 Stick)"
	recipe_name = "a saw for woodworking"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/weapon/handsaw
	i_type = "Tools"

/datum/anvil_recipe/tools/iron/chisel
	name = "Chisel"
	recipe_name = "a chisel for stoneworking"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/weapon/chisel
	i_type = "Tools"


/datum/anvil_recipe/armor/iron/splint_legs
	name = "Splint Chausses (+ 2 hide)"
	recipe_name = "a pair of Splint Chausses"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron, /obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/pants/splintlegs
	craftdiff = 2


/datum/anvil_recipe/armor/iron/splint_arms
	name = "Splint Vambraces (+ 2 hide)"
	recipe_name = "a pair of Splint Vambraces"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron, /obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/wrists/bracers/splint
	craftdiff = 2


/datum/anvil_recipe/armor/steel/brigadine
	name = "Platemail Chausses (+Bar)"
	recipe_name = "a pair of Platemail Chausses"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/clothing/pants/chainlegs/reinforced
	craftdiff = 3

