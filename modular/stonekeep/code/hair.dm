/*
/datum/customizer_choice/bodypart_feature/hair/head/humanoid(gender)
	switch(gender)
		if(MALE)
			return accessories = list(/datum/sprite_accessory/hair/head/bald,
				/datum/sprite_accessory/hair/head/adventurer_human,
				/datum/sprite_accessory/hair/head/berserker,
				/datum/sprite_accessory/hair/head/bog,
				/datum/sprite_accessory/hair/head/boss_dwarf,
				/datum/sprite_accessory/hair/head/bowlcut,
				/datum/sprite_accessory/hair/head/brother
				/datum/sprite_accessory/hair/head/cavehead,
				/datum/sprite_accessory/hair/head/conscript,
				/datum/sprite_accessory/hair/head/courtier,
				/datum/sprite_accessory/hair/head/dome,
				/datum/sprite_accessory/hair/head/druid,
				/datum/sprite_accessory/hair/head/fancy_elf,
				/datum/sprite_accessory/hair/head/forester,
				/datum/sprite_accessory/hair/head/foreigner_tief,
				/datum/sprite_accessory/hair/head/forsaken_aas,
				/datum/sprite_accessory/hair/head/forged,
				/datum/sprite_accessory/hair/head/graceful,
				/datum/sprite_accessory/hair/head/heroic,
				/datum/sprite_accessory/hair/head/hunter,
				/datum/sprite_accessory/hair/head/landlord,
				/datum/sprite_accessory/hair/head/lover_tief,
				/datum/sprite_accessory/hair/head/lion,
				/datum/sprite_accessory/hair/head/monk,
				/datum/sprite_accessory/hair/head/majestic_human,
				/datum/sprite_accessory/hair/head/merc,
				/datum/sprite_accessory/hair/head/miner_dwarf,
				/datum/sprite_accessory/hair/head/nobility_human,
				/datum/sprite_accessory/hair/head/nomadic_humtief,
				/datum/sprite_accessory/hair/head/pirate,
				/datum/sprite_accessory/hair/head/princely,
				/datum/sprite_accessory/hair/head/raider,
				/datum/sprite_accessory/hair/head/rogue,
				/datum/sprite_accessory/hair/head/romantic,
				/datum/sprite_accessory/hair/head/ronin,
				/datum/sprite_accessory/hair/head/scribe,
				/datum/sprite_accessory/hair/head/southern_human,
				/datum/sprite_accessory/hair/head/son,
				/datum/sprite_accessory/hair/head/son_elf,
				/datum/sprite_accessory/hair/head/squire_human,
				/datum/sprite_accessory/hair/head/steward,
				/datum/sprite_accessory/hair/head/swain,
				/datum/sprite_accessory/hair/head/top_aas,
				/datum/sprite_accessory/hair/head/troubadour,
				/datum/sprite_accessory/hair/head/tied,
				/datum/sprite_accessory/hair/head/tied_long,
				/datum/sprite_accessory/hair/head/trimmed,
				/datum/sprite_accessory/hair/head/warrior,
				/datum/sprite_accessory/hair/head/woodsman_elf,
				/datum/sprite_accessory/hair/head/vagabond,
				/datum/sprite_accessory/hair/head/zybantu,
				)
		if(FEMALE)
			return accessories = list(/datum/sprite_accessory/hair/head/amazon,
				/datum/sprite_accessory/hair/head/archivist,
				/datum/sprite_accessory/hair/head/barbarian,
				/datum/sprite_accessory/hair/head/beartails,
				/datum/sprite_accessory/hair/head/bun,
				/datum/sprite_accessory/hair/head/bob,
				/datum/sprite_accessory/hair/head/conscriptf,
				/datum/sprite_accessory/hair/head/consort,
				/datum/sprite_accessory/hair/head/cotton_elf,
				/datum/sprite_accessory/hair/head/curlyshort,
				/datum/sprite_accessory/hair/head/damsel,
				/datum/sprite_accessory/hair/head/fancy_femelf,
				/datum/sprite_accessory/hair/head/grumpy_f,
				/datum/sprite_accessory/hair/head/gnomish_f,
				/datum/sprite_accessory/hair/head/hearth_f,
				/datum/sprite_accessory/hair/head/homely,
				/datum/sprite_accessory/hair/head/junia,
				/datum/sprite_accessory/hair/head/lady,
				/datum/sprite_accessory/hair/head/loosebraid,
				/datum/sprite_accessory/hair/head/maiden,
				/datum/sprite_accessory/hair/head/maid,
				/datum/sprite_accessory/hair/head/majestic_dwarf_F,
				/datum/sprite_accessory/hair/head/majestic_f,
				/datum/sprite_accessory/hair/head/matron,
				/datum/sprite_accessory/hair/head/messy,
				/datum/sprite_accessory/hair/head/mysterious_elf,
				/datum/sprite_accessory/hair/head/mystery,
				/datum/sprite_accessory/hair/head/noblesse,
				/datum/sprite_accessory/hair/head/nun,
				/datum/sprite_accessory/hair/head/performer,
				/datum/sprite_accessory/hair/head/pix,
				/datum/sprite_accessory/hair/head/plain,
				/datum/sprite_accessory/hair/head/princess,
				/datum/sprite_accessory/hair/head/queen,
				/datum/sprite_accessory/hair/head/rapunzel,
				/datum/sprite_accessory/hair/head/rose,
				/datum/sprite_accessory/hair/head/roughtails,
				/datum/sprite_accessory/hair/head/shrine,
				/datum/sprite_accessory/hair/head/soilbride,
				/datum/sprite_accessory/hair/head/spicy,
				/datum/sprite_accessory/hair/head/squire_f,
				/datum/sprite_accessory/hair/head/tails,
				/datum/sprite_accessory/hair/head/tied_pony,
				/datum/sprite_accessory/hair/head/tiedup,
				/datum/sprite_accessory/hair/head/tiedcutf,
				/datum/sprite_accessory/hair/head/tomboy,
				/datum/sprite_accessory/hair/head/updo,
				/datum/sprite_accessory/hair/head/wisp,
				/datum/sprite_accessory/hair/head/willow,
				/datum/sprite_accessory/hair/head/baum,
				/datum/sprite_accessory/hair/head/birdnest,
				/datum/sprite_accessory/hair/head/chastity,
				/datum/sprite_accessory/hair/head/dawn,
				/datum/sprite_accessory/hair/head/fluffy,
				/datum/sprite_accessory/hair/head/helmet,
				/datum/sprite_accessory/hair/head/herder,
				/datum/sprite_accessory/hair/head/highlander,
				/datum/sprite_accessory/hair/head/jape,
				/datum/sprite_accessory/hair/head/majestic_elf,
				/datum/sprite_accessory/hair/head/martial,
				/datum/sprite_accessory/hair/head/miller,
				/datum/sprite_accessory/hair/head/runt,
				/datum/sprite_accessory/hair/head/royalcurls,
				/datum/sprite_accessory/hair/head/shaved,
				/datum/sprite_accessory/hair/head/towner,
				/datum/sprite_accessory/hair/head/trapper,
				/datum/sprite_accessory/hair/head/uncombed,
				/datum/sprite_accessory/hair/head/wastrel,
				/datum/sprite_accessory/hair/head/wilderness,
				/datum/sprite_accessory/hair/head/witcher,
				/datum/sprite_accessory/hair/head/helmet,
				)

*/

