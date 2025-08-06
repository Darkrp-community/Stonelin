// ==============================================================
// ==============================================================
/*	..................   Areas   ................... */

/area/rogue/outdoors/town
	first_time_text = "Stonehill Hamlet"

/area/rogue/indoors/town/hamlet
	name = "indoors"
	alpha = 150
	background_track = 'sound/music/area/indoor.ogg'
	background_track_dusk = 'sound/music/area/septimus.ogg'
	background_track_night = 'sound/music/area/deliverer.ogg'
	converted_type = /area/rogue/outdoors/exposed/townhamlet

/area/rogue/indoors/town/hamlet/advguild
	name = "adventurers guild"
	background_track = 'modular/stonekeep/sound/area/advguild.ogg'
	background_track_dusk = 'modular/stonekeep/sound/area/advguild.ogg'
	background_track_night = 'modular/stonekeep/sound/area/advguild.ogg'

/area/rogue/outdoors/exposed/townhamlet
	name = "stone hamlet"
	icon_state = "town"
	alpha = 150
	background_track = 'modular/stonekeep/sound/area/towngen.ogg'
	background_track_dusk = 'modular/stonekeep/sound/area/towngen.ogg'
	background_track_night = 'modular/stonekeep/sound/area/townstreets.ogg'

/area/rogue/indoors/town/tavern/saiga
	background_track = list('modular/stonekeep/sound/area/Folia1490.ogg', 'modular/stonekeep/sound/area/TheBanneredMare.ogg','modular/stonekeep/sound/area//LeTourdion.ogg','modular/stonekeep/sound/area/JaimSansPenserLaidure.ogg')
	background_track_dusk = list('modular/stonekeep/sound/area/ACircleofFaun.ogg', 'modular/stonekeep/sound/area/inn.ogg' )
	background_track_night = list('modular/stonekeep/sound/area/AFallenWarriorStandsAgain.ogg', 'modular/stonekeep/sound/area/TheOneWhoCarvedItAll.ogg' )
	converted_type = /area/rogue/outdoors/exposed/tavern/saiga

/area/rogue/outdoors/exposed/tavern/saiga
	background_track = list('modular/stonekeep/sound/area/Folia1490.ogg', 'modular/stonekeep/sound/area/TheBanneredMare.ogg','modular/stonekeep/sound/area//LeTourdion.ogg','modular/stonekeep/sound/area/JaimSansPenserLaidure.ogg')
	background_track_dusk = list('modular/stonekeep/sound/area/ACircleofFaun.ogg', 'modular/stonekeep/sound/area/inn.ogg' )
	background_track_night = list('modular/stonekeep/sound/area/AFallenWarriorStandsAgain.ogg', 'modular/stonekeep/sound/area/TheOneWhoCarvedItAll.ogg' )

/area/rogue/indoors/town/manor/stone
	name = "stonehill manor"
	alpha = 50
	background_track = 'modular/stonekeep/sound/area/manor.ogg'
	background_track_dusk = 'modular/stonekeep/sound/area/manor.ogg'
	background_track_night = 'modular/stonekeep/sound/area/manornight.ogg'
	converted_type = /area/rogue/outdoors/exposed/manorgarri
	first_time_text = "Stonehill manor"

/area/rogue/indoors/town/garrison
	name = "garrison"
	alpha = 100
	background_track = list('sound/music/area/manorgarri.ogg', 'sound/music/area/Wanyada.ogg')
	background_track_dusk = null
	background_track_night = null
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/rogue/outdoors/exposed/manorgarri

/area/rogue/under/tomb/indoors/magic
	background_track = 'modular/stonekeep/sound/area/magiciantower.ogg'

/area/rogue/under/tomb/indoors/royal
	background_track = 'modular/stonekeep/sound/area/manornight.ogg'

/area/rogue/indoors/town/church
	name = "temple"
	icon_state = "church"
	background_track = 'modular/stonekeep/sound/area/temple.ogg'
	background_track_dusk = null
	background_track_night = 'modular/stonekeep/sound/area/templenight.ogg'
	converted_type = /area/rogue/outdoors/exposed/church

/area/rogue/outdoors/exposed/church
	icon_state = "church"
	background_track = 'modular/stonekeep/sound/area/temple.ogg'
	background_track_dusk = null
	background_track_night = 'modular/stonekeep/sound/area/templenight.ogg'

/area/rogue/indoors/town/bath/redhouse
	name = "baths"
	background_track = 'modular/stonekeep/sound/area/Fulminate.ogg'
	background_track_dusk = 'modular/stonekeep/sound/area/IntoTheNight.ogg'
	background_track_night = 'modular/stonekeep/sound/area/IntoTheNight.ogg'


