
/* Notes-
Acolytes are all healers but with different flavors depending on Patron.
*/
/datum/job/monk
	title = "Acolyte"
	flag = SK_ACOLYTE
	department_flag = CHURCHMEN
	display_order =  ACOLYTE_ORDER
	total_positions = 4
	spawn_positions = 4

	allowed_patrons = SK_TEMPLE_PATRONS
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	tutorial = "Chores, exercise, prayer... and more chores. You are a humble acolyte at the Temple of the Ten not yet a trained guardian or an ordained priest. But who else would keep the fires lit and the floors clean?"
	allowed_patrons = 	list(/datum/patron/divine/astrata, /datum/patron/divine/noc, /datum/patron/divine/abyssor, /datum/patron/divine/pestra, /datum/patron/divine/eora, /datum/patron/divine/necra)
	outfit = /datum/outfit/job/stonekeep/acolyte

	give_bank_account = 0
	min_pq = -5
	bypass_lastclass = TRUE
	cmode_music = 'sound/music/cmode/church/combat_templar.ogg'

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	advclass_cat_rolls = list(CTAG_SKACOLYTE = 20)	//Handles class selection.

//Universal stuff for all acolytes
/datum/outfit/job/stonekeep/acolyte
	shirt = /obj/item/clothing/shirt/undershirt/priest
	backl = /obj/item/storage/backpack/satchel/cloth
	backpack_contents = list(/obj/item/needle)

/* ! ! ! Class Selection Section Below ! ! !
Design philosphy:
- Footman, specializes in using axes/maces and shields. - Medium armor
*/

/datum/advclass/sk/acolyte/templemaiden
	name = "Temple Maiden"
	tutorial = "<br><br><font color='#c394b2'><span class='bold'>Devotees of the Mother, dedicated to make the Temple a more beautiful place. \
	Sanctified work is playing music and tending to the wounds of the pious, but also provide comfort to those worthy who aspire to their Gods favor. \
	The more senior usually tend to the Temple gardens, and help rear the many fatherless children around, many whom grow up to be Templars or Acolytes.</span></font><br>"
	outfit = /datum/outfit/job/stonekeep/temple/templemaiden
	category_tags = list(CTAG_SKACOLYTE)
	allowed_patrons = 	list(/datum/patron/divine/eora)
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	allowed_sexes = list(FEMALE)

/datum/outfit/job/stonekeep/temple/templemaiden/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.patron != /datum/patron/divine/eora)
		H.set_patron(/datum/patron/divine/eora)

	H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
	H.clamped_adjust_skillrank(/datum/skill/misc/music, 4, 4, TRUE)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)

	H.add_spell(/datum/action/cooldown/spell/diagnose/holy)
	H.add_spell(/datum/action/cooldown/spell/healing)

	backpack_contents = list(/obj/item/clothing/shirt/robe/hierodule)

	r_hand = /obj/item/weapon/polearm/woodstaff/quarterstaff
	head = /obj/item/clothing/head/padded/rabbetvisage
	neck = /obj/item/clothing/neck/leathercollar/hierodule
	armor = /obj/item/clothing/armor/corset/hierodule
	shirt = /obj/item/clothing/shirt/robe/hierodule
	wrists = /obj/item/clothing/neck/psycross/silver/eora
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/key/church
	shoes = /obj/item/clothing/shoes/sandals
	var/loadout = rand(1,2)
	switch(loadout)
		if(1)
			backr = /obj/item/instrument/harp
		if(2)
			backr = /obj/item/instrument/flute

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BARDIC_TRAINING, TRAIT_GENERIC)
	H.change_stat(STATKEY_PER, 1)
	H.change_stat(STATKEY_SPD, 1)

	new /datum/devotion/cleric_holder(H, H.patron)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)


/datum/advclass/sk/temple/moonseer
	name = "Moon Seer"
	tutorial = "<br><br><font color='#949cc3'><span class='bold'>You are a librarian and guardian of the written word, a wise one giving counsel, a seer who can percieve what is hidden.<br>\
	Eyes turning white from staring too long at the moon, those chosen by the Moon Prince are second only to the Cult of Astrata in prestige.</span></font><br><br>"
	outfit = /datum/outfit/job/stonekeep/temple/moonseer
	allowed_patrons = 	list(/datum/patron/divine/noc)
	category_tags = list(CTAG_SKACOLYTE)

