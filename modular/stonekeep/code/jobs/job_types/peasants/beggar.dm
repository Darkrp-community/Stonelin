/datum/job/vagrant
	title = "Beggar"
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	department_flag = PEASANTS
	total_positions = 15
	spawn_positions = 15
	min_pq = -100
	allowed_races = RACES_PLAYER_DELVESALLOWED
	outfit = /datum/outfit/job/stonekeep/beggar
	banned_leprosy = FALSE
	bypass_lastclass = TRUE

	tutorial = "The smell of filth and sweat no longer bother you, the glances of disgust or pity others give you familiar  ; the only reason you've not dead in a mud pit already is because you are tough as a old leather sole, hardned by ratbites, sticks and stones."
	display_order = BEGGAR_ORDER
	can_random = FALSE
	cmode_music = 'sound/music/cmode/combat_bum.ogg'


/datum/job/vagrant/New()
	. = ..()
	peopleknowme = list()

/datum/outfit/job/stonekeep/beggar/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(5))
		r_hand = /obj/item/natural/worms
	if(prob(20))
		head = /obj/item/clothing/head/knitcap
	if(prob(5))
		r_hand = /obj/item/reagent_containers/powder/moondust
	if(prob(10))
		mouth = /obj/item/clothing/face/cigarette/rollie/cannabis
	if(prob(10))
		cloak = /obj/item/clothing/cloak/raincloak/colored/brown
	if(prob(10))
		gloves = /obj/item/clothing/gloves/fingerless
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/shirt/rags
	else
		pants = /obj/item/clothing/pants/tights/colored/vagrant
		if(prob(50))
			pants = /obj/item/clothing/pants/tights/colored/vagrant/l
		shirt = /obj/item/clothing/shirt/undershirt/colored/vagrant
		if(prob(50))
			shirt = /obj/item/clothing/shirt/undershirt/colored/vagrant/l
	if(H.dna.species?.id == "abyssariad")
		mask = /obj/item/clothing/face/kaizoku/facemask/dishonor
		to_chat(H, "<span class='userdanger'>In failure I forfeited my honor and values of the Abyssal Tide. If I am to claim the essence of an Abyssariad once more, I must prove myself worthy.</span>")
		H.burakumin = TRUE
		if(H.wear_mask)
			if(istype(H.wear_mask, /obj/item/clothing/face/eyepatch || /obj/item/clothing/face/eyepatch/left ))
				qdel(H.wear_mask)
				mask = /obj/item/clothing/face/kaizoku/facemask/dishonor
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/sneaking, pick(2,3,4,5), TRUE)
		H.adjust_skillrank(/datum/skill/misc/stealing, pick(1,2,3,4,5), TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, pick (1,2,3,4,5), TRUE) // thug lyfe
		H.adjust_skillrank(/datum/skill/misc/climbing, pick(2,3,4,5), TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, pick(1,2,3,4), TRUE) // Street-fu
		H.adjust_skillrank(/datum/skill/combat/unarmed, pick(1,2,3), TRUE)
		H.change_stat(STATKEY_LCK, rand(-2, 2), TRUE)
	if(prob(5))
		r_hand = /obj/item/weapon/mace/woodclub
	if(prob(20))
		H.change_stat(STATKEY_CON, 2)
		H.change_stat(STATKEY_INT, -1)
	if(prob(20))
		H.change_stat(STATKEY_END, 3)
		H.change_stat(STATKEY_CON, -1)
	if(prob(20))
		H.change_stat(STATKEY_STR, 2)
		H.change_stat(STATKEY_CON, -1)
		H.change_stat(STATKEY_END, -1)
		H.change_stat(STATKEY_INT, -1)
	H.change_stat(STATKEY_INT, -2)
	H.change_stat(STATKEY_CON, -2)
	H.change_stat(STATKEY_END, -1)


/datum/outfit/job/vagrant
	name = "Beggar"