/datum/customizer/bodypart_feature/hair/head/humanoid/humen
	customizer_choices = list(/datum/customizer_choice/bodypart_feature/hair/head/humanoid/humen)

/datum/customizer_choice/bodypart_feature/hair/head/humanoid/humen
	sprite_accessories = list(
		/datum/sprite_accessory/hair/head/bald,
		/datum/sprite_accessory/hair/head/adventurer_human,
		/datum/sprite_accessory/hair/head/berserker,
		/datum/sprite_accessory/hair/head/bog,
		/datum/sprite_accessory/hair/head/bowlcut,
		/datum/sprite_accessory/hair/head/brother,
		/datum/sprite_accessory/hair/head/cavehead,
		/datum/sprite_accessory/hair/head/conscript,
		/datum/sprite_accessory/hair/head/courtier,
		/datum/sprite_accessory/hair/head/dome,
		/datum/sprite_accessory/hair/head/druid,
		/datum/sprite_accessory/hair/head/forester,
		/datum/sprite_accessory/hair/head/forged,
		/datum/sprite_accessory/hair/head/graceful,
		/datum/sprite_accessory/hair/head/heroic,
		/datum/sprite_accessory/hair/head/hunter,
		/datum/sprite_accessory/hair/head/landlord,
		/datum/sprite_accessory/hair/head/lion,
		/datum/sprite_accessory/hair/head/monk,
		/datum/sprite_accessory/hair/head/majestic_human,
		/datum/sprite_accessory/hair/head/merc,
		/datum/sprite_accessory/hair/head/miner_dwarf,
		/datum/sprite_accessory/hair/head/nobility_human,
		/datum/sprite_accessory/hair/head/nomadic_humtief,
		/datum/sprite_accessory/hair/head/pirate,
		/datum/sprite_accessory/hair/head/princely,
		/datum/sprite_accessory/hair/head/raider,
		/datum/sprite_accessory/hair/head/rogue,
		/datum/sprite_accessory/hair/head/romantic,
		/datum/sprite_accessory/hair/head/ronin,
		/datum/sprite_accessory/hair/head/scribe,
		/datum/sprite_accessory/hair/head/southern_human,
		/datum/sprite_accessory/hair/head/son,
		/datum/sprite_accessory/hair/head/squire_human,
		/datum/sprite_accessory/hair/head/steward,
		/datum/sprite_accessory/hair/head/swain,
		/datum/sprite_accessory/hair/head/top_aas,
		/datum/sprite_accessory/hair/head/troubadour,
		/datum/sprite_accessory/hair/head/tied,
		/datum/sprite_accessory/hair/head/tied_long,
		/datum/sprite_accessory/hair/head/trimmed,
		/datum/sprite_accessory/hair/head/warrior,
		/datum/sprite_accessory/hair/head/vagabond,
		/datum/sprite_accessory/hair/head/zybantu,
		/datum/sprite_accessory/hair/head/amazon,
		/datum/sprite_accessory/hair/head/archivist,
		/datum/sprite_accessory/hair/head/barbarian,
		/datum/sprite_accessory/hair/head/beartails,
		/datum/sprite_accessory/hair/head/bun,
		/datum/sprite_accessory/hair/head/bob,
		/datum/sprite_accessory/hair/head/conscriptf,
		/datum/sprite_accessory/hair/head/consort,
		/datum/sprite_accessory/hair/head/curlyshort,
		/datum/sprite_accessory/hair/head/damsel,
		/datum/sprite_accessory/hair/head/grumpy_f,
		/datum/sprite_accessory/hair/head/homely,
		/datum/sprite_accessory/hair/head/lady,
		/datum/sprite_accessory/hair/head/loosebraid,
		/datum/sprite_accessory/hair/head/maid,
		/datum/sprite_accessory/hair/head/majestic_f,
		/datum/sprite_accessory/hair/head/matron,
		/datum/sprite_accessory/hair/head/messy,
		/datum/sprite_accessory/hair/head/mystery,
		/datum/sprite_accessory/hair/head/noblesse,
		/datum/sprite_accessory/hair/head/nun,
		/datum/sprite_accessory/hair/head/pix,
		/datum/sprite_accessory/hair/head/plain,
		/datum/sprite_accessory/hair/head/princess,
		/datum/sprite_accessory/hair/head/queen,
		/datum/sprite_accessory/hair/head/rapunzel,
		/datum/sprite_accessory/hair/head/rose,
		/datum/sprite_accessory/hair/head/roughtails,
		/datum/sprite_accessory/hair/head/shrine,
		/datum/sprite_accessory/hair/head/soilbride,
		/datum/sprite_accessory/hair/head/spicy,
		/datum/sprite_accessory/hair/head/squire_f,
		/datum/sprite_accessory/hair/head/tails,
		/datum/sprite_accessory/hair/head/tied_pony,
		/datum/sprite_accessory/hair/head/tiedup,
		/datum/sprite_accessory/hair/head/tiedcutf,
		/datum/sprite_accessory/hair/head/tomboy,
		/datum/sprite_accessory/hair/head/updo,
		/datum/sprite_accessory/hair/head/wisp,
		/datum/sprite_accessory/hair/head/willow,
		/datum/sprite_accessory/hair/head/baum,
		/datum/sprite_accessory/hair/head/birdnest,
		/datum/sprite_accessory/hair/head/chastity,
		/datum/sprite_accessory/hair/head/dawn,
		/datum/sprite_accessory/hair/head/fluffy,
		/datum/sprite_accessory/hair/head/helmet,
		/datum/sprite_accessory/hair/head/herder,
		/datum/sprite_accessory/hair/head/highlander,
		/datum/sprite_accessory/hair/head/jape,
		/datum/sprite_accessory/hair/head/martial,
		/datum/sprite_accessory/hair/head/miller,
		/datum/sprite_accessory/hair/head/runt,
		/datum/sprite_accessory/hair/head/royalcurls,
		/datum/sprite_accessory/hair/head/shaved,
		/datum/sprite_accessory/hair/head/towner,
		/datum/sprite_accessory/hair/head/trapper,
		/datum/sprite_accessory/hair/head/uncombed,
		/datum/sprite_accessory/hair/head/wastrel,
		/datum/sprite_accessory/hair/head/wilderness,
		/datum/sprite_accessory/hair/head/witcher,
		/datum/sprite_accessory/hair/head/helmet,
	)

