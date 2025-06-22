	/*==============*
	*				*
	*  	Skylancer  	*
	*				*
	*===============*/

//	( Not done yet. But hopefully temporary flying. )
//	( Not done yet, but hopefully easily breakable bones. )

/mob/living/carbon/human/species/abyssariad/skylancer
	race = /datum/species/abyssariad/skylancer

/datum/species/abyssariad/skylancer
	name = "Skylancer"
	id = "abyssariad"
	desc = "<b>Sky branched Champions</b><br>\
	Molded by Abyssor's will to battle in Blood Apotheosis to protect Abyssal relics, these \
	avian denmorians are an graceful race suited to navigate rocky shores and battlefronts. Inquisitive and aloof, \
	they are as vast and graceful as the skies, the true reflection of Abyssor's previous shape.\
	\n\n\
	Their specialized syrinxs makes them complex vocalizators for spionage and disguise, and when needed, \
	they can use their wings to fly, but it is severely exhausting, while remaining lightweight is necessary to do so, \
	so much that even their bones are hollow to remain light and oxygenated, lowering their physical resilience for vigor.\
	\n\n\
	THIS IS A ESTEEMED BUT DISTRUSTED RACE, SUBJECT TO PUBLIC UNEASE AND HIGHER EXPECTATIONS. <B>PROVE YOUR VALUE AS PURIFIED JEWEL OR DIE IN CORRUPTIVE DISHONOR.</B>"

	skin_tone_wording = "Championage Branch"

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = list("mcolor" = "FFF", "ears" = "TenguS", "tail_human" = "TenguV")
	use_skintones = 1
	possible_ages = list(AGE_IMMORTAL) //Abyssariads are Immortal. However, if they become stray from Abyssor's will - they suffer severe dementia after some decades.
//	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'modular/stonekeep/kaizoku/icons/abyssariad_bodies/male/mtan.dmi'
	limbs_icon_f = 'modular/stonekeep/kaizoku/icons/abyssariad_bodies/female/ftan.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	hairyness = "t2"
	use_f = TRUE
	soundpack_m = /datum/voicepack/male/abyssariad
	soundpack_f = /datum/voicepack/female/abyssariad
	offset_features = list(OFFSET_ID = list(0,2), OFFSET_GLOVES = list(0,0), OFFSET_WRISTS = list(0,1),\
	OFFSET_CLOAK = list(0,2), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
	OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,2), \
	OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,2), OFFSET_PANTS = list(0,2), \
	OFFSET_SHIRT = list(0,2), OFFSET_ARMOR = list(0,2), OFFSET_HANDS = list(0,2), OFFSET_UNDIES = list(0,0), \
	OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
	OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
	OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
	OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
	OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0))
	specstats = list("strength" = -1, "perception" = 2, "intelligence" = 0, "constitution" = -2, "endurance" = 2, "speed" = 2, "fortune" = 0)
	specstats_f = list("strength" = -1, "perception" = 2, "intelligence" = 0, "constitution" = -2, "endurance" = 2, "speed" = 2, "fortune" = 0) // Don't even bother making each gender different. Abyssariads are equals in championage.
	enflamed_icon = "widefire"
//	minrace_pq = 0

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/tengu,
		ORGAN_SLOT_TAIL = /obj/item/organ/tail/wings,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/guts,
	)

	customizers = list(
		/datum/customizer/organ/ears/tengu,
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/organ/tail/tengu,
		/datum/customizer/bodypart_feature/hair/head/humanoid/kaizoku,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)

	body_markings = list(
		/datum/body_marking/tonage,
	)



/datum/species/abyssariad/skylancer/get_span_language(datum/language/message_language)
	if(!message_language)
		return
//	if(message_language.type == /datum/language/abyssal)
//		return list(SPAN_ABYSSAL)
	return message_language.spans

/datum/species/abyssariad/skylancer/check_roundstart_eligible()
	return TRUE

/datum/species/abyssariad/skylancer/get_skin_list()
	return sortList(list(
		"Oathbound Muqian" = SKIN_COLOR_OATHBOUND_MUQIAN,
		"Oathbound Kaizoku" = SKIN_COLOR_OATHBOUND_KAIZOKU,
		"Oathbound Shuhen" = SKIN_COLOR_OATHBOUND_SHUHEN,
		"Oathbound Linyou" = SKIN_COLOR_OATHBOUND_LINYOU,
		"Oathbound Dustwalker" = SKIN_COLOR_OATHBOUND_DUSTWALKER,
		"Warpcaster Muqian" = SKIN_COLOR_WARPCASTER_MUQIAN,
		"Warpcaster Kaizoku" = SKIN_COLOR_WARPCASTER_KAIZOKU,
		"Warpcaster Shuhen" = SKIN_COLOR_WARPCASTER_SHUHEN,
		"Warpcaster Linyou" = SKIN_COLOR_WARPCASTER_LINYOU,
		"Peppersblow Warpcaster" = SKIN_COLOR_PEPPERSBLOW,
	))


/datum/species/abyssariad/skylancer/get_hairc_list()
	return sortList(list(
	"blond - pale" = "9d8d6e",
	"blond - dirty" = "88754f",
	"blond - drywheat" = "d5ba7b",
	"blond - strawberry" = "c69b71",

	"brown - mud" = "362e25",
	"brown - oats" = "584a3b",
	"brown - grain" = "58433b",
	"brown - soil" = "48322a",

	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b",

	"red - berry" = "48322a",
	"red - wine" = "82534c",
	"red - sunset" = "82462b",
	"red - blood" = "822b2b",

	"white - platinum" = "f8f3f3",
	"white - silver" = "ddddc8",
	"white - oceanid" = "b8d4de"

	))

/*	This using the older proc causes runtimes, if possible adapt to new below ROGTODO
/datum/species/abyssariad/skylancer/random_name(gender,unique,lastname)
	var/static/list/male_names = world.file2list("modular/stonekeep/kaizoku/strings/names/abyssnorm.txt")
	var/static/list/female_names = world.file2list("modular/stonekeep/kaizoku/strings/names/abyssnorf.txt")

	var/list/names = (gender == FEMALE) ? female_names : male_names
	var/randname

	if(unique)
		for(var/i in 1 to 10)
			randname = pick(names)
			if(!findname(randname))
				break
	else
		randname = pick(names)

	return "[randname] Clanless"

/datum/species/abyssariad/skylancer/random_surname()
	return " [pick(world.file2list("modular/stonekeep/kaizoku/strings/names/abyssnorm.txt"))]"
*/

/datum/species/abyssariad/skylancer/get_possible_names(gender = MALE)
	var/static/list/male_names = world.file2list('modular/stonekeep/kaizoku/strings/names/abyssnorm.txt')
	var/static/list/female_names = world.file2list('modular/stonekeep/kaizoku/strings/names/abyssnorf.txt')
	return (gender == FEMALE) ? female_names : male_names

/datum/species/abyssariad/skylancer/random_name(gender = MALE, unique = FALSE)
	var/list/possible_names = get_possible_names(gender)
	if(!possible_names || !length(possible_names))
		return "Nameless Clanless" //This is a fallback in case we get any pesky runtime.

	var/first_name
	if(!unique)
		first_name = pick(possible_names)
	else
		for(var/i in 1 to 10)
			first_name = pick(possible_names)
			if(!findname(first_name))
				break

	return "[first_name] Clanless"

/datum/species/abyssariad/skylancer/get_possible_surnames(gender = MALE)
	var/static/list/last_names = world.file2list('modular/stonekeep/kaizoku/strings/names/abyssnorlast.txt')
	return last_names
