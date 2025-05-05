
/datum/job/mastersohei
	title = "Elder Tideseeker"
	tutorial = "High-ranking Tideseeker who hold authority within multiple temples and Soheis retainers within their influence. \
	Often in charge of militant activities, these senior soheis are in search of demonic corruption to dismantle. \
	As the representant of Abyssanctum faith, your major duty is to mediate with the Church of the Ten to sustain cleansing \
	activities. However, the imperial faith may be a pebble on your shoes."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Changeling",
		"Skylancer",
		"Ogrun",
		"Undine"
	)
	display_order = MASTERSOHEI_ORDER
	department_flag = CHURCHMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	flag = SK_MASTERSOHEI
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	allowed_patrons = list(/datum/patron/abyssanctum/tideweaver)

	bypass_lastclass = TRUE
	outfit = /datum/outfit/job/stonekeep/mastersohei
	min_pq = 0
	selection_color = "#c2a45d"
	cmode_music = 'modular/stonekeep/sound/cmode/church/combat_templar.ogg'
	spells = list(
		/obj/effect/proc_holder/spell/self/convertrole/sohei,
	)

/datum/outfit/job/stonekeep/mastersohei/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/helmet/heavy/bucket/soheidemon
	wrists = /obj/item/clothing/neck/psycross/silver/abyssanctum
	shirt = /obj/item/clothing/suit/roguetown/shirt/eastshirt2
	armor = /obj/item/clothing/armor/chainmail/hauberk/kusari
	pants = /obj/item/clothing/pants/chainlegs/sendan
	shoes = /obj/item/clothing/shoes/sandals/geta
	belt = /obj/item/storage/belt/kaizoku/leather/daisho/random
	beltl = /obj/item/storage/belt/pouch/coins/mid
	ring = /obj/item/clothing/ring/silver
	cloak = /obj/item/clothing/cloak/odoshisohei
	neck = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/random
	gloves = /obj/item/clothing/gloves/chain/kikko
	r_hand = /obj/item/weapon/polearm/halberd/bisento
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -2)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/churn)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	//Paladins, while devout warriors spent WAY too much time studying the blade. No more acolyte+
	C.update_devotion(50, 50)
	C.holder_mob = H
	C.grant_spells_sohei(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/churn)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) //It's meant to be only heavy armor, but Kusari is medium. Idk how templar is doing, but in my testing, the armor was freaked.
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/obj/effect/proc_holder/spell/self/convertrole/sohei
	name = "Recruit Warmonk"
	new_role = "Warmonk"
	overlay_state = "recruit_warmonk"
	recruitment_faction = "Church"
	recruitment_message = "You shall purificate the world, %RECRUIT!"
	accept_message = "FOR ABYSSOR AND THE WEEPER!"
	refuse_message = "I refuse."

/obj/effect/proc_holder/spell/self/convertrole/sohei/convert(mob/living/carbon/human/recruit, mob/living/carbon/human/recruiter)
	. = ..()
	if(!.)
		return
	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(recruit, recruit.patron)
	C.grant_spells(recruit)
	recruit.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
