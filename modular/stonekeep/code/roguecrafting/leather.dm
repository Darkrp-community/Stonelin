/* SKINCRAFT	-	skincraft skill
==========================================================*/
// The only ingridients these recipes can require is HIDE and FUR
// They all require a needle

/datum/blueprint_recipe/leather
	construct_tool = list(/obj/item/needle)
	skillcraft = /datum/skill/craft/tanning
	craftdiff = 0
	required_materials = list(/obj/item/natural/hide/cured  = 1)


/*========= NO SKILL LEVEL REQUIRED ==========*/
/datum/blueprint_recipe/leather/saddle
	name = "saddle"
	result_type = /obj/item/natural/saddle
	required_materials = list(/obj/item/natural/hide/cured = 2)
	craftdiff = 1

/datum/blueprint_recipe/leather/drum
	name = "instrument (drum)"
	result_type = /obj/item/instrument/drum
	required_materials = list(/obj/item/natural/hide/cured = 1, /obj/item/grown/log/tree/small = 1)
	craftdiff = 4

/datum/blueprint_recipe/leather/whip
	name = "whip (rawhide)"
	result_type = /obj/item/weapon/whip
	required_materials = list(/obj/item/natural/hide = 2)
	craftdiff = 1

/datum/blueprint_recipe/leather/shirt
	name = "shirt (tribal)"
	result_type = /obj/item/clothing/shirt/tribalrag
	required_materials = list(/obj/item/natural/hide = 1)
	craftdiff = 0


/*=========		CLOAKS	==========*/
/datum/blueprint_recipe/leather/volfmantle
	name = "cloak (volf mantle)"
	result_type = /obj/item/clothing/cloak/volfmantle
	required_materials = list(/obj/item/natural/fur/volf = 1,
	/obj/item/natural/head/volf = 1)
	craftdiff = 2
//	req_imperial = TRUE

/datum/blueprint_recipe/leather/cloak
	name = "cloak (leather)"
	result_type = /obj/item/clothing/cloak/raincloak/colored/brown

/datum/blueprint_recipe/leather/apron
	name = "cloak (leather apron)"
	result_type = /obj/item/clothing/cloak/apron/brown

/datum/blueprint_recipe/leather/cloakfur
	name = "cloak (fur)"
	result_type = /obj/item/clothing/cloak/raincloak/furcloak
	required_materials = list(/obj/item/natural/fur = 1)

/datum/blueprint_recipe/leather/tribal_cloak
	name = "cloak (tribal)"
	result_type = /obj/item/clothing/cloak/tribal
	required_materials = list(/obj/item/natural/hide = 2)


/*========= CONTAINERS ==========*/
/datum/blueprint_recipe/leather/satchel
	name = "storage (satchel)"
	result_type = /obj/item/storage/backpack/satchel
	required_materials = list(/obj/item/natural/hide/cured = 2)
	craftdiff = 1

/datum/blueprint_recipe/leather/meatbag
	name = "storage (game satchel)"
	result_type = /obj/item/storage/meatbag
	required_materials = list(/obj/item/natural/hide/cured = 2)
	craftdiff = 1

/datum/blueprint_recipe/leather/waterskin
	name = "waterskin"
	required_materials = list(/obj/item/natural/hide/cured = 1)
	result_type = /obj/item/reagent_containers/glass/bottle/waterskin

/datum/blueprint_recipe/leather/quiver
	name = "quiver"
	result_type = /obj/item/ammo_holder/quiver
	required_materials = list(/obj/item/natural/hide/cured = 2)

/datum/blueprint_recipe/leather/belt
	name = "belt (leather)"
	required_materials = list(/obj/item/natural/hide/cured = 1)
	result_type = list(/obj/item/storage/belt/leather)

/datum/blueprint_recipe/leather/pouch
	name = "leather pouch"
	required_materials = list(/obj/item/natural/hide/cured = 1)
	result_type = list(/obj/item/storage/belt/pouch)

/datum/blueprint_recipe/leather/backpack
	name = "storage (backpack)"
	result_type = /obj/item/storage/backpack/backpack
	required_materials = list(/obj/item/natural/hide/cured = 4)
	craftdiff = 2


/*=========		ARMOR	==========*/
/datum/blueprint_recipe/leather/armor
	name = "armor (leather)"
	result_type = /obj/item/clothing/armor/leather/basic
	required_materials = list(/obj/item/natural/hide/cured = 2)
	craftdiff = 1
//	req_imperial = TRUE

/datum/blueprint_recipe/leather/armor/haori
	name = "armor (unruly backcoat) {fl}"
	result_type = list(/obj/item/clothing/cloak/eastcloak2)
	required_materials = list(/obj/item/natural/hide = 2)