/datum/customizer/bodypart_feature/hair/head/humanoid/pointyear
	customizer_choices = list(/datum/customizer_choice/bodypart_feature/hair/head/humanoid/pointyear)

/datum/customizer_choice/bodypart_feature/hair/head/humanoid/pointyear
	sprite_accessories = list(
		/datum/sprite_accessory/hair/head/bald,
		/datum/sprite_accessory/hair/head/berserker,
		/datum/sprite_accessory/hair/head/bog,
		/datum/sprite_accessory/hair/head/bowlcut,
		/datum/sprite_accessory/hair/head/brother,
		/datum/sprite_accessory/hair/head/cavehead,
		/datum/sprite_accessory/hair/head/conscript,
		/datum/sprite_accessory/hair/head/courtier,
		/datum/sprite_accessory/hair/head/dome,
		/datum/sprite_accessory/hair/head/druid,
		/datum/sprite_accessory/hair/head/fancy_elf,
		/datum/sprite_accessory/hair/head/forester,
		/datum/sprite_accessory/hair/head/foreigner_tief,
		/datum/sprite_accessory/hair/head/forged,
		/datum/sprite_accessory/hair/head/heroic,
		/datum/sprite_accessory/hair/head/hunter,
		/datum/sprite_accessory/hair/head/landlord,
		/datum/sprite_accessory/hair/head/lover_tief,
		/datum/sprite_accessory/hair/head/monk,
		/datum/sprite_accessory/hair/head/merc,
		/datum/sprite_accessory/hair/head/pirate,
		/datum/sprite_accessory/hair/head/princely,
		/datum/sprite_accessory/hair/head/raider,
		/datum/sprite_accessory/hair/head/rogue,
		/datum/sprite_accessory/hair/head/romantic,
		/datum/sprite_accessory/hair/head/ronin,
		/datum/sprite_accessory/hair/head/scribe,
		/datum/sprite_accessory/hair/head/son_elf,
		/datum/sprite_accessory/hair/head/steward,
		/datum/sprite_accessory/hair/head/swain,
		/datum/sprite_accessory/hair/head/top_aas,
		/datum/sprite_accessory/hair/head/troubadour,
		/datum/sprite_accessory/hair/head/tied,
		/datum/sprite_accessory/hair/head/tied_long,
		/datum/sprite_accessory/hair/head/trimmed,
		/datum/sprite_accessory/hair/head/warrior,
		/datum/sprite_accessory/hair/head/woodsman_elf,
		/datum/sprite_accessory/hair/head/vagabond,
		/datum/sprite_accessory/hair/head/zybantu,
		/datum/sprite_accessory/hair/head/archivist,
		/datum/sprite_accessory/hair/head/barbarian,
		/datum/sprite_accessory/hair/head/beartails,
		/datum/sprite_accessory/hair/head/bun,
		/datum/sprite_accessory/hair/head/bob,
		/datum/sprite_accessory/hair/head/conscriptf,
		/datum/sprite_accessory/hair/head/consort,
		/datum/sprite_accessory/hair/head/cotton_elf,
		/datum/sprite_accessory/hair/head/curlyshort,
		/datum/sprite_accessory/hair/head/damsel,
		/datum/sprite_accessory/hair/head/fancy_femelf,
		/datum/sprite_accessory/hair/head/homely,
		/datum/sprite_accessory/hair/head/junia,
		/datum/sprite_accessory/hair/head/lady,
		/datum/sprite_accessory/hair/head/loosebraid,
		/datum/sprite_accessory/hair/head/maiden,
		/datum/sprite_accessory/hair/head/maid,
		/datum/sprite_accessory/hair/head/majestic_f,
		/datum/sprite_accessory/hair/head/matron,
		/datum/sprite_accessory/hair/head/messy,
		/datum/sprite_accessory/hair/head/mysterious_elf,
		/datum/sprite_accessory/hair/head/mystery,
		/datum/sprite_accessory/hair/head/nun,
		/datum/sprite_accessory/hair/head/performer,
		/datum/sprite_accessory/hair/head/pix,
		/datum/sprite_accessory/hair/head/plain,
		/datum/sprite_accessory/hair/head/princess,
		/datum/sprite_accessory/hair/head/queen,
		/datum/sprite_accessory/hair/head/rapunzel,
		/datum/sprite_accessory/hair/head/rose,
		/datum/sprite_accessory/hair/head/roughtails,
		/datum/sprite_accessory/hair/head/shrine,
		/datum/sprite_accessory/hair/head/soilbride,
		/datum/sprite_accessory/hair/head/spicy,
		/datum/sprite_accessory/hair/head/tails,
		/datum/sprite_accessory/hair/head/tied_pony,
		/datum/sprite_accessory/hair/head/tiedup,
		/datum/sprite_accessory/hair/head/tiedcutf,
		/datum/sprite_accessory/hair/head/tomboy,
		/datum/sprite_accessory/hair/head/updo,
		/datum/sprite_accessory/hair/head/wisp,
		/datum/sprite_accessory/hair/head/willow,
		/datum/sprite_accessory/hair/head/baum,
		/datum/sprite_accessory/hair/head/birdnest,
		/datum/sprite_accessory/hair/head/chastity,
		/datum/sprite_accessory/hair/head/dawn,
		/datum/sprite_accessory/hair/head/fluffy,
		/datum/sprite_accessory/hair/head/helmet,
		/datum/sprite_accessory/hair/head/herder,
		/datum/sprite_accessory/hair/head/highlander,
		/datum/sprite_accessory/hair/head/jape,
		/datum/sprite_accessory/hair/head/majestic_elf,
		/datum/sprite_accessory/hair/head/martial,
		/datum/sprite_accessory/hair/head/miller,
		/datum/sprite_accessory/hair/head/runt,
		/datum/sprite_accessory/hair/head/royalcurls,
		/datum/sprite_accessory/hair/head/shaved,
		/datum/sprite_accessory/hair/head/towner,
		/datum/sprite_accessory/hair/head/trapper,
		/datum/sprite_accessory/hair/head/uncombed,
		/datum/sprite_accessory/hair/head/wastrel,
		/datum/sprite_accessory/hair/head/wilderness,
		/datum/sprite_accessory/hair/head/witcher,
		/datum/sprite_accessory/hair/head/helmet,
	)

