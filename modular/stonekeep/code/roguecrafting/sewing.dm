/* SEWING	-	sewing skill
==========================================================*/
// The only ingridients these recipes can require is CLOTH and FIBRE
// They all require a needle

/datum/blueprint_recipe/sewing
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	subtype_reqs = TRUE // so you can use any subtype of fur
	craftdiff = 0
	required_materials = list(/obj/item/natural/fibers = 1, /obj/item/natural/cloth = 2)


/*========= NO SKILL LEVEL REQUIRED ==========*/

/datum/blueprint_recipe/sewing/clothsack
	name = "sack"
	result_type = list(/obj/item/storage/sack)
	required_materials = list(/obj/item/natural/fibers = 1,
				/obj/item/natural/cloth = 1)

/obj/item/storage/sack/crafted
	sellprice = 4

/datum/blueprint_recipe/sewing/sacksatchel//a bag with a piece of cloth
	name = "cloth knapsack"
	result_type = list(/obj/item/storage/backpack/satchel/cloth)
	required_materials = list(/obj/item/natural/fibers = 1,
				/obj/item/natural/cloth = 2)

/datum/blueprint_recipe/sewing/burial_shroud
	name = "winding sheet"
	result_type = list(/obj/item/burial_shroud)

/datum/blueprint_recipe/sewing/loincloth
	name = "loincloth"
	result_type = list(/obj/item/clothing/pants/loincloth)
	required_materials = list(/obj/item/natural/cloth = 1)

/datum/blueprint_recipe/sewing/clothgloves
	name = "gloves (fingerless)"
	result_type = list(/obj/item/clothing/gloves/fingerless)
	required_materials = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/cmask
	name = "mask"
	result_type = list(/obj/item/clothing/face/shepherd/clothmask)
	required_materials = list(/obj/item/natural/cloth = 1)

/datum/blueprint_recipe/sewing/ragmask
	name = "mask (rag)"
	result_type = list(/obj/item/clothing/face/shepherd/rag)
	required_materials = list(/obj/item/natural/cloth = 1)

/*/datum/blueprint_recipe/sewing/linedanklet
	name = "cloth anklet"
	result_type = list(/obj/item/clothing/shoes/boots/clothlinedanklets)
*/

/datum/blueprint_recipe/sewing/Reyepatch
	name = "right eye patch"
	result_type = list(/obj/item/clothing/face/eyepatch)

/datum/blueprint_recipe/sewing/Leyepatch
	name = "left eye patch"
	result_type = list(/obj/item/clothing/face/eyepatch/left)

/datum/blueprint_recipe/sewing/bedsheetpelt
	name = "bedsheet (fur)"
	result_type = list(/obj/item/bedsheet/pelt)
	required_materials = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/blueprint_recipe/sewing/sleepingbag
	name = "sleepcloth"
	result_type = list(/obj/item/sleepingbag)
	required_materials =  list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/blueprint_recipe/sewing/bedsheet
	name = "bedsheet"
	result_type = list(/obj/item/bedsheet/cloth)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/*=========		CLOAK	==========*/
/datum/blueprint_recipe/sewing/jupon
	name = "cloak (jupon)"
	result_type = list(/obj/item/clothing/cloak/stabard/surcoat)
	required_materials = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/apron
	name = "cloak (apron)"
	result_type = list(/obj/item/clothing/cloak/apron)
	required_materials = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/tabard
	name = "cloak (tabard)"
	result_type = list(/obj/item/clothing/cloak/tabard)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/tabard/crusader
	name = "cloak (crusader tabard)"
	result_type = list(/obj/item/clothing/cloak/tabard/crusader)

/datum/blueprint_recipe/sewing/stabard
	name = "cloak (surcoat)"
	result_type = list(/obj/item/clothing/cloak/stabard)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/cape
	name = "cloak (cape)"
	result_type = list(/obj/item/clothing/cloak/cape)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/cape
	name = "cloak (desert cape)"
	result_type = list(/obj/item/clothing/cloak/cape/crusader)
	required_materials = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 2)
	craftdiff = 3
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/tabard_templar
	name = "surcoat (templar)"
	result_type = list(/obj/item/clothing/cloak/stabard/templar)
	required_materials = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/tabard_templar/astrata
	name = "surcoat (solar)"
	result_type = list(/obj/item/clothing/cloak/stabard/templar/astrata)

/datum/blueprint_recipe/sewing/tabard_templar/necra
	name = "surcoat (necra)"
	result_type = list(/obj/item/clothing/cloak/stabard/templar/necra)

