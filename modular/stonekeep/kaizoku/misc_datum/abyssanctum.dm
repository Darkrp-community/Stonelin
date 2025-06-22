/datum/faith/abyssanctum
	name = "\improper Abyssanctum"
	desc = "The religion of Fog Islanders and Heartfelteans, devoted to seek sanctity through purification \
	as the supreme tide against demonic taint, the world's filter, said that the soul can reach \
	sanctity and be stripped away from the cycle of death as thalassic angels, or be reincarnated on holy tides, \
	The abyssanctum have three expressions of faith as icon of spiritual resonance with the deep."
	godhead = /datum/patron/abyssanctum/purifier //All the doctrines are equals.

/datum/patron/abyssanctum
	name = null
	associated_faith = /datum/faith/abyssanctum
	t0 = /obj/effect/proc_holder/spell/invoked/abyssal_heal

	profane_words = list()
	confess_lines = list(
		"ONLY ABYSSOR STAYS ON THE THRONE OF WORLD ORDER!",
		"THE WEEPER TEARS DEFINED THE TRUE FAITH BEFORE THE PANTHEON'S CREATION!",
		"PRAISE ABYSSOR AND THE TIDES OF FATE!"
	)

/datum/patron/abyssanctum/can_pray(mob/living/follower)
	var/turf/T = get_turf(follower)

	if(istype(T, /turf/open/water/sewer) || istype(T, /turf/open/water/bath))
		to_chat(follower, span_danger("Rites of reverence are not for places of decay."))
		return FALSE
	if(istype(T, /turf/open/water))
		return TRUE

	to_chat(follower, span_danger("My voice can only reach The Great Whale and THEIR angels on watery tides."))
	return FALSE

/datum/patron/abyssanctum/purifier
	name = "Purifier Doctrine"
	domain = "Abyssor, with faith empowered by natural disasters, the tornadoes"
	desc = "Purifiers of the spirit and flesh by rites against the burden unseen. Their dreams are warning splinter of the Tide of Fate, \
	believing it must be changed just much it should be protected."
	flaws= "Reckless, Stubborn, Destructive - Intolerant"
	worshippers = "Exorcists, talisman makers, survivors of demonic incursions. The Shrinekeepers."
	sins = "Fear, Hubris, Forgetfulness - Hesitation"
	boons = "Weeper's hymn. You can detect unclean spirits and directly resist demonic influence. You may control the two edges of the land" //Wind-based holy spells.
	added_traits = list(TRAIT_LEECHIMMUNE, TRAIT_KAIZOKU) //Leech Immune will change later.
	t0 = /obj/effect/proc_holder/spell/invoked/abyssal_heal //remember to make a different one for this.
	t1 = /obj/effect/proc_holder/spell/invoked/gale_palm
	t2 = /obj/effect/proc_holder/spell/invoked/heavens_pillar
	t3 = /obj/effect/proc_holder/spell/invoked/maelstrom
	confess_lines = list(
		"ABYSSOR COMMANDS THE WAVES!",
		"THE OCEAN'S FURY IS ABYSSOR'S WILL!",
		"I AM DRAWN BY THE PULL OF THE TIDE!",

		"I CLEANSE THIS LAND BY BLADE AND SALT! YOU'RE TORTURING THE WRONG WARRIOR!",
		"THE CORRUPTION HIDES FROM ME, SO SHOULD YOU!",
		"IN ABYSSOR'S NAME, YOU SHALL BE UNDONE FOR YOUR AUDACITY!",
	)
	storyteller = /datum/storyteller/abyssor //perhaps make a edit in which demons are weaker as they spawn.

