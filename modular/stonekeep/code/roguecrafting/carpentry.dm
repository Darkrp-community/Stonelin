/* CARPENTRY is for pretty much any object made of wood. To see some wooden structures that also use carpentry, go to structure.dm.
==========================================================*/

/datum/blueprint_recipe/carpentry
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/*========= NO SKILL LEVEL REQUIRED ==========*/

/datum/blueprint_recipe/carpentry/woodbucket
	name = "bucket"
	result_type = /obj/item/reagent_containers/glass/bucket/wooden
	required_materials = list(/obj/item/grown/log/tree/small = 1)

/datum/blueprint_recipe/carpentry/spoon
	name = "spoon"
	result_type = list(/obj/item/kitchen/spoon,
				/obj/item/kitchen/spoon)
	required_materials = list(/obj/item/grown/log/tree/small = 1)

/datum/blueprint_recipe/carpentry/rollingpin
	name = "rollingpin"
	result_type = /obj/item/kitchen/rollingpin
	required_materials = list(/obj/item/grown/log/tree/small = 1)

/datum/blueprint_recipe/carpentry/woodbowl
	name = "bowls (x3 wooden)"
	result_type = list(/obj/item/reagent_containers/glass/bowl,
				/obj/item/reagent_containers/glass/bowl,
				/obj/item/reagent_containers/glass/bowl)
	required_materials = list(/obj/item/grown/log/tree/small = 1)

/datum/blueprint_recipe/carpentry/woodcup
	name = "mugs (x3 wooden)"
	result_type = list(/obj/item/reagent_containers/glass/cup/wooden/crafted,
				/obj/item/reagent_containers/glass/cup/wooden/crafted,
				/obj/item/reagent_containers/glass/cup/wooden/crafted)
	required_materials = list(/obj/item/grown/log/tree/small = 1)

/obj/item/reagent_containers/glass/cup/wooden/crafted

/datum/blueprint_recipe/carpentry/woodplatter
	name = "platters (x2 wooden)"
	result_type = list(/obj/item/kitchen/platter,
				/obj/item/kitchen/platter)
	required_materials = list(/obj/item/grown/log/tree/small = 1)

/*========= SKILL LEVEL: 1 REQUIRED ==========*/

/datum/blueprint_recipe/carpentry/woodsword
	name = "wood sword"
	result_type = list(/obj/item/weapon/mace/woodclub/train_sword,
					/obj/item/weapon/mace/woodclub/train_sword)
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/quarterstaff//elaborated quarterstaff only carpenters can do
	name = "quarterstaff"
	result_type = list(/obj/item/weapon/polearm/woodstaff/quarterstaff,
	/obj/item/weapon/polearm/woodstaff/quarterstaff)
	required_materials = list(/obj/item/grown/log/tree = 1)
	construct_tool = list(/obj/item/weapon/knife)
	craftdiff = 2

/datum/blueprint_recipe/woodspade
	name = "spade"
	result_type = /obj/item/weapon/shovel/small
	required_materials = list(/obj/item/grown/log/tree/small = 1,
			/obj/item/grown/log/tree/stick = 1)
	craftdiff = 1



/*========= SKILL LEVEL: 2 REQUIRED ==========*/


/datum/blueprint_recipe/carpentry/recurve
	name = "bow (recurve)"
	result_type = list(/obj/item/gun/ballistic/revolver/grenadelauncher/bow/short)
	required_materials = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/reagent_containers/food/snacks/fat = 1,
	/obj/item/natural/fibers = 4)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/handmadebow
	name = "bow"
	result_type = list(/obj/item/gun/ballistic/revolver/grenadelauncher/bow)
	required_materials = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/natural/fibers = 5)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/longbow
	name = "bow (longbow)"
	result_type = list(/obj/item/gun/ballistic/revolver/grenadelauncher/bow/long)
	required_materials = list(/obj/item/grown/log/tree/small = 2,
	/obj/item/natural/fibers = 6,
	/obj/item/reagent_containers/food/snacks/fat = 1)
	craftdiff = 3


/datum/blueprint_recipe/carpentry/woodshield
	name = "wooden shield"
	result_type = /obj/item/weapon/shield/wood/crafted
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/hide = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2


/datum/blueprint_recipe/structure/plough
	name = "plough"
	result_type = /obj/structure/plough
	required_materials = list(/obj/item/grown/log/tree/small = 2, /obj/item/ingot/iron = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/blueprint_recipe/carpentry/heater
	name = "heater shield"
	result_type = /obj/item/weapon/shield/heater
	required_materials = list(/obj/item/natural/wood/plank = 2,
				/obj/item/natural/hide/cured = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

//removes awesome buckler shield crafting

/*/datum/blueprint_recipe/carpentry/woodshield/iplank
	name = "iron buckler"
	result_type = /obj/item/weapon/shield/tower/buckleriron/iplank
	required_materials = list(/obj/item/natural/wood/plank = 3,
				/obj/item/ingot/iron = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/blueprint_recipe/carpentry/woodshield/splank
	name = "steel buckler"
	result_type = /obj/item/weapon/shield/tower/buckleriron/splank
	required_materials = list(/obj/item/natural/wood/plank = 3,
				/obj/item/ingot/steel = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2
*/
/datum/blueprint_recipe/carpentry/artable//the recipe is needed for most of carptentry/engineering works
	name = "Artificer Table"
	result_type = /obj/machinery/artificer_table
	required_materials = list(/obj/item/natural/wood/plank = 3)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/*========= SKILL LEVEL: 3 REQUIRED ==========*/
/*
/datum/blueprint_recipe/carpentry/rproesthetic
	name = "wood arm (L)"
	result_type = list(/obj/item/bodypart/l_arm/rproesthetic)
	required_materials = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/gear = 1)
	craftdiff = 3

/datum/blueprint_recipe/carpentry/rproesthetic
	name = "wood arm (R)"
	result_type = list(/obj/item/bodypart/r_arm/rproesthetic)
	required_materials = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/gear = 1)
	craftdiff = 3
*/