//////////////////////
// Hair Definitions //
//////////////////////

	// please make sure they're sorted alphabetically and, where needed, categorized
	// try to capitalize the names please~
	// try to spell
	// you do not need to define _s or _l sub-states, game automatically does this for you

	// each race gets four unique haircuts
	// dwarf - miner, gnomish, boss, hearth
	// elf - son, fancy, mysterious, long
	// human - adventurer, graceful, squire, pigtails, noblesse
	// dual - nomadic, shrine
	// aasimar - amazon, topknot, martial, forsaken
	// tiefling - junia, performer, tribal, lover


/datum/sprite_accessory/hair/head/bald
	name = "Bald"
	icon_state = ""
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)
	gender = MALE

/datum/sprite_accessory/hair/head/adventurer_human
	name = "Adventurer"
	icon_state = "adventurer"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN)

/datum/sprite_accessory/hair/head/berserker
	name = "Berserker"
	icon_state = "berserker"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)
	under_layer = TRUE

/datum/sprite_accessory/hair/head/bog
	name = "Bog"
	icon_state = "bog"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/boss_dwarf
	name = "Boss"
	icon_state = "boss" // original name bodicker
	gender = MALE
	specuse = list(SPEC_ID_DWARF)
	under_layer = TRUE

/datum/sprite_accessory/hair/head/bowlcut
	name = "Bowlcut"
	icon_state = "bowlcut"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/brother
	name = "Brother"
	icon_state = "brother"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/cavehead
	name = "Cavehead"
	icon_state = "cavehead" // original name thinning?
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)
	under_layer = TRUE

