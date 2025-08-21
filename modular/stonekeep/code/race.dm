/* * * * * * * **
 *				*
 *	 Racism		*
 *				*
 * * * * * * * * **/






// =================================================================================

#define DELF_SCORPION "5f665b"
/*

/datum/species/elf/dark/on_species_gain(mob/living/carbon/C, datum/species/old_species, datum/preferences/pref_load)
	. = ..()
	ADD_TRAIT(C, TRAIT_DARKLING, SPECIES_TRAIT)


/datum/species/elf/dark/get_accent_list()
	return strings("SKdarkelf_replacement.json", "darkelf")

/datum/species/elf/dark/get_accent(mob/living/carbon/human/H)
	return strings("SKdarkelf_replacement.json", "darkelf")
*/


// =================================================================================

/*
/datum/species/aasimar/check_roundstart_eligible()
	if(SSmapping.config.map_name == "Stone Hamlet")
		return FALSE
	else
		return TRUE
*/



/datum/species/human/halfelf/check_roundstart_eligible()
	if(SSmapping.config.map_name == "Stone Hamlet")
		return FALSE
	else
		return TRUE

// =================================================================================
/datum/species/halforc
	possible_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)

/datum/species/halforc/check_roundstart_eligible()
	if(SSmapping.config.map_name == "Stone Hamlet")
		return FALSE
	else
		return TRUE

// =================================================================================

/datum/species/abyssariad/skylancer/check_roundstart_eligible()
	if(SSmapping.config.map_name == "Stone Hamlet")
		return FALSE
	else
		return TRUE

/datum/species/abyssariad/ogrun/check_roundstart_eligible()
	if(SSmapping.config.map_name == "Stone Hamlet")
		return FALSE
	else
		return TRUE

/datum/species/elf/undine/check_roundstart_eligible()
	if(SSmapping.config.map_name == "Stone Hamlet")
		return FALSE
	else
		return TRUE
/*
/datum/species/abyssariad/changeling/check_roundstart_eligible()
	if(SSmapping.config.map_name == "Stone Hamlet")
		return FALSE
	else
		return TRUE
*/



	/*=================*
	*				   *
	*	 ex Hollow-kin *
	*				   *
	*==================*/

// ( -1 STR, +2 PER, +1 INT, -1 CON, +1 SPD, -1 FOR)

/datum/species/demihuman
	name = "Beastfolk"
	id = SPEC_ID_HOLLOWKIN
	desc = "Some babies are cursed by Dendor to have bestial features, to the grief and shame of their parents. Many are put into the forest as babes, and those who remain in society are treated as lesser. A few gifted ones from respectable families might make a place for themselves but they will never be fully accepted."
	possible_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	specstats_m = list(STATKEY_STR = -1, STATKEY_PER = 2, STATKEY_INT = 1, STATKEY_CON = -1, STATKEY_SPD = 1, STATKEY_LCK = -1)
	specstats_f = list(STATKEY_STR = -2, STATKEY_PER = 2, STATKEY_INT = 1, STATKEY_CON = -1, STATKEY_SPD = 1, STATKEY_LCK = -1)
	patreon_req = FALSE

/datum/species/demihuman/after_creation(mob/living/carbon/C)
	. = ..()
	C.remove_language(/datum/language/beast)

/datum/species/demihuman/check_roundstart_eligible()
	if(SSmapping.config.map_name == "Stone Hamlet")
		return FALSE
	else
		return TRUE
