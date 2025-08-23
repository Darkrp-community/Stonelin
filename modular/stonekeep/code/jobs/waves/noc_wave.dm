// Fires automatically if Noc storyteller is chosen, as a migrant wave, once. So that the window of opportunity if you wanna do this gimmick.

/datum/migrant_role/sk/nocpriest
	name = "Priest of Noc"
	greet_text = "It is time to replace the Sun Queen with her superior brother as the head of the Pantheon! Inspired by divine command in your dreams, you must take over the local Temple and make them recognize the supremacy of Noc."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALL_RACES_SK_LIST
	outfit = /datum/outfit/job/sk_migration/noc_priest
	grant_lit_torch = TRUE

/datum/migrant_role/sk/nocpriest/after_spawn(mob/living/carbon/human/character)
	. = ..()
	character.forceMove(pick(GLOB.mountainroad_starts))

/datum/outfit/job/sk_migration/noc_priest/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		if(H.patron != /datum/patron/divine/noc) // For some stupid reason this was checking for Dendor before.
			H.set_patron(/datum/patron/divine/noc, TRUE)
	H.virginity = TRUE

	head = /obj/item/clothing/head/helmet/nocpriest
	neck = /obj/item/clothing/neck/psycross/noc
	wrists = /obj/item/clothing/wrists/nocwrappings
	shoes = /obj/item/clothing/shoes/sandals
	armor = /obj/item/clothing/shirt/robe/noc
	shirt = /obj/item/clothing/armor/gambeson/heavy
	shoes = /obj/item/clothing/shoes/boots/furlinedboots
	pants = /obj/item/clothing/pants/trou/leather/heavy
	belt = /obj/item/storage/belt/leather/rope
	beltl = /obj/item/weapon/knife/dagger/silver
	backr = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/natural/cloth = 1, /obj/item/needle/thorn = 1, /obj/item/scrying = 1, /obj/item/storage/belt/pouch/coins/mid = 1, /obj/item/reagent_containers/glass/bottle/healthpot = 1)
	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)

	ADD_TRAIT(H, TRAIT_TUTELAGE, TRAIT_GENERIC) // better apprentice learning
	ADD_TRAIT(H, TRAIT_NIGHT_OWL, TRAIT_GENERIC)
	H.change_stat(STATKEY_PER, 2)
	H.change_stat(STATKEY_INT, 3)
	H.change_stat(STATKEY_END, 1)

	if(H.mind)
		H.cmode_music = 'sound/music/cmode/antag/combat_cult.ogg'

		var/list/spells = list(/datum/action/cooldown/spell/undirected/list_target/convert_role/nocite)
		for(var/S in spells)
			H.add_spell(new S)

	var/obj/item/weapon/polearm/woodstaff/aries/noc/P = new()
	H.put_in_hands(P, forced = TRUE)

	var/holder = H.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_priest()
		devotion.grant_to(H)


	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(!eyes)
		return
	eyes.see_in_dark = 3
	eyes.lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT
	H.update_sight()
	H.update_icons()

/datum/migrant_wave/noc_cult
	name = "The Noc Apostate"
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/noc_cult_second
	roles = list(
		/datum/migrant_role/sk/nocpriest = 1
		)
	greet_text = "Too long the Moon Prince has been refused his rightful place as the primary God by the cult of his sister Astrata. It is time to right this wrong. They call you apostate, but you know you see the truth."


/datum/migrant_wave/noc_cult_second
	name = "The Noc Apostate"
	weight = 5
	downgrade_wave = /datum/migrant_wave/noc_cult_third
	roles = list(
		/datum/migrant_role/sk/nocpriest = 1
		)
	greet_text = "Too long the Moon Prince has been refused his rightful place as the primary God by the cult of his sister Astrata. It is time to right this wrong. They call you apostate, but you know you see the truth."

/datum/migrant_wave/noc_cult_third
	name = "The Noc Apostate"
	weight = 5
	roles = list(
		/datum/migrant_role/sk/nocpriest = 1
		)
	greet_text = "Too long the Moon Prince has been refused his rightful place as the primary God by the cult of his sister Astrata. It is time to right this wrong. They call you apostate, but you know you see the truth."


/datum/action/cooldown/spell/undirected/list_target/convert_role/nocite // Placeholder ROGTODO make it not shit
	name = "Recruit Nocite"
	button_icon_state = "recruit_templar"

	new_role = "Templar"
	recruitment_faction = "Church"
	recruitment_message = "Serve NOC, %RECRUIT!"
	accept_message = "FOR THE MOON PRINCE!"
	refuse_message = "I refuse."



/datum/round_event_control/antagonist/migrant_wave/nocpriest
	name = "Noc Priest"
	wave_type = /datum/migrant_wave/noc_cult

	weight = 100
	max_occurrences = 1

	earliest_start = 0 SECONDS

	tags = list(
		TAG_NOCEVENT,
	)
	alert_observers = TRUE
	allowed_storytellers = list(/datum/storyteller/noc)