//	req_islander = TRUE

/datum/blueprint_recipe/leather/armor/haori
	name = "armor (curator cloak) {fl}"
	result_type = list(/obj/item/clothing/cloak/curator)
	required_materials = list(/obj/item/natural/hide = 2)
//	req_islander = TRUE

/datum/blueprint_recipe/leather/armor/haori
	name = "armor (susohiki attire) {fl}"
	result_type = list(/obj/item/clothing/armor/leather/jacket/susohiki)
	required_materials = list(/obj/item/natural/hide = 2)
//	req_islander = TRUE

/datum/blueprint_recipe/leather/armor/haori
	name = "armor (dobuku robe) {fl}"
	result_type = list(/obj/item/clothing/armor/leather/jacket/eastsuit3)
	required_materials = list(/obj/item/natural/hide = 2)
//	req_islander = TRUE

/datum/blueprint_recipe/leather/armor/haori
	name = "armor (michiyuki robe) {fl}"
	result_type = list(/obj/item/clothing/armor/leather/jacket/eastsuit2)
	required_materials = list(/obj/item/natural/hide = 2)
//	req_islander = TRUE

/datum/blueprint_recipe/leather/armor/haori
	name = "armor (haori robe) {fl}"
	result_type = list(/obj/item/clothing/armor/leather/jacket/eastsuit1)
	required_materials = list(/obj/item/natural/hide = 2)
//	req_islander = TRUE

/datum/blueprint_recipe/leather/armor/corset
	name = "armor (corset)"
	result_type = /obj/item/clothing/armor/corset
	required_materials = list(/obj/item/natural/hide/cured = 1)

/datum/blueprint_recipe/leather/armor/vest
	name = "armor (leather vest)"
	result_type = /obj/item/clothing/armor/leather/vest
	required_materials = list(/obj/item/natural/hide/cured = 1)

/datum/blueprint_recipe/leather/armor/jacket
	name = "armor (leather jacket)"
	result_type = /obj/item/clothing/armor/leather/jacket
	required_materials = list(/obj/item/natural/hide/cured = 2)

/datum/blueprint_recipe/leather/armor/sea
	name = "armor (sea jacket)"
	result_type = /obj/item/clothing/armor/leather/jacket/sea
	required_materials = list(/obj/item/natural/hide/cured = 2)
	craftdiff = 2



/datum/blueprint_recipe/leather/armor/abyssal
	name = "armor (leather lamellar)"
	result_type = /obj/item/clothing/armor/leather/abyssal
//	req_islander = TRUE

/datum/blueprint_recipe/leather/dustwalker
	name = "armor (cavalry)"
	result_type = /obj/item/clothing/armor/leather/hide/dustwalker
	required_materials = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2
//	req_islander = TRUE

/datum/blueprint_recipe/leather/shozoku
	name = "armor (stealthy)"
	result_type = /obj/item/clothing/armor/leather/hide/shozoku
	required_materials = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2
//	req_islander = TRUE

/datum/blueprint_recipe/leather/kaizoku	// ROGTODO should be silk according to desc
	name = "armor (heartfeltean vest)"
	result_type = /obj/item/clothing/armor/leather/vest/kaizoku
	required_materials = list(/obj/item/natural/hide = 2)
	craftdiff = 2
//	req_islander = TRUE

/datum/blueprint_recipe/leather/armor/hide
	name = "armor (fur)"
	result_type = /obj/item/clothing/armor/leather/hide
	required_materials = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2

/datum/blueprint_recipe/leather/armor/heavy
	name = "armor (heavy leather armor)"
	result_type = /obj/item/clothing/armor/leather/heavy
	required_materials = list(/obj/item/natural/hide/cured = 3, /obj/item/reagent_containers/food/snacks/tallow = 1)
	craftdiff = 4 // More coverage, incentive to train leathercrafting, tailors have a chance to start at 4 therefore craftable enough

/datum/blueprint_recipe/leather/armor/heavycoat
	name = "armor (heavy leather coat)"
	result_type = /obj/item/clothing/armor/leather/heavy/coat
	required_materials = 	list(/obj/item/natural/hide/cured = 4, /obj/item/reagent_containers/food/snacks/tallow = 1)
	craftdiff = 3 // Coat, so it has less coverage, therefore easier, hunters can craft


/*=========		SHOES	==========*/
/datum/blueprint_recipe/leather/tribal_shoes
	name = "shoes (tribal)"
	result_type = list(/obj/item/clothing/shoes/tribal)
	required_materials = list(/obj/item/natural/hide  = 1)

