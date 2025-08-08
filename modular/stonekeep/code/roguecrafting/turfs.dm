/datum/blueprint_recipe/turfs
	craftdiff = 0
	skillcraft = /datum/skill/craft/crafting

///WOOD

/datum/blueprint_recipe/turfs/woodwall
	name = "wall (rough wood)"
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	result_type = /turf/closed/wall/mineral/wood

/datum/blueprint_recipe/turfs/daubwall
	name = "wall (daub)"
	required_materials = list(/obj/item/grown/log/tree/small = 1, /obj/item/natural/dirtclod= 1,)
	result_type = /turf/closed/wall/mineral/decowood

/datum/blueprint_recipe/turfs/woodwindow
	name = "murder hole (wood)"
	result_type = /turf/closed/wall/mineral/wood/window
	required_materials = list(/obj/item/grown/log/tree/small = 1)

/datum/blueprint_recipe/turfs/dwoodwall
	name = "wall (dark wood)"
	craftdiff = 2
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	result_type = /turf/closed/wall/mineral/wooddark

/datum/blueprint_recipe/turfs/dwoodwindow
	name = "murderhole (dark wood)"
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	result_type = /turf/closed/wall/mineral/wooddark/window


/datum/blueprint_recipe/turfs/woodfloor
	name = "floor (rough wood)"
	craftdiff = 0
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	result_type = /turf/open/floor/ruinedwood
	skillcraft = /datum/skill/craft/carpentry
/datum/blueprint_recipe/turfs/woodfloorplank
	name = "floor (plank)"
	result_type = /turf/open/floor/wood
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/blueprint_recipe/turfs/woodfloorchevron
	name = "floor (patterned wood)"
	result_type = /turf/open/floor/ruinedwood/spiral
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3


/// STONE
/datum/blueprint_recipe/turfs/stonefloor
	name = "floor (cobblestone)"
	result_type = /turf/open/floor/cobble
	required_materials = list(/obj/item/natural/stone = 1)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 0
	floor_object = TRUE

/datum/blueprint_recipe/turfs/stonefloor/cobblerock
	name = "road (cobblerock)"
	result_type = /turf/open/floor/cobblerock/alt

/datum/blueprint_recipe/turfs/stonefloor/block
	name = "floor (stone block)"
	required_materials = list(/obj/item/natural/stoneblock = 1)

/datum/blueprint_recipe/turfs/stonefloor/herring
	name = "floor (herringstone)"
	result_type = /turf/open/floor/herringbone
	required_materials = list(/obj/item/natural/stoneblock = 1)
	craftdiff = 2


/datum/blueprint_recipe/turfs/stonewall
	name = "wall (rough stone)"
	result_type = /turf/closed/wall/mineral/stone
	required_materials = list(/obj/item/natural/stone = 2)
	floor_object = TRUE

/datum/blueprint_recipe/turfs/stonewindow
	name = "murder hole (stone)"
	required_materials = list(/obj/item/natural/stoneblock = 2)

/datum/blueprint_recipe/turfs/stonewall/brick
	name = "wall (stone brick)"
	result_type = /turf/closed/wall/mineral/stonebrick
	required_materials = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 2

/datum/blueprint_recipe/turfs/fancyswall
	name = "wall (decorated stone)"
	required_materials = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 3

/datum/blueprint_recipe/turfs/craftstone
	name = "wall (craftstone)"
	required_materials = list(/obj/item/natural/stoneblock = 3)
	craftdiff = 4


/// TWIG AND TENT


/datum/blueprint_recipe/turfs/tentwall
	name = "tent wall"
	result_type = /turf/closed/wall/mineral/tent
	required_materials = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)

/datum/blueprint_recipe/turfs/tentdoor
	name = "tent door"
	result_type = /obj/structure/roguetent
	required_materials = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)

/datum/blueprint_recipe/turfs/twig
	name = "floor (twig)"
	required_materials = list(/obj/item/grown/log/tree/stick = 3)
	floor_object = TRUE





/* kaizoku ROGTODO
//Abyssariad Walls.
//Tier 'Plank' Abyssariad wall. Making a rough counterpart later.

/datum/blueprint_recipe/turfs/woodwall/abyssal
	name = "wagoya joinwall"
	result_type = /turf/closed/wall/mineral/wood/abyssal
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/blueprint_recipe/turfs/woodwindow/abyssal
	name = "wagoya murderhole"
	result_type = /turf/closed/wall/mineral/wood/abyssal/window
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

//Abyssariad Walls.
//Tier 'Stone' Abyssariad wall. Making a Stoneblock counterpart later.

/datum/blueprint_recipe/turfs/stonewall/abyssal
	name = "ishigaki wall"
	result_type = /turf/closed/wall/mineral/stone
	required_materials = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 1

/datum/blueprint_recipe/turfs/stonewindow/abyssal
	name = "ishigaki murderhole"
	result_type = /turf/closed/wall/mineral/stone/window
	required_materials = list(/obj/item/natural/stoneblock = 2)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 1
*/
