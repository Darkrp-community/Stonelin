
/datum/blueprint_recipe/structure
	craftdiff = 0
	verbage = "build"
	verbage_tp = "builds"



/*========= CARPENTRY SKILL ==========*/
/datum/blueprint_recipe/structure/carpentry
	skillcraft = /datum/skill/craft/carpentry
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'
	construct_tool = list(/obj/item/weapon/hammer)

/datum/blueprint_recipe/structure/carpentry/stool
	name = "chair (stool)"
	result_type = /obj/item/chair/stool/bar/crafted
	required_materials = list(/obj/item/grown/log/tree/small = 1)


/* === SKILL LEVEL 1 === */

/datum/blueprint_recipe/structure/carpentry/chair
	name = "chair (wood)"
	result_type = /obj/item/chair
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	craftdiff = 1

/datum/blueprint_recipe/structure/carpentry/composter
	name = "composter"
	result_type = /obj/structure/composter
	craftdiff = 1
	required_materials = list(/obj/item/grown/log/tree/small = 1)

/datum/blueprint_recipe/structure/carpentry/roguebin // Bins are easier to craft than barrels for pure convenience.
	name = "bin"
	result_type = /obj/item/bin
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	verbage = "construct"
	verbage_tp = "makes"
	craftdiff = 1

/datum/blueprint_recipe/structure/carpentry/table
	name = "table (wood)"
	result_type = /obj/structure/table/wood/crafted
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftdiff = 1

/datum/blueprint_recipe/structure/carpentry/wallladder
	name = "wall ladder"
	result_type = /obj/structure/wallladder
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftdiff = 1

/datum/blueprint_recipe/structure/carpentry/sign
	name = "custom sign"
	result_type = /obj/structure/fluff/customsign
	verbage = "construct"
	verbage_tp = "constructs"
	craftdiff = 1
	required_materials = list(/obj/item/grown/log/tree/small = 1)

/datum/blueprint_recipe/structure/carpentry/chest
	name = "chest"
	result_type = /obj/structure/closet/crate/chest/crafted
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftdiff = 1

/obj/structure/closet/crate/chest/crafted
	name = "sturdy chest"
	icon_state = "chest_neu"
	base_icon_state = "chest_neu"

/datum/blueprint_recipe/structure/carpentry/closet
	name = "closet"
	result_type = /obj/structure/closet/crate/crafted_closet/crafted
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	verbage = "construct"
	verbage_tp = "constructs"
	craftdiff = 1

/datum/blueprint_recipe/structure/carpentry/coffin
	name = "coffin"
	result_type = /obj/structure/closet/crate/coffin
	required_materials = list(/obj/item/grown/log/tree/small=3)
	verbage = "construct"
	verbage_tp = "constructs"
	craftdiff = 1

/datum/blueprint_recipe/structure/carpentry/psycrss
	name = "psycross (wood)"
	result_type = /obj/structure/fluff/psycross/crafted
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/grown/log/tree/stake = 3)
	craftdiff = 1

/datum/blueprint_recipe/structure/carpentry/loom
	name = "loom"
	result_type = /obj/machinery/loom
	required_materials = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/grown/log/tree/stick = 2,
				/obj/item/natural/fibers = 2)

	verbage = "constructs"
	craftdiff = 1

/datum/blueprint_recipe/structure/carpentry/dummy // Easier to craft than display dummies for convenience, and also because a training dummy isn't actually fitting any measurements. You're just smacking it.
	name = "training dummy"
	result_type = /obj/structure/fluff/statue/tdummy
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftdiff = 1

/* === SKILL LEVEL 2 === */

/datum/blueprint_recipe/structure/carpentry/display_stand
	name = "display stand"
	result_type = /obj/structure/mannequin
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/grown/log/tree/stick = 3)
	verbage = "construct"
	verbage_tp = "constructs"
	craftdiff = 2

/datum/blueprint_recipe/structure/carpentry/mannequin
	name = "mannequin (male)"
	result_type = /obj/structure/mannequin/male
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/cloth = 1,
				/obj/item/ingot/iron = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftdiff = 2

/datum/blueprint_recipe/structure/carpentry/mannequin_f
	name = "mannequin (female)"
	result_type = /obj/structure/mannequin/male/female
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/cloth = 1,
				/obj/item/ingot/iron = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftdiff = 2

/datum/blueprint_recipe/structure/handcart
	name = "handcart"
	result_type = /obj/structure/handcart
	required_materials = list(/obj/item/grown/log/tree/small = 3,
				/obj/item/rope = 1)
	craftdiff = 2

/datum/blueprint_recipe/structure/carpentry/barrel
	name = "barrel"
	result_type = /obj/structure/fermentation_keg/crafted
	required_materials = list(/obj/item/grown/log/tree/small=2)
	verbage = "construct"
	verbage_tp = "makes"
	craftdiff = 2

/obj/structure/fermentation_keg/crafted

/datum/blueprint_recipe/structure/carpentry/stairsd
	name = "stairs (down)"
	result_type = /obj/structure/stairs/d
	verbage = "construct"
	verbage_tp = "constructs"
	required_materials = list(/obj/item/grown/log/tree/small=2,
	/obj/item/natural/wood/plank = 2)



