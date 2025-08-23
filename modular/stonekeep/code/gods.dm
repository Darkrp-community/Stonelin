// ===========================	PANTHEON	=======================================

/datum/patron/divine/astrata
	name = "<font color='#908d59'>Astrata</font>"
	domain = "<font color='#908d59'>Order and Light</font>"
	desc = "<font color='#908d59'>The Sun-Queen is firstborn of the Forgotten God, twin of Noc, and rides her blazing disk across the sky.</font>"
	flaws = ""
	worshippers = "Nobles, Zealots, Commoners"
	sins = "Oath-breaking, Disobeying hierarchies"
	boons = ""
	confess_lines = list(
		"ASTRATA IS MY LIGHT!",
		"ASTRATA BRINGS LAW!",
		"I SERVE THE GLORY OF THE SUN!",
	)

/datum/patron/divine/noc
	name = "<font color='#70637d'>Noc</font>"
	domain = "<font color='#70637d'>Knowledge, Secrets, Meditation</font>"
	desc = "<font color='#70637d'>The Moon Prince, twin of Astrata, gifted mankind the written language. Man must look to the sky and not dwell on brutish animal behaviour.</font>"
	flaws = null
	worshippers = "Magic Practitioners, Scholars, Scribes"
	sins = "Damaging books, Indulging Lust"
	boons = ""

	confess_lines = list(
		"NOC IS NIGHT!",
		"NOC SEES THE TRUTH!",
		"I SEEK THE MYSTERIES OF THE MOON!",
	)

/datum/patron/divine/dendor
	name = "<font color='#4f745b'>Dendor</font>"
	domain = "<font color='#4f745b'>Forests and Beasts</font>"
	desc = "<font color='#4f745b'>A madness lies upon Dendor, wild and untamed, both predator and prey.</font>"
	flaws = ""
	worshippers = "Druids, Beasts, Madmen"
	sins = "Deforestation, Killing beasts wastefully"
	boons = ""
	confess_lines = list(
		"DENDOR PROVIDES!",
		"THE TREEFATHER BRINGS BOUNTY!",
		"I ANSWER THE CALL OF THE WILD!",
	)

/datum/patron/divine/abyssor
	name = "<font color='#63677d'>Abyssor</font>"
	domain = "<font color='#63677d'>Seas and Storms</font>"
	desc = "<font color='#63677d'>The World-Whale, immovable, unstoppable, bringer of bounties and ruin alike.</font>"
	flaws= ""
	worshippers = "Sailors of the Sea and Sky, Horrid Sea-Creachers, Fog Islanders"
	sins = "Hubris, Forgetfulness"
	boons = ""
/* NEEDS KAIZOKU TO WORK ROGTODO
	t0 = /datum/action/cooldown/spell/healing/abyssal
	t1 = /obj/effect/proc_holder/spell/invoked/projectile/purify
	t2 = /obj/effect/proc_holder/spell/invoked/icebind
	t3 = /obj/effect/proc_holder/spell/invoked/ocean_embrace
*/
	confess_lines = list(
		"ABYSSOR COMMANDS THE WAVES!",
		"THE OCEAN'S FURY IS ABYSSOR'S WILL!",
		"I AM DRAWN BY THE PULL OF THE TIDE!",
	)

/datum/patron/divine/necra
	name = "<font color='#78797e'>Necra</font>"
	domain = "<font color='#78797e'>Death and the Afterlife</font>"
	desc = "<font color='#78797e'>The Undermaiden keeps the dead in eternal rest.</font>"
	flaws = ""
	worshippers = "Dark Elves, Gravekeepers, Mourners"
	sins = "Undeath"
	boons = ""
	confess_lines = list(
		"ALL SOULS FIND THEIR WAY TO NECRA!",
		"THE UNDERMAIDEN IS OUR FINAL REPOSE!",
		"I FEAR NOT DEATH, MY LADY AWAITS ME!",
	)

/datum/patron/divine/ravox
	name = "<font color='#9e6363'>Ravox</font>"
	domain = "<font color='#9e6363'>Warfare, Struggle, and Chivalry</font>"
	desc = "<font color='#9e6363'>The blade of the Pantheon, a patron of all who have to face their fears in the maelstrom of battle.</font>"
	flaws = ""
	worshippers = "Warriors, Knights"
	sins = "Cowardice, Hesitation"
	boons = ""
	confess_lines = list(
		"RAVOX IS JUSTICE!",
		"THROUGH STRIFE, GRACE!",
		"THE DRUMS OF WAR BEAT IN MY CHEST!",
	)

