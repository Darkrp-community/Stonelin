/datum/advclass/pilgrim/sk/abyss/stormforger
	name = "Stormforger"
	tutorial = "Abyssor breathed life into your people - but it is through hammer and will that His purpose is fulfilled. \
	The world wages war, and your hands carves its fate into steel by vitae and cokeless kilns. \
	You've discovered iron from blood, yet the empire still hungers. Give them iron from lands beyond."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Changeling",
		"Ogrun",
		"Skylancer",
		"Undine"
		)
	outfit = /datum/outfit/job/sk/abyss/stormforger
	category_tags = list(CTAG_PILGRIM)

/datum/outfit/job/sk/abyss/stormforger/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/kaizoku/leather/daisho/random
	beltr = /obj/item/weapon/hammer/iron
	beltl = /obj/item/weapon/tongs
	mask = /obj/item/clothing/face/shepherd/rag
	gloves = /obj/item/clothing/gloves/leather/abyssal
	armor = /obj/item/clothing/armor/leather/jacket/firecoat
	pants = /obj/item/clothing/pants/trou/leather/fur/dragonslayer
	backl = /obj/item/storage/backpack/backpack
	shoes = /obj/item/clothing/shoes/boots/jikatabi
	shirt = /obj/item/clothing/shirt/looseshirt
	backpack_contents = list(/obj/item/flint= 1, /obj/item/ore/coal=1, /obj/item/ore/iron=1, /obj/item/weapon/huntingknife/kunai= 1, /obj/item/rogue/artisankit= 1)

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, pick(0,0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, 3, TRUE) //sacrificing TRAPS so Stormforgers can make their FORGE.
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE) // For the bin
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/smelting, 3, TRUE)
		if(prob(50))
			H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("endurance", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", -1)
		ADD_TRAIT(H, TRAIT_MALUMFIRE, TRAIT_GENERIC)

// Refined Magmaforge Code for Abyssariad Smelting

/obj/machinery/light/magmaforge
	name = "magmaforge"
	desc = "The traditional dustwalker abyssariad furnace with hammering automatas inside. It functions without fuel, but can only make steel and releases lava fumes. Dangerous to life."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/tradesector32.dmi'
	base_state = "magmaforge"
	icon_state = "magmaforge"
	anchored = TRUE
	density = TRUE
	layer = 2.5
	brightness = 6
	bulb_colour = "#ff9933"
	on = TRUE
	var/carbon = 0
	var/cooking = 0
	var/actively_smelting = FALSE
	var/list/ore = list()

/obj/machinery/light/magmaforge/Initialize()
	. = ..()
	on = TRUE
	update_icon()
	set_light(brightness, 0, 1, bulb_colour)
	START_PROCESSING(SSmachines, src)

/obj/machinery/light/magmaforge/examine(mob/user)
	. = ..()
	. += "It has [carbon] infusions left. Use coal or a rat."

/obj/machinery/light/magmaforge/attackby(obj/item/W, mob/living/user, params)
	if(istype(W, /obj/item/ore/coal))
		carbon += 3
		user.dropItemToGround(W)
		qdel(W)
		to_chat(user, "<span class='info'>You threw coal upon the lava whirl. It can now perform [carbon] infusions.</span>")
		return

	if(istype(W, /obj/item/reagent_containers/food/snacks/smallrat))
		carbon += 1
		user.dropItemToGround(W)
		qdel(W)
		to_chat(user, "<span class='info'>You threw [W] on the lava whirl. That was cruel, but it can perform [carbon] infusions now.</span>")
		return

	if(istype(W, /obj/item/ore/iron))
		if(carbon <= 0)
			to_chat(user, "<span class='warning'>The automata within require source of infusion first.</span>")
			return
		if(!(W in user.held_items) || !user.temporarilyRemoveItemFromInventory(W))
			return
		W.forceMove(src)
		ore += W
		user.visible_message("<span class='info'>You slip iron-rich ore into the lava whirl. You see droplets jumping from the impact.</span>")
		cooking = 0
		return

	to_chat(user, "<span class='warning'>This smelter does not accept [W.name].</span>")
	return ..()

/obj/machinery/light/magmaforge/process()
	if(!on || actively_smelting || !ore.len)
		return

	actively_smelting = TRUE
	cooking = 0
	visible_message("<span class='notice'>The forge roars to life, as lava fumes start to rise.</span>")
	playsound(src.loc, 'sound/misc/smelter_sound.ogg', 50, FALSE)
	update_icon()

	spawn(3 SECONDS)
		while(cooking < 30)
			sleep(1 SECONDS)
			cooking++
		for(var/obj/item/I in ore)
			ore -= I
			qdel(I)
		carbon = max(0, carbon - 1)
		playsound(src, 'sound/misc/smelter_fin.ogg', 100, FALSE)
		visible_message("<span class='notice'>\The [src]'s automatas released the steel into an ingot.</span>")
		var/turf/T = get_turf(src)
		var/turf/front_turf = locate(T.x, T.y - 1, T.z)
		if(front_turf)
			var/obj/item/ingot/steel/abyssal = new(front_turf)
			abyssal.name = "tamahagane steel"
		PoisonGas()
		actively_smelting = FALSE
		cooking = 0
		update_icon()

/obj/machinery/light/magmaforge/proc/PoisonGas()
	visible_message("<span class='danger'>A cloud of noxious gas billows from the forge.</span>")
	var/datum/effect_system/smoke_spread/smoke/forgetoxin/particulate = new
	particulate.set_up(2, src)
	particulate.start()

/obj/effect/particle_effect/smoke/forgetoxin
	name = "particulate matter"
	desc = "Particles less than 10 micrometers in diameter that penetrate deep into the lungs and even enter the bloodstream."
	alpha = 80
	color = "#ccc08c"
	opaque = FALSE
	layer = EFFECTS_LAYER
	anchored = TRUE
	lifetime = 10

/obj/effect/particle_effect/smoke/forgetoxin/smoke_mob(mob/living/carbon/M)
	if(..())
		M.add_nausea(3)
		M.adjustToxLoss(rand(2, 10), 0)
		M.emote("coughs.")
		return 1

/obj/machinery/light/magmaforge/update_icon()
	if(actively_smelting)
		icon_state = "[base_state]1" //THIS ONES MOVEEES
	else
		icon_state = "[base_state]0" //this one is QUIET

/datum/effect_system/smoke_spread/smoke/forgetoxin
	effect_type = /obj/effect/particle_effect/smoke/forgetoxin

/obj/machinery/light/rogue/smelter/magmaforge/proc/steelout()
	var/turf/T = get_turf(src)
	var/turf/front_turf = locate(T.x, T.y - 1, T.z)
	if(!front_turf)
		return
	var/obj/item/ingot/steel/abyssal = new(front_turf)
	if(abyssal)
		abyssal.name = "tamahagane steel" //literally just name for the fluff. Does nothing.
	visible_message("<span class='info'>One steel ingot is released from the mold, sliding off the magmaforge.</span>")

/obj/item/rogue/artisankit
	name = "artisan kit"
	icon_state = "artisankit"
	desc = "Orthoclase bricks, automata core, pyroclasmic decanter and cindercore plate. Now with stones, it shall be a legendary magmaforge."
	w_class = WEIGHT_CLASS_NORMAL
	static_price = TRUE
	sellprice = 30
	icon = 'modular/stonekeep/kaizoku/icons/mapset/tradesector32.dmi'