/datum/blueprint_recipe/sewing/tabard_templar/dendor
	name = "surcoat (dendor)"
	result_type = list(/obj/item/clothing/cloak/stabard/templar/dendor)

/datum/blueprint_recipe/sewing/tabard_templar/noc
	name = "surcoat (lunar)"
	result_type = list(/obj/item/clothing/cloak/stabard/templar/noc)

/datum/blueprint_recipe/sewing/tabard_templar/abyssor
	name = "surcoat (abyssal)"
	result_type = list(/obj/item/clothing/cloak/stabard/templar/abyssor)

/datum/blueprint_recipe/sewing/tabard_templar/malum
	name = "surcoat (malumite)"
	result_type = list(/obj/item/clothing/cloak/stabard/templar/malum)

/datum/blueprint_recipe/sewing/tabard_templar/eora
	name = "surcoat (eoran)"
	result_type = list(/obj/item/clothing/cloak/stabard/templar/eora)

/datum/blueprint_recipe/sewing/tabard_templar/pestra
	name = "surcoat (pestra)"
	result_type = list(/obj/item/clothing/cloak/stabard/templar/pestra)


/*=========		ARMOR	==========*/
/datum/blueprint_recipe/sewing/gambeson
	name = "armor (gambeson)"
	result_type = /obj/item/clothing/armor/gambeson
	required_materials = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 2)
	craftdiff = 2
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/lgambeson
	name = "armor (light gambeson)"
	result_type = list(/obj/item/clothing/armor/gambeson/light)
	required_materials = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_imperial = TRUE
/datum/blueprint_recipe/sewing/stripedtunic
	name = "armor (padded tunic)"
	result_type = list(/obj/item/clothing/armor/gambeson/light/striped)
	required_materials = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/armingjacket
	name = "armor (arming jacket)"
	result_type = list(/obj/item/clothing/armor/gambeson/arming)
	required_materials = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 2)
	req_imperial = TRUE
	craftdiff = 3

/datum/blueprint_recipe/sewing/armingjacket
	name = "armor (padded gambeson)"
	result_type = list(/obj/item/clothing/armor/gambeson/heavy)
	required_materials = list(/obj/item/natural/cloth = 6,
				/obj/item/natural/fibers = 4)
	req_imperial = TRUE
	craftdiff = 4

/datum/blueprint_recipe/sewing/robe
	name = "robes"
	result_type = list(/obj/item/clothing/shirt/robe/plain)
	required_materials = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/robe/wizard
	name = "robes (wizard)"
	result_type = list(/obj/item/clothing/shirt/robe/wizard)
	craftdiff = 3


/*========= CLOTHING ==========*/
/datum/blueprint_recipe/sewing/clothtrou
	name = "cloth trousers {ip}"
	result_type = list(/obj/item/clothing/pants/trou)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/dress
	name = "dress (plain)"
	result_type = list(/obj/item/clothing/shirt/dress/gen)
	required_materials = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
/datum/blueprint_recipe/sewing/dress/black
	name = "dress (black)"
	result_type = list(/obj/item/clothing/shirt/dress/gen/black)
/datum/blueprint_recipe/sewing/dress/blue
	name = "dress (blue)"
	result_type = list(/obj/item/clothing/shirt/dress/gen/blue)
/datum/blueprint_recipe/sewing/dress/purple
	name = "dress (purple))"
	result_type = list(/obj/item/clothing/shirt/dress/gen/purple)
/datum/blueprint_recipe/sewing/dress/sexy
	name = "dress (seductive)"
	result_type = list(/obj/item/clothing/shirt/dress/gen/sexy)
	craftdiff = 5


/datum/blueprint_recipe/sewing/undershirt
	name = "shirt (under)"
	result_type = list(/obj/item/clothing/shirt/undershirt/priest)
	required_materials = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/shortshirt
	name = "shirt (short)"
	result_type = list(/obj/item/clothing/shirt/shortshirt/uncolored)
	required_materials = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/clothshirt
	name = "shirt"
	result_type = list(/obj/item/clothing/shirt/undershirt/uncolored)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/rags
	name = "shirt (rags)"
	result_type = list(/obj/item/clothing/shirt/rags)
	required_materials = list(/obj/item/natural/cloth = 2)
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/clothtights
	name = "trousers (tights)"
	result_type = list(/obj/item/clothing/pants/tights/uncolored)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/tunic
	name = "shirt (tunic)"
	result_type = list(/obj/item/clothing/shirt/tunic/ucolored)
	required_materials = list(/obj/item/natural/cloth = 2)
	craftdiff = 2
