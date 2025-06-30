// Start of vertical gates
/obj/structure/gate/vertical
	icon = 'icons/roguetown/misc/gatevertical.dmi'
	icon_state = ""
	bound_width = 32
	bound_height = 96
	base_state = ""

/obj/structure/gate/vertical/right
	icon_state = "gateright1"
	base_state = "gateright"

/obj/structure/gate/vertical/right/preopen
	icon_state = "gateright0"

/obj/structure/gate/vertical/right/preopen/Initialize()
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(open))

/obj/structure/gate/vertical/left
	icon_state = "gateleft1"
	base_state = "gateleft"

/obj/structure/gate/vertical/left/preopen
	icon_state = "gateleft0"

/obj/structure/gate/vertical/left/preopen/Initialize()
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(open))

/obj/structure/gate/vertical/bars
	icon_state = ""
	base_state = ""
	opacity = FALSE

/obj/structure/gate/vertical/bars/right
	icon_state = "barright1"
	base_state = "barright"

/obj/structure/gate/vertical/bars/right/preopen
	icon_state = "barright0"

/obj/structure/gate/vertical/bars/right/preopen/Initialize()
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(open))

/obj/structure/gate/vertical/bars/left
	icon_state = "barleft1"
	base_state = "barleft"

/obj/structure/gate/vertical/bars/left/preopen
	icon_state = "barleft0"

/obj/structure/gate/vertical/bars/left/preopen/Initialize()
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(open))