/datum/sprite_accessory/hair/head/conscript
	name = "Conscript"
	icon_state = "conscript"
	gender = MALE
	under_layer = TRUE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/courtier
	name = "Courtier"
	icon_state = "courtier"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/dome
	name = "Dome"
	icon_state = "dome"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)
	under_layer = TRUE

/datum/sprite_accessory/hair/head/druid
	name = "Druid"
	icon_state = "druid"  // original name elf_scout?
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/fancy_elf
	name = "Fancy"
	icon_state = "fancy_elf"
	gender = MALE
	specuse = list(SPEC_ID_ELF)

/datum/sprite_accessory/hair/head/forester
	name = "Forester"
	icon_state = "forester"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/foreigner_tief
	name = "Foreigner"
	icon_state = "foreigner"
	gender = MALE
	specuse = list(SPEC_ID_TIEFLING)

/datum/sprite_accessory/hair/head/forsaken_aas
	name = "Forsaken"
	icon_state = "forsaken"
	gender = MALE
	specuse = list(SPEC_ID_AASIMAR)
	under_layer = TRUE

/datum/sprite_accessory/hair/head/forged
	name = "Forged"
	icon_state = "forged"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)
	under_layer = TRUE

/datum/sprite_accessory/hair/head/graceful
	name = "Graceful"
	icon_state = "graceful"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN)

/datum/sprite_accessory/hair/head/heroic
	name = "Heroic"
	icon_state = "heroic"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/hunter
	name = "Hunter"
	icon_state = "hunter"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/landlord
	name = "Landlord"
	icon_state = "landlord"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/lover_tief
	name = "Lover"
	icon_state = "lover_tief_m"
	gender = MALE
	specuse = list(SPEC_ID_TIEFLING)

/datum/sprite_accessory/hair/head/lion
	name = "Lions mane"
	icon_state = "lion"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/monk
	name = "Monk"
	icon_state = "monk"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/majestic_human
	name = "Majesty"
	icon_state = "majestic"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN)

/datum/sprite_accessory/hair/head/merc
	name = "Mercenary"
	icon_state = "mercenary"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/miner_dwarf
	name = "Miner"
	icon_state = "miner"
	gender = MALE
	specuse = list(SPEC_ID_DWARF)

/datum/sprite_accessory/hair/head/nobility_human
	name = "Nobility"
	icon_state = "nobility"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN)

/datum/sprite_accessory/hair/head/nomadic_humtief
	name = "Nomadic"
	icon_state = "nomadic"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_TIEFLING)