/datum/blueprint_recipe/sewing/tunic/lowcut
	name = "shirt (low-cut tunic)"
	result_type = list(/obj/item/clothing/shirt/undershirt/lowcut)

/datum/blueprint_recipe/sewing/monkgarb
	name = "clothes (monk garb)"
	result_type = list(/obj/item/clothing/shirt/rags/monkgarb)
	required_materials = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/blueprint_recipe/sewing/kimono
	name = "clothes (kimono)"
	result_type = list(/obj/item/clothing/shirt/tunic/kimono)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/blueprint_recipe/sewing/kamishimo
	name = "clothes (kamishimo upperside)"
	result_type = list(/obj/item/clothing/shirt/tunic/kamishimo)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/blueprint_recipe/sewing/tribal
	name = "clothes (tribal garb)"
	result_type = list(/obj/item/clothing/pants/kaizoku/tribal)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE



/*=========		HEADWEAR	==========*/
/datum/blueprint_recipe/sewing/pcoif
	name = "coif (padded)"
	result_type = list(/obj/item/clothing/neck/coif/cloth)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/blueprint_recipe/sewing/fisherhat
	name = "hat (fisher)"
	result_type = list(/obj/item/clothing/head/fisherhat)
	required_materials = list(/obj/item/natural/fibers = 1, /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/sack
	name = "hat (sack hood)"
	result_type = list(/obj/item/clothing/head/menacing)
	required_materials = list(/obj/item/storage/sack)

/datum/blueprint_recipe/sewing/armingcap
	name = "hat (arming cap)"
	result_type = list(/obj/item/clothing/head/armingcap)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/blueprint_recipe/sewing/headband
	name = "hat (headband)"
	result_type = list(/obj/item/clothing/head/headband)
	required_materials = list(/obj/item/natural/cloth = 1)

/datum/blueprint_recipe/sewing/strawhat
	name = "hat (straw)"
	result_type = list(/obj/item/clothing/head/strawhat)
	required_materials = list(/obj/item/natural/fibers = 3)
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/knitcap
	name = "hat (knit cap)"
	result_type = list(/obj/item/clothing/head/knitcap)
	required_materials = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/fancyhat
	name = "hat (fancy))"
	result_type = list(/obj/item/clothing/head/fancyhat)
	required_materials = list(/obj/item/natural/fibers = 1, /obj/item/natural/cloth = 2, /obj/item/natural/feather = 1)
	craftdiff = 4
	req_imperial = TRUE

/datum/blueprint_recipe/sewing/fancyhat/courtier
	name = "hat (courtier)"
	result_type = list(/obj/item/clothing/head/courtierhat)

/datum/blueprint_recipe/sewing/fancyhat/courtier
	name = "hat (bard)"
	result_type = list(/obj/item/clothing/head/bardhat)

/datum/blueprint_recipe/sewing/armingcap
	name = "hat (wizard)"
	result_type = list(/obj/item/clothing/head/wizhat)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/blueprint_recipe/sewing/takuhatsugasa
	name = "hat (takuhatsugasa)"
	result_type = list(/obj/item/clothing/head/takuhatsugasa)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/blueprint_recipe/sewing/torioigasa
	name = "hat (torioigasa)"
	result_type = list(/obj/item/clothing/head/tengai/torioigasa)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	req_islander = TRUE

/datum/blueprint_recipe/sewing/gasa
	name = "hat (gasa)"
	result_type = list(/obj/item/clothing/head/tengai/gasa)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/blueprint_recipe/sewing/sandogasa
	name = "hat (sandogasa)"
	result_type = list(/obj/item/clothing/head/tengai/sandogasa)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 3)
	craftdiff = 1
	req_islander = TRUE

/datum/blueprint_recipe/sewing/tengai
	name = "hat (tengai)"
	result_type = list(/obj/item/clothing/head/tengai)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 3)
	craftdiff = 1
	req_islander = TRUE

/datum/blueprint_recipe/sewing/roningasa
	name = "hat (roningasa)"
	result_type = list(/obj/item/clothing/head/tengai/roningasa)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	req_islander = TRUE

/datum/blueprint_recipe/sewing/zukin
	name = "hood (stealthy)"
	result_type = list(/obj/item/clothing/head/shinobi_zukin)
	required_materials = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_islander = TRUE

/datum/blueprint_recipe/sewing/onmyojigood
	name = "hat (war onmyoji)"
	result_type = list(/obj/item/clothing/head/wizhat/onmyoji)
	required_materials = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3
	req_islander = TRUE