/datum/blueprint_recipe/structure/carpentry/nicebed
	name = "bed (good)"
	result_type = /obj/structure/bed
	required_materials = list(/obj/item/grown/log/tree/small=2,
				/obj/item/natural/cloth = 1)
	construct_tool = list(/obj/item/needle)
	craftdiff = 2

/datum/blueprint_recipe/structure/carpentry/door
	name = "door (wood)"
	result_type = /obj/structure/door/weak/bolt
	required_materials = list(/obj/item/grown/log/tree/small=2)
	craftdiff = 2

/datum/blueprint_recipe/structure/carpentry/railing
	name = "railing"
	result_type = /obj/structure/fluff/railing/wood
	required_materials = list(/obj/item/grown/log/tree/small=2)
	craftdiff = 2

/datum/blueprint_recipe/structure/carpentry/easel
	name = "painting (easel)"
	result_type = /obj/structure/easel
	required_materials = list(/obj/item/grown/log/tree/stick = 3)
	verbage = "construct"
	verbage_tp = "makes"
	craftdiff = 3


/datum/blueprint_recipe/structure/carpentry/optable
	name = "feldsher table"
	result_type = /obj/structure/table/optable
	required_materials = list(/obj/item/grown/log/tree/small=2)
	verbage = "construct"
	verbage_tp = "makes"
	craftdiff = 3

/datum/blueprint_recipe/structure/carpentry/meathook
	name = "meathook"
	result_type = /obj/structure/meathook
	required_materials = list(/obj/item/grown/log/tree/small=2, /obj/item/rope/chain = 1)
	verbage = "construct"
	verbage_tp = "makes"
	craftdiff = 3


/*========= MASONRY SKILL ==========*/
/datum/blueprint_recipe/structure/masonry
	skillcraft = /datum/skill/craft/masonry
	verbage = "mason"
	verbage_tp = "masons"
	craftsound = 'sound/foley/Building-01.ogg'

/datum/blueprint_recipe/structure/masonry/millstone
	name = "millstone"
	result_type = /obj/structure/fluff/millstone
	required_materials = list(/obj/item/natural/stone = 3)
	verbage = "craft"
	verbage_tp = "crafts"
	craftdiff = 1

/datum/blueprint_recipe/structure/masonry/cauldron
	name = "cauldron"
	result_type = /obj/machinery/light/fueled/cauldron
	required_materials = list(/obj/item/ingot/iron = 2,
				/obj/item/natural/stone = 4,
				/obj/item/grown/log/tree/small = 1)
	verbage = "craft"
	verbage_tp = "crafts"
	craftdiff = 1

/datum/blueprint_recipe/structure/masonry/oven
	name = "oven"
	result_type = /obj/machinery/light/fueled/oven
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stone = 3)
	craftdiff = 1

/datum/blueprint_recipe/structure/masonry/window
	name = "window (fixed)"
	result_type = /obj/structure/window/solid
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/glass = 1)
	craftdiff = 1

/datum/blueprint_recipe/structure/masonry/windowopen
	name = "window (openable)"
	result_type = /obj/structure/window/openclose
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/glass = 1,
				/obj/item/ingot/iron = 1)
	craftdiff = 1

/datum/blueprint_recipe/structure/masonry/windowstained
	name = "window (stained glass)"
	result_type = /obj/structure/window/stained
	required_materials = list(/obj/item/natural/stoneblock = 3,
				/obj/item/natural/glass = 2,
				/obj/item/ingot/silver = 1)
	craftdiff = 2

/datum/blueprint_recipe/structure/masonry/stonetable
	name = "table (stone long mid)"
	result_type = /obj/structure/table/stone
	required_materials = list(/obj/item/natural/stoneblock = 2)
	verbage = "build"
	verbage_tp = "builds"
	craftdiff = 3
/datum/blueprint_recipe/structure/masonry/stonetable/end
	name = "table (stone long end)"
	result_type = /obj/structure/table/stone_end

/datum/blueprint_recipe/structure/masonry/stonetable/small
	name = "table (stone single)"
	result_type = /obj/structure/table/stone_small

/*========= MISCELLANY/CRAFTING SKILL ==========*/

/* === NO SKILL NEEDED === */

/datum/blueprint_recipe/structure/noose
	name = "noose"
	result_type = /obj/structure/noose
	required_materials = list(/obj/item/rope = 1)
	verbage = "tie"
	verbage_tp = "ties"
	craftsound = 'sound/foley/noose_idle.ogg'

/datum/blueprint_recipe/structure/fence
	name = "palisade (s x2)"
	result_type = /obj/structure/fluff/railing/fence
	required_materials = list(/obj/item/grown/log/tree/stake = 2)
	craftsound = 'sound/foley/Building-01.ogg'


/datum/blueprint_recipe/structure/fence/alt
	name = "palisade (l)"
	required_materials = list(/obj/item/grown/log/tree/small = 1)


