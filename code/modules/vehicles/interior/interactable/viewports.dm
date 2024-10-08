/obj/structure/interior_viewport
	name = "External Cameras Terminal"
	desc = "A small terminal connected to the external cameras of a vehicle, allowing a 360-degree visual survey of vehicle surroundings."
	icon = 'icons/obj/vehicles/interiors/general.dmi'
	icon_state = "viewport"
	layer = INTERIOR_DOOR_LAYER

	unacidable = TRUE
	unslashable = TRUE
	indestructible = TRUE

	// The vehicle this seat is tied to
	var/obj/vehicle/multitile/vehicle = null

/obj/structure/interior_viewport/ex_act()
	return

/obj/structure/interior_viewport/attack_hand(mob/M)
	if(!vehicle)
		return

	M.reset_view(vehicle)
	give_action(M, /datum/action/human_action/vehicle_unbuckle)

/obj/structure/interior_viewport/simple
	name = "viewport"
	desc = "Hey, I can see my base from here!"
	icon_state = "viewport_simple"

//van's frontal window viewport
/obj/structure/interior_viewport/simple/windshield
	name = "windshield"
	desc = "When it was cleaned last time? There is a squashed bug in the corner."
	icon = 'icons/obj/vehicles/interiors/van.dmi'
	icon_state = "windshield_viewport_top"
	alpha = 80

//anti-air APC's interior console
/obj/structure/interior_viewport/terminal
	name = "External Cameras Terminal"
	desc = "A terminal hooked up to the various sensors of the M579 ADS-C, featuring plenty of flashing buttons and whooping alarms alongside a more rudimentary external-view system."
	icon_state = "viewport_terminal"
