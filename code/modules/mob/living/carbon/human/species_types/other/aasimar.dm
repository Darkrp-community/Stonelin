	/*==============*
	*				*
	*	Aasimar		*
	*				*
	*===============*/

//	( + Pain Resist )
//	( + Bleed Resist )

/mob/living/carbon/human/species/aasimar
	race = /datum/species/aasimar

/datum/species/aasimar
	name = "Aasimar"
	id = SPEC_ID_AASIMAR
	desc = "Ageless living statues sculpted by Astrata for use in servitude. \
	\n\n\
	Used as soldiers to fight in the Apotheosis God-War. \
	They quickly earned scorn and fear from the mortal races they fought alongside \
	for their indifference to the suffering of their allies and unquestioning brutality. \
	The aasimar who survived the war have been abandoned by Astrata, \
	left to face an uncertain fate alongside the other races of Grimoria. \
	\n\n\
	It has been long since the Apotheosis and memories of their violent legacy have faded, \
	but many still view these aasimar survivors as emotionally dull, stubborn, and simple-minded brutes... \
	though this is not always the case. \
	Aasimar are known for their incredible strength and resilience, and are a prized addition to any shield wall. \
	However, they possess less capacity for independent thought due to their wartime construction."

	skin_tone_wording = "Craft"

	species_traits = list(EYECOLOR,HAIR,LIPS,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	use_skintones = TRUE

	possible_ages = list(AGE_IMMORTAL)
	changesource_flags = WABBAJACK

	limbs_icon_m = 'modular/stonekeep/icons/mobs/mt_aasimar.dmi'
	limbs_icon_f = 'modular/stonekeep/icons/mobs/ft_aasimar.dmi'

	soundpack_m = /datum/voicepack/male/serious

	offset_features_m = list(
		OFFSET_ID = list(0,2),\
		OFFSET_GLOVES = list(0,2),\
		OFFSET_WRISTS = list(0,2),\
		OFFSET_CLOAK = list(0,2),\
		OFFSET_FACEMASK = list(0,2),\
		OFFSET_HEAD = list(0,2),\
		OFFSET_FACE = list(0,2),\
		OFFSET_BELT = list(0,1),\
		OFFSET_BACK = list(0,1),\
		OFFSET_NECK = list(0,2),\
		OFFSET_MOUTH = list(0,2),\
		OFFSET_PANTS = list(0,1),\
		OFFSET_SHIRT = list(0,2),\
		OFFSET_ARMOR = list(0,2),\
		OFFSET_HANDS = list(0,2),\
		OFFSET_UNDIES = list(0,1),\
		)
	offset_features_f = list(
		OFFSET_ID = list(0,2),\
		OFFSET_GLOVES = list(0,2),\
		OFFSET_WRISTS = list(0,2),\
		OFFSET_CLOAK = list(0,2),\
		OFFSET_FACEMASK = list(0,2),\
		OFFSET_HEAD = list(0,2),\
		OFFSET_FACE = list(0,2),\
		OFFSET_BELT = list(0,1),\
		OFFSET_BACK = list(0,1),\
		OFFSET_NECK = list(0,2),\
		OFFSET_MOUTH = list(0,2),\
		OFFSET_PANTS = list(0,1),\
		OFFSET_SHIRT = list(0,2),\
		OFFSET_ARMOR = list(0,2),\
		OFFSET_HANDS = list(0,2),\
		OFFSET_UNDIES = list(0,1),\
	)

	specstats_m = list(STATKEY_STR = 1, STATKEY_PER = 0, STATKEY_INT = -2, STATKEY_CON = 2, STATKEY_END = 1, STATKEY_SPD = -1, STATKEY_LCK = 0)
	specstats_f = list(STATKEY_STR = 1, STATKEY_PER = 0, STATKEY_INT = -2, STATKEY_CON = 2, STATKEY_END = 1, STATKEY_SPD = -1, STATKEY_LCK = 0)
	enflamed_icon = "widefire"

	meat = /obj/item/natural/stone
	hairyness = ""

	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
	)

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid/male, // SK EDIT
		/datum/customizer/bodypart_feature/hair/head/humanoid/female, // SK EDIT
		/datum/customizer/bodypart_feature/face_detail,
	)

	body_markings = list(
		/datum/body_marking/tonage,
	)

	pain_mod = 0.9 // 10% less pain from wounds
	bleed_mod = 0.8 // 20% less bleed rate from injuries

/datum/species/aasimar/check_roundstart_eligible()
	return TRUE

/datum/species/aasimar/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)

/datum/species/aasimar/after_creation(mob/living/carbon/C)
	. = ..()
	C.grant_language(/datum/language/celestial)
	to_chat(C, "<span class='info'>I can speak Celestial with ,c before my speech.</span>")

/datum/species/aasimar/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/celestial)

/datum/species/aasimar/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/aasimar/get_skin_list()
	return sortList(list(
		"Planetar" = "96640d" ,
		"Solar" = "d1c386",
		"Empyrea" = "b7ad72",
		"Gaeia" = "bc7d47",
		"Celestial" = "a5882a",
		"Olympia" = "bdc34d",
	))

/datum/species/aasimar/get_hairc_list()
	return sortList(list(
	"white - silver" = "d3d9e3",
	"white - alabaster" = "fffffc",
	"white - skies" = "a1b4d4",

	"blond - sunlight" = "f3f797",
	"blond - strawberry" = "c69b71",
	"blond - pale" = "9d8d6e",

	"red - flame" = "ab4637",
	"red - sunset" = "bf6821",
	"red - blood" = "822b2b",
	"red - maroon" = "612929"
	))

/datum/species/aasimar/get_possible_names(gender = FALSE)
	var/static/list/male_names = world.file2list('strings/rt/names/other/aasm.txt')
	var/static/list/female_names = world.file2list('strings/rt/names/other/aasf.txt')
	return (gender == FEMALE) ? female_names : male_names

/datum/species/aasimar/get_possible_surnames(gender)
	return null

/datum/species/aasimar/get_native_language()
	return "Celestial"
