// ===================================================================
// This part of the code and sprites are NOT part of Kaizoku!
// These assets are from Zeratino and Cre!
// If you fellows desire to use these assets anywhere else, ask them! Not me.
// I got permission from Zeratino, so we're balling.
// -Monochrome9090
// ===================================================================

/obj/item/weapon/sword/rapier/muqian //BUGGED
	name = "iron chokuto"
	desc = "A straight zatana for vertical combat on the towering labyrinths Muqians call home. \
	This one is cheap, made of iron, with high degree of contrasting soft-to-hard metal to avoid breaking."
	icon_state = "eastsword1"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/32.dmi'
	force = 12
	force_wielded = 25
	possible_item_intents = list(
		/datum/intent/sword/chop,
		/datum/intent/sword/strike,
	)
	gripped_intents = list(
		/datum/intent/sword/thrust/estoc,
		/datum/intent/sword/lunge,
		/datum/intent/sword/chop,
		/datum/intent/sword/strike,
	)
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	minstr = 8
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/swords
	max_blade_int = 300
	wdefense = GREAT_PARRY
	wbalance = DODGE_CHANCE_NORMAL

/obj/item/weapon/sword/muqian //essentially a rapier. Didn't pathed it as one because transfering 64.dmi to 32.dmi is bugged as hell.
	name = "steel chokuto"
	desc = "A straight zatana for vertical combat on the towering labyrinths Muqians call home. \
	This one is made of steel and have riveting edges along its blade."
	icon_state = "eastsword2"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/32.dmi'
	possible_item_intents = list(/datum/intent/sword/thrust/rapier, /datum/intent/sword/cut/rapier)
	parrysound = list('sound/combat/parry/bladed/bladedthin (1).ogg', 'sound/combat/parry/bladed/bladedthin (2).ogg', 'sound/combat/parry/bladed/bladedthin (3).ogg')
	gripped_intents = null
	swingsound = ZATANA_WOOSH
	parrysound = "rapier"
	minstr = 6
	wbalance = VERY_HARD_TO_DODGE

/obj/item/weapon/sword/muqian/decorated //BUGGED
	name = "decorated chokuto"
	desc = "A straight uchiganata for vertical combat on the towering labyrinths Muqians call home. \
	This one is made of steel and imbued in gold. Proper for a Muqian lord."
	icon_state = "eastsword3"

/obj/item/clothing/armor/leather/jacket/eastsuit1
	name = "haori robe"
	desc = "The short coat usually worn over a kimono, adorned with white lapels."
	icon_state = "eastsuit1"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites_sleeves.dmi'

/obj/item/clothing/armor/leather/jacket/eastsuit2
	name = "michiyuki robe"
	desc = "A thick overcoat commonly used by islanders for travelling on damp bogs with thorny bushes."
	icon_state = "eastsuit2"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites_sleeves.dmi'

/obj/item/clothing/armor/leather/jacket/eastsuit3
	name = "dobuku robe"
	desc = "A robe usually worn by aristocrats of the lower caste."
	icon_state = "eastsuit3"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites_sleeves.dmi'

/obj/item/clothing/armor/leather/jacket/susohiki
	name = "susohiki attire"
	desc = "Charmful, delicate and ornamented robe, worn by geishas and foglander performers of all kinds."
	icon_state = "eastsuit4"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites_sleeves.dmi'

/obj/item/clothing/cloak/curator
	name = "curator cloak"
	desc = "A rawhide coat used by the Abyssanctum Curators on the back, replacing a more expensive cloak as a symbol of humbleness. Sadly, the unruly does the same."
	color = null
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	icon_state = "eastcloak2"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites_sleeves.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = FALSE
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK

/obj/item/clothing/cloak/eastcloak2
	name = "unruly backcoat"
	desc = "A common leather coat with white whirls recognized for being a gangster symbol, 'for the unruly', or spoiled brats trying to mimic Curators ways of dressing."
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	color = null
	icon_state = "eastcloak1"
	sleevetype = "shirt"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'

/obj/item/clothing/gloves/leather/eastgloves1
	name = "black gloves"
	desc = "Sleek gloves for swordsmen that covers the hands and wrist."
	icon_state = "eastgloves1"
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleevetype = "shirt"