/*/datum/blueprint_recipe/leather/furlinedanklets
	name = "shoes (fur lined anklets)"
	required_materials = list(/obj/item/natural/fur = 1)
	result_type = /obj/item/clothing/shoes/boots/furlinedanklets
*/

/datum/blueprint_recipe/leather/sandals
	name = "shoes (sandals)"
	result_type = /obj/item/clothing/shoes/sandals
//	req_imperial = TRUE

/datum/blueprint_recipe/leather/shoes
	name = "shoes (simple}"
	result_type = /obj/item/clothing/shoes/simpleshoes
//	req_imperial = TRUE

/datum/blueprint_recipe/leather/jikatabi
	name = "shoes (jikatabi)"
	result_type = list(/obj/item/clothing/shoes/boots/jikatabi)
//	req_islander = TRUE

/datum/blueprint_recipe/leather/cloudhead
	name = "shoes (cloudhead)"
	result_type = /obj/item/clothing/shoes/shortboots/cloudhead
//	req_islander = TRUE

/datum/blueprint_recipe/leather/geta
	name = "shoes (geta sandals)"
	result_type = /obj/item/clothing/shoes/sandals/geta
//	req_islander = TRUE

/datum/blueprint_recipe/leather/furlinedboots
	name = "shoes (fur lined boots)"
	result_type = /obj/item/clothing/shoes/boots/furlinedboots
	required_materials = 	list(/obj/item/natural/hide = 1,
				/obj/item/natural/fur = 1)
	craftdiff = 1

/datum/blueprint_recipe/leather/boots
	name = "shoes (leather boots) {ip}"
	result_type = /obj/item/clothing/shoes/boots/leather
//	req_imperial = TRUE
	craftdiff = 1

/datum/blueprint_recipe/leather/boots_short
	name = "shoes (short boots)"
	result_type = /obj/item/clothing/shoes/shortboots
//	req_imperial = TRUE
	craftdiff = 1

/datum/blueprint_recipe/leather/gladiator
	name = "shoes (gladiator sandals)"
	result_type = /obj/item/clothing/shoes/gladiator
	craftdiff = 2
//	req_imperial = TRUE

/datum/blueprint_recipe/leather/boots_noble
	name = "shoes (noble boots)"
	result_type = /obj/item/clothing/shoes/nobleboot
//	req_imperial = TRUE
	craftdiff = 2

/datum/blueprint_recipe/leather/boots_dark
	name = "shoes (riding boots)"
	result_type = /obj/item/clothing/shoes/ridingboots
//	req_imperial = TRUE
	craftdiff = 2

/datum/blueprint_recipe/leather/boots_dark
	name = "shoes (riding boots)"
	result_type = /obj/item/clothing/shoes/ridingboots
//	req_imperial = TRUE
	craftdiff = 2

/datum/blueprint_recipe/leather/boots_dark
	name = "shoes (dark boots)"
	result_type = /obj/item/clothing/shoes/boots
//	req_imperial = TRUE
	craftdiff = 3

/datum/blueprint_recipe/leather/boots_heavy
	name = "shoes (heavy leather boots)"
	result_type = /obj/item/clothing/shoes/boots/leather/heavy
	required_materials = 	list(/obj/item/natural/hide/cured = 2, /obj/item/reagent_containers/food/snacks/tallow = 1)
	craftdiff = 3

/datum/blueprint_recipe/leather/boots_otavan
	name = "shoes (otavan boots)"
	result_type = /obj/item/clothing/shoes/otavan
	required_materials = 	list(/obj/item/natural/hide/cured = 2, /obj/item/ingot/iron = 1)
	craftdiff = 3


/*=========		GLOVES	==========*/
/datum/blueprint_recipe/leather/gloves
	name = "gloves (leather)"
	result_type = /obj/item/clothing/gloves/leather

/datum/blueprint_recipe/leather/abyssalgloves
	name = "gloves (abyssal)"
	result_type = /obj/item/clothing/gloves/leather/abyssal
//	req_islander = TRUE

/datum/blueprint_recipe/leather/falcon
	name = "gloves (falconry)"
	result_type = /obj/item/clothing/gloves/angle/falcon
	required_materials = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fur = 1)
	craftdiff = 1
//	req_islander = TRUE

/datum/blueprint_recipe/leather/heavygloves
	name = "gloves (heavy leather)"
	result_type = /obj/item/clothing/gloves/angle
	required_materials = list(/obj/item/natural/hide/cured = 1,
				/obj/item/reagent_containers/food/snacks/tallow = 1)
	craftdiff = 2

/datum/blueprint_recipe/leather/gloves_otavan
	name = "gloves (otavan)"
	result_type = /obj/item/clothing/gloves/leather/otavan
	required_materials = 	list(/obj/item/natural/hide/cured = 2)
	craftdiff = 3