/datum/patron/abyssanctum/curator
	name = "Curator Doctrine"
	domain = "Abyssor, with faith empowered by natural disasters, the thunderstorms"
	desc = "The protectors of knowledge, binding wounds and lore to guide the lost across the dying world as the bridge for \
	salvation and beyond. Believers that no knowledge must ever be censored."
	flaws = "Reckless, Stubborn, Destructive - Overtrusting"
	worshippers = "The common folk, storytellers, ship doctors and educators. The Yamabushi."
	sins = "Fear, Hubris, Forgetfulness - Intellectual arrogance"
	boons = "Knowledge of the Drowned. You can recharge your mana on healing waters and commune with sea relics. You may control the spears of the storm" //Lightening-based holy spells.
	added_traits = list(TRAIT_LEECHIMMUNE, TRAIT_KAIZOKU) //Leech Immune will change later.
	t0 = /obj/effect/proc_holder/spell/invoked/abyssal_heal
	t1 = /obj/effect/proc_holder/spell/invoked/surging_bolt
	t2 = /obj/effect/proc_holder/spell/invoked/warkraft
	t3 = /obj/effect/proc_holder/spell/invoked/revival_spark
	confess_lines = list(
		"ABYSSOR COMMANDS THE WAVES!",
		"THE OCEAN'S FURY IS ABYSSOR'S WILL!",
		"I AM DRAWN BY THE PULL OF THE TIDE!",

		"WISDOM WILL NEVER DIE! NOT EVEN DEMONS CAN STEALS MY MIND, NOT EVEN YOU!",
		"MY DUTY IS TO GATHER THE LORE AND HEAL THE BROKEN! CEASE YOUR DEBAUCHERY!",
		"I AM THE STORM THAT IS APPROACHING!",  //I'm keeping this. It fits. Go away.
	)
	storyteller = /datum/storyteller/abyssor


/datum/patron/abyssanctum/tideweaver
	name = "Tideweaver Doctrine"
	domain = "Abyssor, with faith empowered by natural disasters, the blizzards"
	desc = "Guardians of the sacred weaving, who believes that purification must be brought by the ways of the blade and reconstruction, \
	the filter as aggressive as natural disasters."
	flaws = "Reckless, Stubborn, Destructive - Unyielding"
	worshippers = "Abyssal Warriors, Sea raiders, Generals. The Soheis."
	sins = "Fear, Hubris, Forgetfulness - Disobedience"
	boons = "Soulside Connection. You always see your fellow faithful at its core. You may control the blades of the tides." //Ice-based holy spells.
	added_traits = list(TRAIT_LEECHIMMUNE, TRAIT_KAIZOKU) //Leech Immune will change later.
	t0 = /obj/effect/proc_holder/spell/invoked/abyssal_heal
	t1 = /obj/effect/proc_holder/spell/invoked/projectile/purify
	t2 = /obj/effect/proc_holder/spell/invoked/rake
	t3 = /obj/effect/proc_holder/spell/invoked/icebind
	confess_lines = list(
		"ABYSSOR COMMANDS THE WAVES!",
		"THE OCEAN'S FURY IS ABYSSOR'S WILL!",
		"I AM DRAWN BY THE PULL OF THE TIDE!",

		"SNATCH THE PEBBLE FROM MY HAND, GRASSHOPPER!", //I'm keeping this. It fits. Go away.
		"I OBEY ONLY THE MANIFESTATIONS OF THE DEEP, NOT YOU!",
		"DISCIPLINE IS THE TRUE GREAT HARBOR! YOU'RE JUST A FLUKE FOR TRYING THIS!",
	)
	storyteller = /datum/storyteller/abyssor

#define ALL_ABYSSANCTUM_DOCTRINE list(/datum/patron/abyssanctum/purifier, /datum/patron/abyssanctum/curator, /datum/patron/abyssanctum/tideweaver)

/*
GLOBAL_LIST_INIT(abyssanctum_speak, world.file2list('strings/rt/abyssanctum_speak.txt'))

/datum/emote/living/pray/run_emote(mob/user, params, type_override, intentional)
	. = ..()

	if(istype(patron, /datum/patron/abyssanctum))
		if(GLOB.abyssanctum_speak && length(GLOB.abyssanctum_speak))
			var/abyssangel = pick(GLOB.abyssanctum_speak)
			to_chat(follower, span_notice("<i>[abyssangel]</i>"))
*/