/datum/blueprint_recipe/sewing/onmyojigoofy
	name = "hat (onmyoji)"
	result_type = list(/obj/item/clothing/head/wizhat/onmyoji/eboshi)
	required_materials = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3
	req_islander = TRUE


//////////////////////////////////////////
// Fogislander Cultured Crafting Area,  //
//////////////////////////////////////////


/datum/blueprint_recipe/sewing/yugake
	name = "gloves (yugake)"
	result_type = list(/obj/item/clothing/gloves/fingerless/yugake)
	required_materials = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/blueprint_recipe/sewing/hakama
	name = "pants (hakama)"
	result_type = list(/obj/item/clothing/pants/tights/hakama)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/blueprint_recipe/sewing/lillys
	name = "small lilly {fl}"
	result_type = list(/obj/item/clothing/head/lilly)
	required_materials = list(/obj/item/natural/fibers = 3)
	req_islander = TRUE

/datum/blueprint_recipe/sewing/lillym
	name = "medium lilly {fl}"
	result_type = list(/obj/item/clothing/head/lilly/medium)
	required_materials = list(/obj/item/natural/fibers = 4)
	req_islander = TRUE

/datum/blueprint_recipe/sewing/lillyb
	name = "big lilly {fl}"
	result_type = list(/obj/item/clothing/head/lilly/big)
	required_materials = list(/obj/item/natural/fibers = 5)
	req_islander = TRUE

/datum/blueprint_recipe/sewing/eyeband
	name = "eyeband"
	result_type = list(/obj/item/clothing/face/kaizoku/eyeband)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)


/*.............. recipes requiring skill 1 ..............*/


/datum/blueprint_recipe/sewing/soheicloth
	name = "sohei headcovering {fl}"
	result_type = list(/obj/item/clothing/head/soheicloth)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	req_islander = TRUE



/datum/blueprint_recipe/sewing/mino
	name = "mino cloak {fl}"
	result_type = list(/obj/item/clothing/cloak/raincloak/mino)
	required_materials = list(/obj/item/natural/fibers = 8,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	req_islander = TRUE

/datum/blueprint_recipe/sewing/tobi
	name = "tobi trousers {fl}"
	result_type = list(/obj/item/clothing/pants/trou/tobi)
	required_materials = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_islander = TRUE

/datum/blueprint_recipe/sewing/hitatare
	name = "light hitatare {fl}"
	result_type = list(/obj/item/clothing/armor/gambeson/light/hitatare)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_islander = TRUE

/*.............. recipes requiring skill 2 ..............*/

/datum/blueprint_recipe/sewing/ruankai
	name = "ruankai jacque {fl}"
	result_type = /obj/item/clothing/armor/gambeson/ruankai
	required_materials = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 2
	req_islander = TRUE

/datum/blueprint_recipe/sewing/jinbaori
	name = "jinbaori {fl}"
	result_type = list(/obj/item/clothing/cloak/stabard/haramaki/jinbaori)
	required_materials = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_islander = TRUE



/datum/blueprint_recipe/sewing/zubon
	name = "stealthy trousers {fl}"
	result_type = list(/obj/item/clothing/pants/trou/leather/shinobizubon)
	required_materials = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 2)
	craftdiff = 2
	req_islander = TRUE

/*.............. recipes requiring skill 3 ..............*/

/datum/blueprint_recipe/sewing/halfcloak
	name = "half cloak"
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	result_type = /obj/item/clothing/cloak/half/random
	craftdiff = 3

/datum/blueprint_recipe/sewing/guardiancape
	name = "guardianship cape {fl}"
	result_type = list(/obj/item/clothing/cloak/raincloak/guardiancloak)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	req_islander = TRUE

/datum/blueprint_recipe/sewing/onmyojigoofy
	name = "haramaki bellyband {fl}"
	result_type = list(/obj/item/clothing/cloak/stabard/haramaki)
	required_materials = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3
	req_islander = TRUE

/* .............. recipes requiring skill 4 ..............*/

/datum/blueprint_recipe/sewing/heartfelthat
	name = "heartfelt hat {fl}"
	result_type = list(/obj/item/clothing/head/bardhat/bloodhunter)
	required_materials = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	req_islander = TRUE

/datum/blueprint_recipe/sewing/odoshi
	name = "odoshi bodylacing {fl}"
	result_type = list(/obj/item/clothing/cloak/stabard/haramaki/odoshi)
	required_materials = list(/obj/item/natural/cloth = 5,
				/obj/item/natural/fibers = 3)
	craftdiff = 4
	req_islander = TRUE