/datum/patron/divine/xylix
	name = "<font color='#63797d'>Xylix</font>"
	domain = "<font color='#63797d'>Saint of Trickery, Freedom, and Inspiration</font>"
	desc = "<font color='#63797d'>Some say the greatest trick he ever pulled was making the world believe he never existed.</font>"
	flaws = ""
	worshippers = "Cheats, Performers, The Hopeless"
	sins = "Boredom, Predictability"
	boons = ""
	confess_lines = list(
		"ASTRATA IS MY LIGHT!",
		"NOC IS NIGHT!",
		"DENDOR PROVIDES!",
		"ABYSSOR COMMANDS THE WAVES!",
		"RAVOX IS JUSTICE!",
		"ALL SOULS FIND THEIR WAY TO NECRA!",
		"HAHAHAHA! AHAHAHA! HAHAHAHA!", //the only xylix-related confession
		"PESTRA SOOTHES ALL ILLS!",
		"MALUM IS MY FORGE!",
		"EORA BRINGS US TOGETHER!",
	)

/datum/patron/divine/pestra
	name = "<font color='#778465'>Pestra</font>"
	domain = "<font color='#778465'>Medicine, Alchemy, and Prophecy</font>"
	desc = "<font color='#778465'>Depicted as a hunchbacked old witch, only granting favor if well disposed.</font>"
	flaws = ""
	worshippers = "The Ill and Infirm, Alchemists, Physicians"
	sins = "Failing to show respect to healers, Allowing disease to spread"
	boons = ""
	confess_lines = list(
		"PESTRA SOOTHES ALL ILLS!",
		"THE SECRETS OF ALCHEMY WILL BE MINE!",
		"NO SICKNESS WILL OVERTAKE ME!",
	)

/datum/patron/divine/malum
	name = "<font color='#827059'>Malum</font>"
	domain = "<font color='#827059'>Toil and Craftsmanship</font>"
	desc = "<font color='#827059'>To strive for perfection, to always aspire to greatness in your field, and to love the embers of the red-hot metal as it is struck is to be attuned to Malum.</font>"
	flaws = ""
	worshippers = "Smiths, Miners, Sculptors"
	sins = "Breaking contracts, Shoddy work"
	boons = ""
	confess_lines = list(
		"MALUM BREAK MY BONDS!",
		"TRUE VALUE IS IN THE TOIL!",
		"I AM AN INSTRUMENT OF CREATION!",
	)

/datum/patron/divine/eora
	name = "<font color='#825974'>Eora</font>"
	domain = "<font color='#825974'>Love, Family, Beauty</font>"
	desc = "<font color='#825974'>The Mother, bonding people together in appreciation of the beauty of the world.</font>"
	flaws= ""
	worshippers = "Mothers, Artists, Married Couples"
	sins = "Abandonment, Defiling beauty"
	boons = ""
	confess_lines = list(
		"EORA BRINGS US TOGETHER!",
		"HER BEAUTY IS EVEN IN THIS TORMENT!",
		"I LOVE YOU, EVEN AS YOU TRESPASS AGAINST ME!",
	)


/datum/patron/psydon
	name = "Psydon"
	domain = "God of Humenity, Dreams and Creation"
	desc = "Forgotten but not gone, the Great Hero has left his realm to battle the Forbidden in Hell."
	flaws = "Secretive, Judgemental, Self-Sacrificing"
	worshippers = "Grenzelhofters, Inquisitors, Heroes"
	sins = "Apostasy, Demon Worship, Betraying thy Father"
	boons = "None. True strength comes from within."
	associated_faith = /datum/faith/psydon
	confess_lines = list(
		"THERE IS ONLY ONE GOD!",
		"THE FALSE GODS WILL FADE WHEN HE RETURNS!",
		"PSYDON LIVES!",
	)
	storyteller = /datum/storyteller/psydon

/datum/faith/divine_pantheon
	name = "Divine Pantheon"
	desc = "The common religion of Enigma. The Ten aids us and protects us from the evil of Zizo and the Inhumen!"
	godhead = /datum/patron/divine/astrata

/datum/faith/psydon
	name = "Old God"
	desc = "Worship of the Forgottten God as the primary diety. Popular among the Grenzelhofters, but can be found in all Humen Kingdoms."
	godhead = /datum/patron/psydon
	preference_accessible = TRUE


/datum/faith/inhumen_pantheon
	name = "Inhumen Gods"
	desc = "The Pantheon are for weak fools!.\n\
		You follow one of the Inhumen Gods, basking in selfish fulfilment at the expense of others. \
		These Gods have no care for each other, and may be rivals just as well as allies, depending on their whims.\n\
		In silent mastery Zizo sits on the top, watching, weaving dark strands of doom for those too weak or stupid to reach for power absolute."
	godhead = /datum/patron/inhumen/zizo

/datum/faith/godless
	name = "Apostasy"
	desc = "Although gods obviously exist in this world, you refuse to bow down to them! Due to spite, ignorance, or your own ego; you are completely godless."
	godhead = /datum/patron/godless
	preference_accessible = FALSE