/obj/item/clothing/gloves/leather/eastgloves2
	name = "abyssanctum armwrappers"
	desc = "Thick leather wraps that extends to cover one arm, while keeping the other covering only the wrist. Symbol of a tideweaver on duty for recognization ease."
	icon_state = "eastgloves2"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'

/obj/item/clothing/head/takuhatsugasa/easthat
	name = "worn bamboo hat"
	desc = "A bamboo hat damaged by time. However, it is slightly protective."
	icon_state = "easthat"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sewrepair = TRUE
	flags_inv = HIDEEARS
	armor = ARMOR_PADDED_GOOD
	body_parts_covered = HEAD|HAIR|EARS
	prevent_crits =  MINOR_CRITICALS
	max_integrity = INTEGRITY_WORST

/obj/item/clothing/pants/trou/leather/eastpants1
	name = "ascetical pants"
	desc = "Islander ascetical pants, used by Abyssanctum."
	icon_state = "eastpants1"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites_sleeves.dmi'

/obj/item/clothing/pants/trou/leather/eastpants2
	name = "ripped pants"
	desc = "This islander pants had its better days."
	icon_state = "eastpants2"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites_sleeves.dmi'

/obj/item/ammo_holder/cscabbard
	name = "iron chokuto scabbard"
	icon_state = "simplescab0"
	item_state = "simplescab"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/32.dmi'
	desc = "Sturdy scabbard for batting away blows, made in lacquered iron and leather to endure fierce impacts."
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK
	max_storage = 1
	ammo_type = list (/obj/item/weapon/sword/rapier/muqian)
	sharpness = IS_BLUNT
	wlength = WLENGTH_SHORT
	resistance_flags = FLAMMABLE
	can_parry = TRUE
	wdefense = ULTMATE_PARRY //Parry more than a shield. Less integrity than a shield.
	parrysound = "parrywood"
	attacked_sound = "parrywood"
	max_integrity = 80
	blade_dulling = DULLING_BASHCHOP
	anvilrepair = /datum/skill/craft/blacksmithing
	COOLDOWN_DECLARE(shield_bang)
	w_class = WEIGHT_CLASS_BULKY

/obj/item/ammo_holder/cscabbard/scscabbard
	name = "steel chokuto scabbard"
	icon_state = "steelscab0"
	item_state = "steelscab"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/32.dmi'
	desc = "Sturdy scabbard for batting away blows, made in lacquered steel and leather to endure fierce impacts."
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK
	max_storage = 1
	ammo_type = list (/obj/item/weapon/sword/muqian)
	max_integrity = 160

/obj/item/ammo_holder/cscabbard/dcscabbard
	name = "decorated chokuto scabbard"
	icon_state = "goldscab0"
	item_state = "goldscab"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/32.dmi'
	desc = "Ornate scabbard for batting away blows, made in lacquered steel and leather to endure fierce impacts."
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK
	max_storage = 1
	ammo_type = list (/obj/item/weapon/sword/muqian/decorated)
	max_integrity = 160

/obj/item/clothing/suit/roguetown/shirt/eastshirt1
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "battle shirt"
	desc = "The black shirt typically used recognized to be part of Fog Island's military attire, with cloth covering the face. Usually replaced with stiffer clothing."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "eastshirt1"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites_sleeves.dmi'
	boobed = TRUE

/obj/item/clothing/suit/roguetown/shirt/eastshirt2
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "sea erudite shirt"
	desc = "Simplified, patterned outfit used by Abyssanctum battle monks."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "eastshirt2"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites_sleeves.dmi'
	boobed = TRUE

/obj/item/clothing/shoes/boots/cresandal
	name = "raised sandals"
	desc = "A pair of wooden and leather sandals that raise you off the ground." //no mobsprites
	icon_state = "eastsandals"
	icon = 'modular/stonekeep/kaizoku/zeratino&cre/iconsprites.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	sleeved = 'modular/stonekeep/kaizoku/zeratino&cre/mobsprites.dmi'
	armor = list("blunt" = 10, "slash" = 10, "stab" = 10,  "piercing" = 5, "fire" = 0, "acid" = 0)

/obj/item/ammo_holder/cscabbard/scscabbard/loaded/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/weapon/sword/muqian/A = new(src)
		ammo_list += A
	update_icon()