/datum/sprite_accessory/hair/head/pirate
	name = "Pirate"
	icon_state = "pirate_e"
	gender = MALE
	under_layer = TRUE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/princely
	name = "Princely"
	icon_state = "princely"
	gender = MALE
	specuse = list(SPEC_ID_ELF)

/datum/sprite_accessory/hair/head/raider
	name = "Raider"
	icon_state = "raider"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/rogue
	name = "Rogue"
	icon_state = "rogue"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/romantic
	name = "Romantic"
	icon_state = "romantic"
	gender = MALE
	specuse = list("elf")

/datum/sprite_accessory/hair/head/ronin
	name = "Ronin"
	icon_state = "ronin"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/scribe
	name = "Scribe"
	icon_state = "scribe"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)
	under_layer = TRUE

/datum/sprite_accessory/hair/head/southern_human
	name = "Southern"
	icon_state = "southern"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN)

/datum/sprite_accessory/hair/head/son
	name = "Son"
	icon_state = "son"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/son_elf
	name = "Sonne"
	icon_state = "son_elf"
	gender = MALE
	specuse = list(SPEC_ID_ELF)

/datum/sprite_accessory/hair/head/squire_human
	name = "Squired"
	icon_state = "squire" // original name shaved_european
	gender = MALE
	specuse = list(SPEC_ID_HUMEN)

/datum/sprite_accessory/hair/head/steward
	name = "Steward"
	icon_state = "steward"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/head/swain
	name = "Swain"
	icon_state = "swain"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/top_aas
	name = "Topknot"
	icon_state = "topknot"
	gender = MALE
	specuse = list(SPEC_ID_AASIMAR)

/datum/sprite_accessory/hair/head/troubadour
	name = "Troubadour"
	icon_state = "troubadour"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/tied
	name = "Tied"
	icon_state = "tied"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/tied_long
	name = "Tied long"
	icon_state = "tiedlong"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/trimmed
	name = "Trimmed"
	icon_state = "trimmed"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/warrior
	name = "Warrior"
	icon_state = "warrior"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/woodsman_elf
	name = "Woodsman"
	icon_state = "woodsman_e"
	gender = MALE
	specuse = list(SPEC_ID_ELF)

/datum/sprite_accessory/hair/head/vagabond
	name = "Vagabond"
	icon_state = "vagabond"
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/zybantu
	name = "Zybantu"
	icon_state = "zybantu" // orginal name gelled
	gender = MALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)






/////////////////////////////
// GIRLY Hair Definitions  //
/////////////////////////////

/datum/sprite_accessory/hair/head/amazon
	name = "Amazon"
	icon_state = "amazon_f"
	gender = FEMALE
	specuse = list(SPEC_ID_AASIMAR)

/datum/sprite_accessory/hair/head/archivist
	name = "Archivist"
	icon_state = "archivist_f" // original name bob_scully
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/barbarian
	name = "Barbarian"
	icon_state = "barbarian_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/beartails
	name = "Beartails"
	icon_state = "beartails_f" // modified cotton
	gender = FEMALE
	under_layer = TRUE
	specuse = list(SPEC_ID_HUMEN)

/datum/sprite_accessory/hair/head/bun
	name = "Bun"
	icon_state = "bun-low"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/bob
	name = "Bob"
	icon_state = "bob_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/conscriptf
	name = "Conscripte"
	icon_state = "conscript_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/head/consort
	name = "Consort"
	icon_state = "consort"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/head/cotton_elf
	name = "Cotton"
	icon_state = "cotton_e"
	gender = FEMALE
	specuse = list("elf")

/datum/sprite_accessory/hair/head/curlyshort
	name = "Curly Short"
	icon_state = "curly_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/damsel
	name = "Damsel"
	icon_state = "damsel"
	gender = FEMALE
	specuse = list("human", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/head/fancy_femelf
	name = "Fancy"
	icon_state = "fancy_elf_f"
	gender = FEMALE
	specuse = list(SPEC_ID_ELF)

/datum/sprite_accessory/hair/head/grumpy_f
	name = "Grumpy"
	icon_state = "grumpy_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/gnomish_f
	name = "Gnomish"
	icon_state = "gnomish_f" // original name bun_grandma
	gender = FEMALE
	specuse = list(SPEC_ID_DWARF)

/datum/sprite_accessory/hair/head/hearth_f
	name = "Hearth"
	icon_state = "hearth_f" // original name ponytail_fox
	gender = FEMALE
	specuse = list(SPEC_ID_DWARF)

/datum/sprite_accessory/hair/head/homely
	name = "Homely"
	icon_state = "homely_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/junia
	name = "Junia"
	icon_state = "junia_tief_f" // modified hime_updo
	gender = FEMALE
	specuse = list(SPEC_ID_TIEFLING)

/datum/sprite_accessory/hair/head/lady
	name = "Lady"
	icon_state = "lady_f" // original name newyou
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_ELF, SPEC_ID_TIEFLING)

