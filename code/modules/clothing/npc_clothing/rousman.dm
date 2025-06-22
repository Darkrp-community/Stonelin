/obj/item/clothing/head/helmet/rousman
	name = "inhumen iron helmet"
	icon_state = "rousman-ironhat_item"
	item_state = "rousman-ironhat"
	smeltresult = /obj/item/ingot/iron
	icon = 'icons/roguetown/mob/monster/rousman.dmi'
	allowed_race = list("rousman")
	armor = list("blunt" = 80, "slash" = 80, "stab" = 80,  "piercing" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|EARS|HAIR|EYES
	sellprice = 10

/obj/item/clothing/neck/coif/cloth/rousman
	name = "padded headwrap"
	desc = "A simple and stinky headwrap."
	icon = 'icons/roguetown/mob/monster/rousman.dmi'
	allowed_race = list("rousman")
	icon_state = "rousman_headwrap_item"
	item_state = "rousman_headwrap"

/obj/item/clothing/armor/cuirass/iron/rousman
	name = "inhumen plate armor"
	icon_state = "rousman_ironplate_item"
	item_state = "rousman_ironplate"
	icon = 'icons/roguetown/mob/monster/rousman.dmi'
	smeltresult = /obj/item/ingot/iron
	armor = list("blunt" = 80, "slash" = 80, "stab" = 80,  "piercing" = 0, "fire" = 0, "acid" = 0)
	allowed_race = list("rousman")
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	anvilrepair = /datum/skill/craft/armorsmithing
	max_integrity = 100//nearly iron tier
	armor_class = AC_LIGHT
	sellprice = 10

/obj/item/clothing/head/helmet/rousman/splint
	name = "inhumen splint helmet"
	icon_state = "rousman_splinthead_item"
	item_state = "rousman_splinthead"
	smeltresult = /obj/item/ingot/iron
	icon = 'icons/roguetown/mob/monster/rousman.dmi'
	allowed_race = list("rousman")
	armor = list("blunt" = 50, "slash" = 50, "stab" = 50,  "piercing" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|EARS|HAIR|EYES
	sellprice = 6

/obj/item/clothing/armor/cuirass/iron/rousman/splint
	name = "inhumen splint dress"
	icon_state = "rousman_splintdress_item"
	item_state = "rousman_splintdress"
	icon = 'icons/roguetown/mob/monster/rousman.dmi'
	smeltresult = /obj/item/ingot/iron
	armor = list("blunt" = 50, "slash" = 50, "stab" = 50,  "piercing" = 0, "fire" = 0, "acid" = 0)
	allowed_race = list("rousman")
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	anvilrepair = /datum/skill/craft/armorsmithing
	max_integrity = 60
	armor_class = AC_LIGHT
	sellprice = 10

/obj/item/clothing/armor/leather/hide/rousman
	name = "rousman loincloth"
	icon_state = "rousman_loincloth_item"
	item_state = "rousman_loincloth"
	icon = 'icons/roguetown/mob/monster/rousman.dmi'
	allowed_race = list("rousman")
	armor = list("blunt" = 30, "slash" = 30, "stab" = 30,  "piercing" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN
	sellprice = 0
	smeltresult = /obj/item/ash

//KAIZOKU ROUSMEN (robbed gear)
/obj/item/clothing/armor/cuirass/iron/rousman/kaizoku
	name = "zamurous armor"
	icon_state = "zamurous_item"
	item_state = "zamurous"
	icon = 'icons/roguetown/mob/monster/rousman.dmi'

/obj/item/clothing/head/helmet/rousman/kaizoku
	name = "rousmubuto"
	icon_state = "rousmubuto_item"
	item_state = "rousmubuto"