/datum/faith/inhumen_pantheon
	preference_accessible = FALSE
/datum/patron/inhumen/zizo
	name = "Zizo"
	domain = "The Eternal Beast of Chaos"
	desc = "Z-Who-Must-Not-Be-Named, the true creator and force behind all reality!"
	flaws = "Insanity"
	worshippers = "Apostates, Anarchists, Psychopaths"
	sins = "None, Zizo welcomes all to see the truth."
	boons = "You know other followers of Zizo when you see them."
	added_traits = list(TRAIT_CABAL)
	confess_lines = list(
		"I FOLLOW THE PATH OF ZIZO!",
		"I TRUST THE COUNSEL OF DAEMONS!",
		"ZIZO SHOWED ME THE WAY!",
	)

/datum/patron/inhumen/graggar
	name = "Graggar"
	domain = "The Dark Sini-Star of Murder, Defilement, and Hatred"
	desc = "The Father of Orcs and Goblins, a brutal tyrant bent to destruction."
	flaws = "Rage, Hatred, Bloodthirsty"
	worshippers = "Greenskins, The Revenge-Driven, Sadists"
	sins = "Compassion, Frailty, Servility"
	boons = "You are drawn to the flavour of raw flesh and organs, and may consume without worry."
	added_traits = list(TRAIT_ORGAN_EATER)
	confess_lines = list(
		"GRAGGAR IS THE BEAST I WORSHIP!",
		"GRAGGAR WILL RAVAGE YOU!",
		"GRAGGAR WILL SATE MY HUNGER!"
	)

/datum/patron/inhumen/matthios
	name = "Matthios"
	domain = "God of Thievery, Ill-Gotten Gains, and Highwaymen"
	desc = "Said to have stolen a spark of the divine, taking fire from the jealous gods and giving it to humenkind. Gifted his lessons of thievery and subversion to his devoted followers, his influence on the world tangible."
	flaws = "Pride, Greed, Reckless"
	worshippers = "Outlaws, Noble-Haters, Downtrodden Peasantry"
	sins = "Clumsiness, Hesitation, Humility"
	boons = "You can see the most expensive item someone is carrying."
	added_traits = list(TRAIT_MATTHIOS_EYES)
	confess_lines = list(
		"MATTHIOS STEAL MY PAIN!",
		"MATTHIOS WILL SAVE ME!",
		"MATTHIOS, MUST I BE YOUR MARTYR?!",
	)


/datum/action/cooldown/spell/projectile/moonlit_dagger
	sound = 'sound/misc/tail_swing.ogg'


#define TAG_NOCEVENT "nocevent"
#define TAG_PSYEVENT "psyevent"

/datum/triumph_buy/storyteller_influence_bonus/psydon
	name = "Psydon Influence"
	desc = "Buy an extra 25 influence for this god!"
	triumph_buy_id = TRIUMPH_BUY_PSYDON_INFLUENCE
	storyteller_name = PSYDON

/datum/storyteller/psydon
	name = PSYDON
	desc = "The Inquisition is coming..."
	welcome_text = "Humenity has not forgotten."
	weight = 4
	always_votable = TRUE
	color_theme = "#577fa7"

	tag_multipliers = list(
		TAG_BATTLE = 1,
		TAG_PSYEVENT = 100,
	)

	point_gains_multipliers = list(
		EVENT_TRACK_MUNDANE = 1,
		EVENT_TRACK_PERSONAL = 0.8,
		EVENT_TRACK_MODERATE = 1,
		EVENT_TRACK_INTERVENTION = 2,
		EVENT_TRACK_CHARACTER_INJECTION = 1,
		EVENT_TRACK_OMENS = 1,
		EVENT_TRACK_RAIDS = 1,
	)

	influence_sets = list(
		"Set 1" = list(
			STATS_ZIZO_PRAISED = list("name" = "The enemy praised:", "points" = -0.1, "capacity" = -30),
			STATS_PSYCROSS_USERS = list("name" = "Faith on display:", "points" = 5, "capacity" = 50),
		),
		"Set 2" = list(
			STATS_GRAVES_CONSECRATED = list("name" = "Proper graves:", "points" = 1, "capacity" = 20),
		),
		"Set 3" = list(
			STATS_ALIVE_NORTHERN_HUMANS = list("name" = "Humenity alive:", "points" = 2, "capacity" = 30),
		),
		"Set 4" = list(
			STATS_DEADITES_KILLED = list("name" = "Scourge of the Undead:", "points" = 3, "capacity" = 30),
		),
		"Set 5" = list(
			STATS_VAMPIRES_KILLED = list("name" = "Bane of the Vampyre:", "points" = 20, "capacity" = 60),
		)
	)