/datum/sprite_accessory/hair/head/loosebraid
	name = "Loose Braid"
	icon_state = "loosebraid_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/maiden
	name = "Maiden"
	icon_state = "maiden_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/maid
	name = "Maid"
	icon_state = "maid_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/head/majestic_dwarf_F
	name = "Majestiq"
	icon_state = "majestic_dwarf"
	gender = FEMALE
	specuse = list(SPEC_ID_DWARF)

/datum/sprite_accessory/hair/head/majestic_f
	name = "Majestic"
	icon_state = "majestic_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN)

/datum/sprite_accessory/hair/head/matron
	name = "Matron"
	icon_state = "matron"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/head/messy
	name = "Messy"
	icon_state = "messy_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/mysterious_elf
	name = "Mysterious"
	icon_state = "mysterious_elf" // modified hime_long
	gender = FEMALE
	specuse = list(SPEC_ID_ELF)

/datum/sprite_accessory/hair/head/mystery
	name = "Mystery"
	icon_state = "mystery_f" // modified hime_long
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/noblesse
	name = "Noblesse"
	icon_state = "noblesse_f" // modified sidetail
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN)

/datum/sprite_accessory/hair/head/nun
	name = "Nun"
	icon_state = "nun"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/performer
	name = "Performer"
	icon_state = "performer_tief_f" // modified drillruru_long
	gender = FEMALE
	specuse = list(SPEC_ID_TIEFLING)

/datum/sprite_accessory/hair/head/pix
	name = "Pixie"
	icon_state = "pixie_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/plain
	name = "Plain"
	icon_state = "plain_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/princess
	name = "Princess"
	icon_state = "princess"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/queen
	name = "Queenly"
	icon_state = "queenly_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/rapunzel
	name = "Rapunzel"
	icon_state = "rapunzel"
	gender = FEMALE
	specuse = list("human", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/head/rose
	name = "Rose"
	icon_state = "rose"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/roughtails
	name = "Roughtails"
	icon_state = "roughtails" // modified african_pigtails
	gender = FEMALE
	specuse = list("aasimar", "abyssariad")

/datum/sprite_accessory/hair/head/shrine
	name = "Shrinekeeper"
	icon_state = "shrine_f"
	gender = FEMALE
	specuse = list(SPEC_ID_ELF, SPEC_ID_TIEFLING, SPEC_ID_HUMEN)

/datum/sprite_accessory/hair/head/soilbride
	name = "Soilbride"
	icon_state = "soilbride_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/spicy
	name = "Spicy"
	icon_state = "spicy"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/head/squire_f
	name = "Squire"
	icon_state = "squire_f" // original name ponytail_rynn
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN)

/datum/sprite_accessory/hair/head/tails
	name = "Tails"
	icon_state = "tails_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/tied_pony
	name = "Tied Ponytail"
	icon_state = "tied_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/tiedup
	name = "Tied Up"
	icon_state = "tiedup_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/tiedcutf
	name = "Tied Sidecut"
	icon_state = "tsidecut"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/tomboy
	name = "Tomboy"
	icon_state = "tomboy"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/updo
	name = "Updo"
	icon_state = "updo_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/wisp
	name = "Wisp"
	icon_state = "wisp_f"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/willow
	name = "Willow"
	icon_state = "willow"
	gender = FEMALE
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)


//////////////////////////////
// UNISEX Hair Definitions  //
//////////////////////////////

/datum/sprite_accessory/hair/head/baum
	name = "Baum"
	icon_state = "baum"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/birdnest
	name = "Birdnest"
	icon_state = "birdnest"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/chastity
	name = "Chastity"
	icon_state = "chastity"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/dawn
	name = "Dawn"
	icon_state = "dawn"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/fluffy
	name = "Fluffy"
	icon_state = "fluffy"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/helmet
	name = "Helmet Hair"
	icon_state = "helmet"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/herder
	name = "Herder"
	icon_state = "herder"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/highlander
	name = "Highlander"
	icon_state = "highlander"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/jape
	name = "Jape"
	icon_state = "jape"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/majestic_elf
	name = "Majestie"
	icon_state = "majestic_elf"
	gender = NEUTER
	specuse = list("elf")

/datum/sprite_accessory/hair/head/martial
	name = "Martial"
	icon_state = "martial"
	gender = NEUTER
	specuse = list("aasimar")

/datum/sprite_accessory/hair/head/miller
	name = "Miller"
	icon_state = "miller"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/head/runt
	name = "Runt"
	icon_state = "runt"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/head/royalcurls
	name = "Royal Curls"
	icon_state = "royalcurls"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/shaved
	name = "Shaved"
	icon_state = "shaved"
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")
	gender = NEUTER
	under_layer = TRUE