/*=========		PANTS	==========*/
/datum/blueprint_recipe/leather/pants
	name = "pants (leather)"
	result_type = list(/obj/item/clothing/pants/trou/leather)
	required_materials = list(/obj/item/natural/hide/cured = 2)
//	req_imperial = TRUE

/datum/blueprint_recipe/leather/furtobi
	name = "pants (fur)"
	result_type = list(/obj/item/clothing/pants/trou/leather/fur)
//	req_islander = TRUE

/datum/blueprint_recipe/leather/pants_heavy
	name = "pants (heavy leather)"
	result_type = /obj/item/clothing/pants/trou/leather/heavy
	required_materials = 	list(/obj/item/natural/hide/cured = 2, /obj/item/reagent_containers/food/snacks/tallow = 1)
	craftdiff = 3

/datum/blueprint_recipe/leather/pants_padded
	name = "pants (padded leather)"
	result_type = /obj/item/clothing/pants/trou/leather/padded
	required_materials = 	list(/obj/item/natural/hide/cured = 2, /obj/item/natural/cloth = 2)
	craftdiff = 3


/*=========		BRACERS	==========*/
/datum/blueprint_recipe/leather/bracers
	name = "bracers (leather)"
	result_type = /obj/item/clothing/wrists/bracers/leather
//	req_imperial = TRUE

/datum/blueprint_recipe/leather/khudagach
	name = "bracers (archery)"
	result_type = /obj/item/clothing/wrists/bracers/leather/khudagach
//	req_islander = TRUE

/datum/blueprint_recipe/leather/bracers_hardened
	name = "bracers (heavy leather)"
	result_type = /obj/item/clothing/wrists/bracers/leather/heavy
	required_materials = 	list(/obj/item/natural/hide/cured = 2, /obj/item/reagent_containers/food/snacks/tallow = 1)
	craftdiff = 3


/*=========		HEAD & NECK	==========*/
/datum/blueprint_recipe/leather/hood
	name = "hood"
	result_type = /obj/item/clothing/head/roguehood/colored/brown
	required_materials = list(/obj/item/natural/hide = 1)

/datum/blueprint_recipe/leather/papakha
	name = "hat (papakha)"
	result_type = /obj/item/clothing/head/papakha
	required_materials = list(/obj/item/natural/fur = 1)

/datum/blueprint_recipe/leather/brimmedhat
	name = "hat (brimmed)"
	result_type = /obj/item/clothing/head/brimmed
	required_materials = list(/obj/item/natural/hide = 1)



/datum/blueprint_recipe/leather/malgai
	name = "helmet (malgai)"
	result_type = /obj/item/clothing/head/helmet/leather/malgai
	required_materials = list(/obj/item/natural/hide = 2)
	craftdiff = 1
//	req_islander = TRUE

/datum/blueprint_recipe/leather/kaizokuhat
	name = "hat (heartfeltean)"
	result_type = /obj/item/clothing/head/helmet/leather/malgai/kaizoku
	required_materials = list(/obj/item/natural/hide = 2)
	craftdiff = 1
//	req_islander = TRUE

/datum/blueprint_recipe/leather/kaizokuhat/female
	name = "hat (female heartfeltean)"
	result_type = /obj/item/clothing/head/helmet/leather/malgai/kaizoku/female
	required_materials = list(/obj/item/natural/hide = 2)
	craftdiff = 1
//	req_islander = TRUE

/datum/blueprint_recipe/leather/arisan
	name = "helmet (cavalry headgear)"
	required_materials = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2
//	req_islander = TRUE

/datum/blueprint_recipe/leather/coif
	name = "coif (leather)"
	result_type = /obj/item/clothing/neck/coif
	craftdiff = 2

/datum/blueprint_recipe/leather/helmet
	name = "helmet (leather)"
	result_type = /obj/item/clothing/head/helmet/leather
	required_materials = list(/obj/item/natural/hide = 2)
	craftdiff = 1
//	req_imperial = TRUE

/datum/blueprint_recipe/leather/antlerhood
	name = "hood (antler)"
	result_type = /obj/item/clothing/head/antlerhood
	required_materials = list(/obj/item/natural/hide = 1,
	/obj/item/natural/head/saiga = 1)
	craftdiff = 1

/datum/blueprint_recipe/leather/hood_heavy
	name = "hood (heavy leather)"
	result_type = /obj/item/clothing/head/roguehood/random/heavy
	required_materials = 	list(/obj/item/natural/hide/cured = 2, /obj/item/reagent_containers/food/snacks/tallow = 1)
	craftdiff = 4

