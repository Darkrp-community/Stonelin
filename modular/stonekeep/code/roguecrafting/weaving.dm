/* WEAVING	-	sewing skill
==========================================================*/
// The only ingridients these recipes can require is SILK and CLOTH
// They all require a loom

/datum/blueprint_recipe/weaving
	skillcraft = /datum/skill/misc/sewing
	required_materials = list(/obj/item/natural/silk = 2)
	craftdiff = 1

/*========= SKILL LEVEL: 1 REQUIRED ==========*/

/datum/blueprint_recipe/weaving/rags
	name = "shirt (webbed)"
	result_type = list(/obj/item/clothing/shirt/undershirt/webs)

/datum/blueprint_recipe/weaving/webbing
	name = "trousers (webbed leggings)"
	result_type = list(/obj/item/clothing/pants/webs)

/datum/blueprint_recipe/weaving/shepardmask
	name = "mask (silk)"
	result_type = list(/obj/item/clothing/face/shepherd)
	required_materials = list(/obj/item/natural/silk = 1)


/*========= SKILL LEVEL: 2 REQUIRED ==========*/

/* craftdif of 2 = APPRENTICE */


/datum/blueprint_recipe/weaving/shadowgloves
	name = "gloves (shadow)"
	result_type = list(/obj/item/clothing/gloves/fingerless/shadowgloves)
	required_materials = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/blueprint_recipe/weaving/cloak
	name = "cloak (silk half cloak)"
	result_type = list(/obj/item/clothing/cloak/half)
	craftdiff = 2

/datum/blueprint_recipe/weaving/bathrobe
	name = "bathrobe"
	result_type = list(/obj/item/clothing/shirt/robe/bath)
	required_materials = list(/obj/item/natural/silk = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2

/datum/blueprint_recipe/weaving/mundies
	name = "masculine smallclothes"
	result_type = list(/obj/item/undies)
	craftdiff = 2

/datum/blueprint_recipe/weaving/fundies
	name = "feminine smallclothes"
	result_type = list(/obj/item/undies/f)
	craftdiff = 2

/datum/blueprint_recipe/weaving/chaperonesilk
	name = "hat (chaperone)"
	result_type = list(/obj/item/clothing/head/chaperon/colored/greyscale/silk)
	required_materials = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 2)
	craftdiff = 4

/datum/blueprint_recipe/weaving/shadowcloak
	name = "cloak (shadow)"
	result_type = list(/obj/item/clothing/cloak/half/shadowcloak)
	required_materials = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 2)
	craftdiff = 4

/datum/blueprint_recipe/weaving/shadowshirt
	name = "shirt (shadow)"
	result_type = list(/obj/item/clothing/shirt/shadowshirt)
	required_materials = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 2)
	craftdiff = 4

/datum/blueprint_recipe/weaving/shadowpants
	name = "trousers (shadow)"
	result_type = list(/obj/item/clothing/pants/trou/shadowpants)
	required_materials = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 2)
	craftdiff = 4



/*========= SKILL LEVEL: 3 REQUIRED ==========*/

/datum/blueprint_recipe/weaving/shirt
	name = "shirt (formal silks)"
	result_type = list(/obj/item/clothing/shirt/undershirt/puritan)
	craftdiff = 3

/datum/blueprint_recipe/weaving/silkdress
	name = "dress (chemise)"
	result_type = list (/obj/item/clothing/shirt/dress/silkdress/colored/random)
	craftdiff = 3

/datum/blueprint_recipe/weaving/barmaid
	name = "dress (innkeep)"
	result_type = list (/obj/item/clothing/shirt/dress)
	craftdiff = 3

/datum/blueprint_recipe/weaving/valorian
	name = "dress (valorian)"
	result_type = list(/obj/item/clothing/shirt/dress/valorian)
	craftdiff = 3

/datum/blueprint_recipe/weaving/silkpantaloons
	name = "trousers (silk pantaloons)"
	result_type = list (/obj/item/clothing/pants/pantaloons/random)
	craftdiff = 3

/datum/blueprint_recipe/weaving/cape_silk
	name = "cloak (silk cape)"
	result_type = list(/obj/item/clothing/cloak/cape/silk/random)
	required_materials = list(/obj/item/natural/silk = 3)
	craftdiff = 3


/*========= SKILL LEVEL: 4 REQUIRED ==========*/

/datum/blueprint_recipe/weaving/silkcoat
	name = "armor (silk coat)"
	result_type = list (/obj/item/clothing/armor/leather/jacket/silk_coat)
	required_materials = list(/obj/item/natural/silk = 4,
				/obj/item/natural/cloth = 1)
	craftdiff = 4

/datum/blueprint_recipe/weaving/armordress
	name = "armor (padded dress)"
	result_type = /obj/item/clothing/armor/gambeson/heavy/dress
	required_materials = list(/obj/item/natural/silk = 4,
				/obj/item/natural/cloth = 1)
	craftdiff = 4

/datum/blueprint_recipe/weaving/eorastraps
	name = "robe (eora straps)"
	result_type = list(/obj/item/clothing/shirt/robe/eora)
	required_materials = list(/obj/item/natural/silk = 3)
	craftdiff = 4

/*========= SKILL LEVEL: 5 REQUIRED ==========*/

/datum/blueprint_recipe/weaving/lordcloak
	name = "cloak (lord)"
	result_type = list(/obj/item/clothing/cloak/lordcloak)
	required_materials = list(/obj/item/natural/fur = 2,
				/obj/item/natural/silk = 4)
	craftdiff = 5


/datum/blueprint_recipe/weaving/gown
	name = "gown (spring)"
	result_type = /obj/item/clothing/shirt/dress/gown
	required_materials = list(/obj/item/natural/silk = 4)
	craftdiff = 4

/datum/blueprint_recipe/weaving/gown/summer
	name = "gown (summer)"
	result_type = /obj/item/clothing/shirt/dress/gown/summergown

/datum/blueprint_recipe/weaving/gown/fall
	name = "gown (fall)"
	result_type = /obj/item/clothing/shirt/dress/gown/fallgown

/datum/blueprint_recipe/weaving/gown/winter
	name = "gown (winter)"
	result_type = /obj/item/clothing/shirt/dress/gown/wintergown
	required_materials = list(/obj/item/natural/silk = 3,
				/obj/item/natural/fur/cabbit = 1)