/area/rogue/outdoors/rtfield/plague_district
	ambush_mobs = list(/mob/living/simple_animal/hostile/zizombie)
	ambush_times = list("night","dusk", "dawn")
	ambush_types = list(
				/turf/open/floor/dirt)
	first_time_text = "PLAGUE DISTRICT"
	color = "#d4da75"
	name = "danger (plague district)"
	background_track = 'sound/music/area/underworlddrone.ogg'
	ambient_index = AMBIENCE_MYSTICAL
	droning_index = DRONING_FOREST_NIGHT

/area/rogue/outdoors/rtfield/outlaw
	ambush_mobs = list(/mob/living/carbon/human/species/human/northern/bum/ambush/outlaw = 50)
	name = "danger (outlaws)"
	first_time_text = ""
	color = "#e9baa3"
	ambush_times = list("day","dawn","night","dusk")
	background_track = 'sound/music/area/forest.ogg'
	background_track_dusk = 'sound/music/area/septimus.ogg'
	background_track_night = 'sound/music/area/forestnight.ogg'


/area/rogue/outdoors/rtfield/hamlet
	name = "hamlet surroundings"
	ambush_times = list("night","dusk")
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/wolf = 60,
				/mob/living/carbon/human/species/goblin/npc/ambush = 5,
				/mob/living/simple_animal/pet/cat/cabbit = 10)
	first_time_text = "the Valley"
	ambush_types = list(
				/turf/open/floor/dirt)

/area/rogue/under/cave/sumpgrotto
	name = "sump grotto"
	first_time_text = "Sump Grotto"
	ambush_types = list(
				/turf/open/floor/dirt/muddie, /turf/open/floor/naturalstone/rough)
	ambush_times = list("day","dawn","night","dusk")
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/mole = 50,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 50)

/area/rogue/under/lavamonastery
	name = "danger(monastery)"
	icon_state = "cavelava"
	background_track = 'modular/stonekeep/kaizoku/sound/ambience/Syzygy.ogg'
	converted_type = /area/rogue/outdoors/exposed/decap

/area/rogue/under/cavelava
	first_time_text = ""

/area/rogue/outdoors/rtfield/spooky		// haunts ambush and dug down hidden treasure
	ambush_mobs = list(/mob/living/simple_animal/hostile/haunt = 50)
	name = "spooky place"
	color = "#9294d3"

/area/rogue/outdoors/mountains/deception
	name = "deception"
	icon_state = "deception"
	first_time_text = "THE CANYON OF DECEPTION"
	ambush_types = list(
				/turf/open/floor/dirt)
	ambush_mobs = list(
				/mob/living/carbon/human/species/skeleton/npc/ambush = 15,
				/mob/living/carbon/human/species/goblin/npc/ambush/hell = 50)

/area/rogue/outdoors/mountains/decap
	name = "mt decapitation"
	icon_state = "decap"
	ambush_types = list(
				/turf/open/floor/snow)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/troll = 5,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 50)
	background_track = 'sound/music/area/decap.ogg'
	background_track_dusk = null
	background_track_night = null
	first_time_text = "MOUNT DECAPITATION"
	ambush_times = list("night","dawn","dusk","day")
	converted_type = /area/rogue/indoors/shelter/mountains/decap

// modifications to bog area
/area/rogue/outdoors/bog
	first_time_text = ""
/area/rogue/outdoors/bog/wetlands
	ambush_times = list("night","dawn","dusk")
	ambush_types = list(
				/turf/open/floor/dirt,
				/turf/open/floor/grass,
				/turf/open/floor/grass/red,
				/turf/open/water/swamp,
				/turf/open/floor/dirt/muddie)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/bigrat = 20,
				/mob/living/simple_animal/hostile/retaliate/spider = 20,
				/mob/living/carbon/human/species/goblin/npc/ambush/sea = 20,
				/mob/living/simple_animal/hostile/retaliate/trollbog = 3)
	first_time_text = "TREACHEROUS WETLANDS"

/area/rogue/outdoors/bog/wetlands/gator
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/gator = 10)


/area/rogue/outdoors/woods/stone
	ambush_types = list(
				/turf/open/floor/grass, /turf/open/floor/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/wolf = 40,
				/mob/living/simple_animal/hostile/retaliate/spider/hairy = 10)
	first_time_text = "THE MURDERWOODS"
	converted_type = /area/rogue/indoors/shelter/woods