/datum/sprite_accessory/hair/head/towner
	name = "Towner"
	icon_state = "towner"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/trapper
	name = "Trapper"
	icon_state = "trapper"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/uncombed
	name = "Uncombed"
	icon_state = "uncombed"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/wastrel
	name = "Wastrel"
	icon_state = "wastrel"
	gender = NEUTER
	specuse = list("human", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/head/wilderness
	name = "Wilderness"
	icon_state = "wilderness"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/witcher
	name = "Witcher"
	icon_state = "witcher"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

/datum/sprite_accessory/hair/head/shorthair6
	name = "Short Hair (Alt)"
	icon_state = "shorthair_alt"
	gender = NEUTER
	specuse = list(SPEC_ID_HUMEN, SPEC_ID_DWARF, SPEC_ID_ELF, SPEC_ID_AASIMAR, SPEC_ID_TIEFLING, SPEC_ID_HALF_ORC)

// KAIZOKU SPRITE ACCESSORIES HERE TEMP? ROGTODO
//Female Kaizoku hair below.

/datum/sprite_accessory/hair/head/empress
	name = "Abyssal Empress"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "empress"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/onnamusha
	name = "Onnamusha"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "warlady"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/waterfield
	name = "Waterbearer"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "waterfield"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/homewaifu
	name = "Homewife"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "homewaifu"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/casual
	name = "Natural River"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "casual"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/martyr
	name = "Inhonor of the Fallen"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "martyr"
	gender = FEMALE
	specuse = list("abyssariad")

//Male Kaizoku hair below.

/datum/sprite_accessory/hair/head/zamurai
	name = "Zamurai Manbun"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "samurai"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/ronin
	name = "Vagabond"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "ronin"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/freespirit
	name = "Free Spirit"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "freespirit"
	gender = NEUTER
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/novice
	name = "New Rice"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "novice"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/yakuza
	name = "Irezumi Gangster"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "yakuza"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/steppeman
	name = "Aridlands raider"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "steppeman"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/bishonen
	name = "Husband"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "bishonen"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/emperor
	name = "Imperial Court"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "emperor"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/protagonist
	name = "Historical Protagonist"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "hprotagonist"
	gender = NEUTER
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/protagonistalt
	name = "Longer Protagonist"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "alsoprotagonist"
	gender = NEUTER
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/head/triton
	name = "Base Triton"
	abstract_type = /datum/sprite_accessory/hair/head/triton
	icon = 'icons/mob/sprite_accessory/hair/triton.dmi'
	specuse = list(SPEC_ID_TRITON)

/datum/sprite_accessory/hair/head/triton/fin
	name = "Fin"
	icon_state = "fin"

/datum/sprite_accessory/hair/head/triton/seaking
	name = "Seaking"
	icon_state = "seaking"

/datum/sprite_accessory/hair/head/triton/siren
	name = "Siren"
	icon_state = "siren"

/datum/sprite_accessory/hair/head/triton/jellyfish
	name = "Jellyfish"
	icon_state = "jellyfish"

/datum/sprite_accessory/hair/head/triton/anemonger
	name = "Anemonger"
	icon_state = "anemonger"

/datum/sprite_accessory/hair/head/triton/punkfish
	name = "Punkfish"
	icon_state = "punkfish"

/datum/sprite_accessory/hair/head/triton/weed
	name = "Weeds"
	icon_state = "weed"

/datum/sprite_accessory/hair/head/triton/gorgon
	name = "Gorgon"
	icon_state = "gorgon"

/datum/sprite_accessory/hair/head/triton/lion
	name = "Lion"
	icon_state = "lion"

/datum/sprite_accessory/hair/head/triton/betta
	name = "Betta"
	icon_state = "betta"

/datum/sprite_accessory/hair/head/medicator
	name = "Base Medicator"
	abstract_type = /datum/sprite_accessory/hair/head/medicator
	icon = 'icons/mob/sprite_accessory/hair/medicator.dmi'
	specuse = list(SPEC_ID_MEDICATOR)

/datum/sprite_accessory/hair/head/medicator/windswept
	name = "Windswept"
	icon_state = "windswept"

/datum/sprite_accessory/hair/head/medicator/curl
	name = "Curl"
	icon_state = "curl"

/datum/sprite_accessory/hair/head/medicator/spencer
	name = "Spencer"
	icon_state = "spencer"

/datum/sprite_accessory/hair/head/medicator/dynamic
	name = "Dynamic"
	icon_state = "dynamic"

/datum/sprite_accessory/hair/head/medicator/jockey
	name = "Jockey"
	icon_state = "jockey"

/datum/sprite_accessory/hair/head/medicator/hook
	name = "Hook"
	icon_state = "hook"

/datum/sprite_accessory/hair/head/medicator/crown
	name = "Crown"
	icon_state = "crown"