/datum/blueprint_recipe/structure/bed // This one's not in carpentry because it's just a shitty pile of sticks and cloth.
	name = "bed (terrible)"
	result_type = /obj/structure/bed/shit
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)

/datum/blueprint_recipe/structure/campfire
	name = "campfire"
	result_type = /obj/machinery/light/fueled/campfire
	required_materials = list(/obj/item/grown/log/tree/stick = 2)

/datum/blueprint_recipe/structure/densefire
	name = "greater campfire"
	result_type = /obj/machinery/light/fueled/campfire/densefire
	required_materials = list(/obj/item/grown/log/tree/stick = 2,
				/obj/item/natural/stone = 2)

/datum/blueprint_recipe/structure/pyre
	name = "wooden pyre"
	result_type = /obj/machinery/light/fueled/campfire/pyre
	required_materials = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/grown/log/tree/stake = 3)
	craftsound = 'sound/foley/Building-01.ogg'

/* === SKILL LEVEL 1 === */

/datum/blueprint_recipe/structure/cookpit
	name = "cookpit"
	result_type = /obj/machinery/light/fueled/hearth
	required_materials = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 3)
	craftdiff = 1

/datum/blueprint_recipe/structure/brazier
	name = "brazier"
	result_type = /obj/machinery/light/fueled/firebowl/stump
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/ore/coal = 1)
	craftdiff = 1

/datum/blueprint_recipe/structure/dryingrack
	name = "drying rack"
	result_type = /obj/machinery/tanningrack
	required_materials = list(/obj/item/grown/log/tree/stick = 4)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	craftdiff = 1

/* === SKILL LEVEL 2 === */

/datum/blueprint_recipe/structure/anvil // Call me crazy, but I think there should be some difficulty involved in making these huge structures.
	name = "anvil"
	result_type = /obj/machinery/anvil
	required_materials = list(/obj/item/ingot/iron = 1)
	craftsound = 'sound/foley/Building-01.ogg'
	craftdiff = 2

/datum/blueprint_recipe/structure/smelter
	name = "ore furnace"
	result_type = /obj/machinery/light/fueled/smelter
	required_materials = list(/obj/item/natural/stone = 6,
			/obj/item/ore/coal = 1)
	craftdiff = 2

/datum/blueprint_recipe/structure/smelter_block
	name = "ore furnace"
	result_type = /obj/machinery/light/fueled/smelter
	required_materials = list(/obj/item/natural/stoneblock = 4,
			/obj/item/ore/coal = 1)
	craftdiff = 2

/datum/blueprint_recipe/structure/forge
	name = "forge"
	result_type = /obj/machinery/light/fueled/forge
	required_materials = list(/obj/item/natural/stoneblock = 4,
				/obj/item/ore/coal = 1)
	craftdiff = 2

/* === SKILL LEVEL 3 === */

/datum/blueprint_recipe/structure/sharpwheel
	name = "sharpening wheel"
	result_type = /obj/structure/grindwheel
	required_materials = list(/obj/item/ingot/iron = 1,
				/obj/item/natural/stone = 1)
	craftdiff = 3

/datum/blueprint_recipe/structure/greatsmelter // I figure if you've already got a riddle of steel you're a mason making this anyway.
	name = "great furnace"
	result_type = /obj/machinery/light/fueled/smelter/great
	required_materials = list(/obj/item/ingot/iron = 2,
				/obj/item/riddleofsteel = 1,
				/obj/item/ore/coal = 1)
	craftsound = null
	craftdiff = 3


/*========= ENGINEERING SKILL ==========*/
/datum/blueprint_recipe/structure/engineer
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/engineering

/datum/blueprint_recipe/structure/engineer/lever
	name = "lever"
	result_type = /obj/structure/lever
	required_materials = list(/obj/item/gear = 1)
	craftdiff = 1

/datum/blueprint_recipe/structure/engineer/trapdoor
	name = "floorhatch"
	result_type = /obj/structure/floordoor
	required_materials = list(/obj/item/grown/log/tree/small = 1,
					/obj/item/gear = 1)
	craftdiff = 1
	floor_object = TRUE

/datum/blueprint_recipe/structure/engineer/pressure
	name = "pressure plate"
	result_type = /obj/structure/pressure_plate
	required_materials = list(/obj/item/grown/log/tree/small = 1,
					/obj/item/gear = 1)
	craftdiff = 1

/datum/blueprint_recipe/structure/engineer/repeater
	name = "repeater"
	result_type = /obj/structure/repeater
	required_materials = list(/obj/item/grown/log/tree/small = 1,
					/obj/item/ingot/iron = 2,
					/obj/item/gear = 1)
	craftdiff = 1

/datum/blueprint_recipe/structure/engineer/activator
	name = "activator"
	result_type = /obj/structure/activator
	required_materials = list(/obj/item/grown/log/tree/small = 2,
					/obj/item/ingot/iron = 1,
					/obj/item/gear = 2)
	craftdiff = 1

/datum/blueprint_recipe/structure/engineer/passage
	name = "passage"
	result_type = /obj/structure/bars/passage
	required_materials = list(/obj/item/ingot/iron = 1,
					/obj/item/gear = 1)
	craftdiff = 1