/area/rogue/outdoors/beach
	name = "beach"
	background_track = 'modular/stonekeep/kaizoku/sound/ambience/Oceansanct.ogg'
	background_track_dusk = 'modular/stonekeep/kaizoku/sound/ambience/Town_in_Rogue.ogg'
	background_track_night = 'modular/stonekeep/kaizoku/sound/ambience/Defenestration.ogg'

/area/rogue/under/cave/abandoned_mine
	name = "abandoned mine"
	first_time_text = "Abandoned Mine"
	ambush_types = list(
				/turf/open/floor/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/bigrat = 30,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 5,
				/mob/living/simple_animal/hostile/retaliate/mole = 10)
	background_track = 'modular/stonekeep/kaizoku/sound/ambience/Nebula.ogg'

/area/rogue/under/town/caverogue/deep
	first_time_text = "DEEP MINESHAFT"
	background_track = 'modular/stonekeep/kaizoku/sound/ambience/Nebula.ogg'

/area/rogue/indoors/towerofwise
	name = "danger (tower of the wise)"
	icon_state = "cave"
	background_track = 'modular/stonekeep/kaizoku/sound/ambience/Nebula.ogg'

/area/rogue/indoors/cave/volf
	name = "danger (volf cave)"
	icon_state = "cave"
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/wolf)
	background_track = 'modular/stonekeep/kaizoku/sound/ambience/Nebula.ogg'

/area/rogue/indoors/cave/bear
	name = "danger (bear cave)"
	icon_state = "cave"
	background_track = 'modular/stonekeep/kaizoku/sound/ambience/Nebula.ogg'

/area/rogue/indoors/shelter/woods/spider
	name = "danger (spider nest)"
	icon_state = "cave"

/area/rogue/indoors/cave/spider
	name = "danger (spider cave)"
	icon_state = "cave"

/area/rogue/outdoors/town/amphitheatre
	name = "town (amphitheatre)"

/area/rogue/under/catacombs
	name = "catacombs"
	icon_state = "cavewet"
	first_time_text = "Catacombs"
	droning_index = DRONING_CAVE_GENERIC
	ambient_index = AMBIENCE_CAVE
	background_track = 'sound/music/area/caves.ogg'
	background_track_dusk = 'modular/stonekeep/kaizoku/sound/ambience/Bucolic.ogg'
	background_track_night = 'modular/stonekeep/kaizoku/sound/ambience/Nebula.ogg'
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/water/swamp)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/skeleton = 30,
				/mob/living/simple_animal/hostile/retaliate/bigrat = 10)
	converted_type = /area/rogue/outdoors/caves

/area/rogue/under/xylix
	name = "dungeon (xylix maze)"
	icon_state = "cavewet"
	first_time_text = "The Maze"
	droning_index = DRONING_CAVE_GENERIC
	ambient_index = AMBIENCE_CAVE
	background_track = 'modular/stonekeep/sound/area/clocktower_ambience.ogg'
	background_track_dusk = 'modular/stonekeep/sound/area/clocktower_ambience.ogg'
	background_track_night = 'modular/stonekeep/sound/area/xylixarea.ogg'

/area/rogue/under/zizochurch
	name = "zizos church"
	icon_state = "cavewet"
	first_time_text = "Church of the Lost"
	background_track = 'modular/stonekeep/sound/area/zizochurch.ogg'
	background_track_dusk = 'modular/stonekeep/sound/area/zizochurch.ogg'
	background_track_night = 'modular/stonekeep/sound/area/zizochurch.ogg'

/area/rogue/under/catacombs/dwarfoutpost
	name = "dungeon (outpost)"
	first_time_text = "Underrock Outpost"
	ambush_types = list(
				/turf/open/water/swamp)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/lamia = 30)

/area/rogue/under/town/caverogue/saltmine
	name = "salt mine"
	first_time_text = "Salt Mine"

/area/rogue/under/necropolis
	name = "necropolis"
	icon_state = "cave"
	first_time_text = "Necropolis"
	droning_index = DRONING_CAVE_GENERIC
	ambient_index = AMBIENCE_CAVE
	background_track = 'sound/music/area/caves.ogg'
	background_track_dusk = 'modular/stonekeep/kaizoku/sound/ambience/Bucolic.ogg'
	background_track_night = 'modular/stonekeep/kaizoku/sound/ambience/Nebula.ogg'
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/water/swamp)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/skeleton = 30,
				/mob/living/simple_animal/hostile/retaliate/bigrat = 10)