/datum/outfit/job/stonekeep/temple/moonseer/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.patron != /datum/patron/divine/noc)
		H.set_patron(/datum/patron/divine/noc)
	H.virginity = TRUE

	backpack_contents = list(/obj/item/scrying, /obj/item/key/church)
	head = /obj/item/clothing/head/roguehood/nochood
	neck = /obj/item/clothing/neck/psycross/noc
	wrists = /obj/item/clothing/wrists/nocwrappings
	shoes = /obj/item/clothing/shoes/sandals
	armor = /obj/item/clothing/shirt/robe/noc
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/weapon/knife/dagger/silver
	shoes = /obj/item/clothing/shoes/sandals

	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
	H.adjust_skillrank(/datum/skill/labor/mathematics, 3, TRUE)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
	H.change_stat(STATKEY_INT, 2)
	H.change_stat(STATKEY_END, 1)

	ADD_TRAIT(H, TRAIT_TUTELAGE, TRAIT_GENERIC) // better apprentice learning
	ADD_TRAIT(H, TRAIT_NIGHT_OWL, TRAIT_GENERIC)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells(H)

	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(!eyes)
		return
	eyes.see_in_dark = 3
	eyes.lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT
	H.update_sight()



/datum/advclass/sk/temple/acolyte
	name = "Acolyte"
	tutorial = "Chores must be done, gardens tended, brewing done to bring in profits for the Temple. You are a healer and a conduit for the divine in this world."
	outfit = /datum/outfit/job/stonekeep/temple/acolyte
	category_tags = list(CTAG_SKACOLYTE)
	allowed_patrons = 	list(/datum/patron/divine/astrata, /datum/patron/divine/abyssor, /datum/patron/divine/pestra, /datum/patron/divine/eora)

/datum/outfit/job/stonekeep/temple/acolyte/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE

	backpack_contents = list(/obj/item/key/church)
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/weapon/mace/woodclub

	switch(H.patron?.type)
		if(/datum/patron/divine/astrata)
			head = /obj/item/clothing/head/roguehood/astrata
			neck = /obj/item/clothing/neck/psycross/silver/astrata
			wrists = /obj/item/clothing/wrists/wrappings
			armor = /obj/item/clothing/shirt/robe/astrata
			shoes = /obj/item/clothing/shoes/sandals
		if(/datum/patron/divine/pestra)
			head = /obj/item/clothing/head/roguehood/colored/brown
			neck = /obj/item/clothing/neck/psycross/silver/pestra
			shirt = /obj/item/clothing/shirt/undershirt/colored/green
			armor = /obj/item/clothing/shirt/robe/phys
			shoes = /obj/item/clothing/shoes/sandals
		if(/datum/patron/divine/eora)
			head = /obj/item/clothing/head/roguehood/eora
			neck = /obj/item/clothing/neck/psycross/silver/eora
			shoes = /obj/item/clothing/shoes/sandals
			armor = /obj/item/clothing/shirt/robe/eora
		if(/datum/patron/divine/abyssor)
			head = /obj/item/clothing/head/padded/shrinekeeper
			neck = /obj/item/clothing/neck/psycross/silver/abyssor
			armor = /obj/item/clothing/shirt/robe/shrinekeeper
			shirt = /obj/item/clothing/shirt/rags/monkgarb/random
			shoes = /obj/item/clothing/shoes/sandals/geta
			wrists = /obj/item/clothing/wrists/shrinekeeper
			H.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
		else // Failsafe
			head = /obj/item/clothing/head/roguehood/random
			neck = /obj/item/clothing/neck/psycross/silver
			shoes = /obj/item/clothing/shoes/boots
			armor = /obj/item/clothing/shirt/robe/colored/plain

	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE) // They get this and a wooden staff to defend themselves
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
	H.change_stat(STATKEY_INT, 1)
	H.change_stat(STATKEY_END, 2)
	H.change_stat(STATKEY_PER, -1)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells(H)



/datum/advclass/sk/temple/gravekeeper
	name = "Gravekeeper"
	tutorial = "<font color='#78797e'>As a servant of Necra, you embody the sanctity of her domain, ensuring the dead rest peacefully within the earth. You are the bane of grave robbers and necromancers, and your holy magic brings undead back into Necra's embrace: the only rightful place for lost souls."
	outfit = /datum/outfit/job/stonekeep/temple/gravekeeper

	category_tags = list(CTAG_SKACOLYTE)
	allowed_patrons = 	list(/datum/patron/divine/necra)
	allowed_races = RACES_PLAYER_DELVESALLOWED

/datum/outfit/job/stonekeep/temple/gravekeeper/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.patron != /datum/patron/divine/necra)
		H.set_patron(/datum/patron/divine/necra)
	head = /obj/item/clothing/head/padded/deathshroud
	neck = /obj/item/clothing/neck/psycross/silver/necra
	pants = /obj/item/clothing/pants/trou/leather/mourning
	armor = /obj/item/clothing/shirt/robe/necra
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/keyring/gravetender
	beltr = /obj/item/storage/belt/pouch/coins/poor
	backr = /obj/item/weapon/shovel

	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)

	H.change_stat(STATKEY_STR, 1)
	H.change_stat(STATKEY_INT, 1)
	H.change_stat(STATKEY_END, 2)
	H.change_stat(STATKEY_PER, -1)
	H.change_stat(STATKEY_LCK, -1)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) // Operating with corpses every day.
	ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC) // In case they need to move tombs or anything.
	ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells(H)

