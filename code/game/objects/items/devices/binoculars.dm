/obj/item/device/binoculars
	name = "binoculars"
	gender = PLURAL
	desc = "A military-issued pair of binoculars."
	icon = 'icons/obj/items/binoculars.dmi'
	icon_state = "binoculars"
	pickup_sound = 'sound/handling/wirecutter_pickup.ogg'
	drop_sound = 'sound/handling/wirecutter_drop.ogg'
	flags_atom = FPRINT|CONDUCT
	force = 5
	w_class = SIZE_SMALL
	throwforce = 5
	throw_range = 15
	throw_speed = SPEED_VERY_FAST
	/// If FALSE won't change icon_state to a camo marine bino.
	var/uses_camo = FALSE
	var/zoom_offset = 11
	var/view_range = 12


	//matter = list("metal" = 50,"glass" = 50)

/obj/item/device/binoculars/Initialize()
	. = ..()
	if(!uses_camo)
		return
	select_gamemode_skin(type)

/obj/item/device/binoculars/attack_self(mob/user)
	..()

	if(SEND_SIGNAL(user, COMSIG_BINOCULAR_ATTACK_SELF, src))
		return

	zoom(user, zoom_offset, view_range)

/obj/item/device/binoculars/dropped(/obj/item/item, mob/user)
	. = ..()
	on_unset_interaction(user)

/obj/item/device/binoculars/on_set_interaction(mob/user)
	flags_atom |= RELAY_CLICK
	RegisterSignal(user, COMSIG_HUMAN_MOVEMENT_CANCEL_INTERACTION, PROC_REF(interaction_handler))

/obj/item/device/binoculars/on_unset_interaction(mob/user)
	flags_atom &= ~RELAY_CLICK
	UnregisterSignal(user, COMSIG_HUMAN_MOVEMENT_CANCEL_INTERACTION)

/obj/item/device/binoculars/proc/interaction_handler()
	return COMPONENT_HUMAN_MOVEMENT_KEEP_USING

/obj/item/device/binoculars/civ
	desc = "A pair of binoculars."
	icon_state = "binoculars_civ"
	uses_camo = FALSE

//RANGEFINDER with ability to acquire coordinates
/obj/item/device/binoculars/range
	name = "rangefinder"
	gender = NEUTER
	desc = "A pair of binoculars with a rangefinding function. Ctrl + Click turf to acquire it's coordinates. Ctrl + Click rangefinder to stop lasing."
	icon_state = "rangefinder"
	var/laser_cooldown = 0
	var/cooldown_duration = 200 //20 seconds
	var/obj/effect/overlay/temp/laser_coordinate/coord
	var/target_acquisition_delay = 100 //10 seconds
	var/rangefinder_popup = TRUE //Whether coordinates are displayed in a separate popup window.
	var/last_x = "UNKNOWN"
	var/last_y = "UNKNOWN"

	/// Normally used for the small green dot signifying coordinations-obtaining mode.
	var/range_laser_overlay = "laser_range"

/obj/item/device/binoculars/range/Initialize()
	. = ..()
	update_icon()

/obj/item/device/binoculars/range/Destroy()
	QDEL_NULL(coord)
	. = ..()

/obj/item/device/binoculars/range/update_icon()
	overlays += range_laser_overlay

/obj/item/device/binoculars/range/get_examine_text(mob/user)
	. = ..()
	. += SPAN_NOTICE(FONT_SIZE_LARGE("The rangefinder reads: LONGITUDE [last_x], LATITUDE [last_y]."))

/obj/item/device/binoculars/range/verb/toggle_rangefinder_popup()
	set name = "Toggle Rangefinder Display"
	set category = "Object"
	set desc = "Toggles display mode for rangefinder coordinates."
	set src in usr
	rangefinder_popup = !rangefinder_popup
	to_chat(usr, "The rangefinder [rangefinder_popup ? "now" : "no longer"] shows coordinates on the display.")

/obj/item/device/binoculars/range/on_unset_interaction(mob/user)
	..()
	if(user && coord && !zoom)
		QDEL_NULL(coord)

/obj/item/device/binoculars/range/clicked(mob/user, list/mods)
	if(mods[CTRL_CLICK])
		if(!CAN_PICKUP(user, src))
			return ..()
		stop_targeting(user)
		return TRUE
	return ..()

/obj/item/device/binoculars/range/handle_click(mob/living/carbon/human/user, atom/targeted_atom, list/mods)
	if(!istype(user))
		return
	if(mods[CTRL_CLICK])
		if(user.stat != CONSCIOUS)
			to_chat(user, SPAN_WARNING("You cannot use [src] while incapacitated."))
			return FALSE
		if(SEND_SIGNAL(user, COMSIG_BINOCULAR_HANDLE_CLICK, src))
			return FALSE
		if(mods[CLICK_CATCHER])
			return FALSE
		if(user.z != targeted_atom.z && !coord)
			to_chat(user, SPAN_WARNING("You cannot get a direct laser from where you are."))
			return FALSE
		if(user.sight & SEE_TURFS)
			var/list/turf/path = get_line(user, targeted_atom, include_start_atom = FALSE)
			for(var/turf/T in path)
				if(T.opacity)
					to_chat(user, SPAN_WARNING("There is something in the way of the laser!"))
					return FALSE
		acquire_target(targeted_atom, user)
		return TRUE
	return FALSE

/obj/item/device/binoculars/range/proc/stop_targeting(mob/living/carbon/human/user)
	if(coord)
		QDEL_NULL(coord)
		to_chat(user, SPAN_WARNING("You stop lasing."))

/obj/item/device/binoculars/range/proc/acquire_target(atom/targeted_atom, mob/living/carbon/human/user)
	set waitfor = 0

	if(coord)
		to_chat(user, SPAN_WARNING("You're already targeting something."))
		return
	if(world.time < laser_cooldown)
		to_chat(user, SPAN_WARNING("[src]'s laser battery is recharging."))
		return

	var/acquisition_time = target_acquisition_delay
	if(user.skills)
		acquisition_time = max(15, acquisition_time - 25*user.skills.get_skill_level(SKILL_JTAC))

	var/datum/squad/S = user.assigned_squad

	var/las_name = ""
	if(S)
		las_name = S.name

	// Safety check - prevent targeting items in containers (notably your equipment/inventory)
	if(targeted_atom.z == 0)
		return

	var/turf/TU = get_turf(targeted_atom)
	if(!istype(TU) || user.action_busy)
		return
	playsound(src, 'sound/effects/nightvision.ogg', 35)
	to_chat(user, SPAN_NOTICE("INITIATING LASER TARGETING. Stand still."))
	if(!do_after(user, acquisition_time, INTERRUPT_ALL, BUSY_ICON_GENERIC) || world.time < laser_cooldown)
		return
	var/obj/effect/overlay/temp/laser_coordinate/LT = new (TU, las_name, user)
	coord = LT
	last_x = obfuscate_x(coord.x)
	last_y = obfuscate_y(coord.y)
	playsound(src, 'sound/effects/binoctarget.ogg', 35)
	show_coords(user)
	while(coord)
		if(!do_after(user, 30, INTERRUPT_ALL, BUSY_ICON_GENERIC))
			QDEL_NULL(coord)
			break

/obj/item/device/binoculars/range/proc/show_coords(mob/user)
	if(rangefinder_popup)
		tgui_interact(user)
	else
		to_chat(user, SPAN_NOTICE(FONT_SIZE_LARGE("SIMPLIFIED COORDINATES OF TARGET. LONGITUDE [last_x]. LATITUDE [last_y].")))

/obj/item/device/binoculars/range/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Binoculars", "[src.name]")
		ui.open()

/obj/item/device/binoculars/range/ui_state(mob/user)
	return GLOB.inventory_state

/obj/item/device/binoculars/range/ui_data(mob/user)
	var/list/data = list()

	data["xcoord"] = src.last_x
	data["ycoord"] = src.last_y

	return data

//LASER DESIGNATOR with ability to acquire coordinates and CAS lasing support
/obj/item/device/binoculars/range/designator
	name = "laser designator"
	desc = "A laser designator with two modes: target marking for CAS with IR laser and rangefinding. Ctrl + Click turf to target something. Ctrl + Click designator to stop lasing. Alt + Click designator to switch modes."
	var/obj/effect/overlay/temp/laser_target/laser
	var/range_mode = 0 //Able to be switched between modes, 0 for cas laser, 1 for finding coordinates.
	var/tracking_id //a set tracking id used for CAS

	/// Normally used for the red CAS dot overlay.
	var/cas_laser_overlay = "laser_cas"

	var/list/connected_himats = list()
	var/himat_id = 1
	var/barrage_mode = FALSE

	actions_types = list(/datum/action/item_action/fire_himat, /datum/action/item_action/switch_himat, /datum/action/item_action/himat_barrage)
	var/list/actions_list = list(/datum/action/item_action/fire_himat, /datum/action/item_action/switch_himat, /datum/action/item_action/himat_barrage)

/obj/item/device/binoculars/range/designator/Initialize()
	. = ..()
	tracking_id = ++GLOB.cas_tracking_id_increment

/obj/item/device/binoculars/range/designator/Destroy()
	QDEL_NULL(laser)
	QDEL_NULL(coord)
	. = ..()

/obj/item/device/binoculars/range/designator/update_icon()
	if(range_mode)
		overlays += range_laser_overlay
	else
		overlays += cas_laser_overlay

/obj/item/device/binoculars/range/designator/get_examine_text(mob/user)
	. = ..()
	. += SPAN_NOTICE("Tracking ID for CAS: [tracking_id].")
	. += SPAN_NOTICE("[src] is currently set to [range_mode ? "range finder" : "CAS marking"] mode.")

/obj/item/device/binoculars/range/designator/clicked(mob/user, list/mods)
	if(mods[ALT_CLICK])
		if(!CAN_PICKUP(user, src))
			return ..()
		toggle_bino_mode(user)
		return TRUE
	return ..()

/obj/item/device/binoculars/range/designator/stop_targeting(mob/living/carbon/human/user)
	..()
	if(laser)
		QDEL_NULL(laser)
		to_chat(user, SPAN_WARNING("You stop lasing."))

/obj/item/device/binoculars/range/designator/attackby(obj/item/item, mob/user)
	if(HAS_TRAIT(item, TRAIT_TOOL_MULTITOOL))
		to_chat(user, SPAN_WARNING("You begin flushing connection data..."))
		if(do_after(user, 2 SECONDS, INTERRUPT_ALL, BUSY_ICON_HOSTILE))
			connected_himats.Cut()
		to_chat(user, SPAN_WARNING("You successfully flush connection data."))

/obj/item/device/binoculars/range/designator/verb/toggle_mode()
	set category = "Object"
	set name = "Toggle Laser Mode"
	set desc = "Toggles laser mode of laser designator between rangefinding and lasing for CAS"
	set src in usr
	if(!ishuman(usr))
		return
	toggle_bino_mode(usr)

/obj/item/device/binoculars/range/designator/proc/toggle_bino_mode(mob/user)
	if(user.action_busy || laser || coord)
		return

	range_mode = !range_mode
	to_chat(user, SPAN_NOTICE("You switch [src] to [range_mode? "range finder" : "CAS marking"] mode."))
	update_icon()
	playsound(usr, 'sound/machines/click.ogg', 15, 1)

/obj/item/device/binoculars/range/designator/on_unset_interaction(mob/user)
	..()

	if(user && (laser || coord) && !zoom)
		if(laser)
			qdel(laser)
		if(coord)
			qdel(coord)

/obj/item/device/binoculars/range/designator/acquire_target(atom/targeted_atom, mob/living/carbon/human/user)
	set waitfor = 0

	if(laser || coord)
		to_chat(user, SPAN_WARNING("You're already targeting something."))
		return

	if(world.time < laser_cooldown)
		to_chat(user, SPAN_WARNING("[src]'s laser battery is recharging."))
		return

	var/acquisition_time = target_acquisition_delay
	if(user.skills)
		acquisition_time = max(15, acquisition_time - 25*user.skills.get_skill_level(SKILL_JTAC))

	var/datum/squad/S = user.assigned_squad

	var/las_name
	if(S)
		las_name = S.name
	else
		las_name = "X"
	las_name = las_name + "-[tracking_id]"

	// Safety check - prevent targeting atoms in containers (notably your equipment/inventory)
	if(targeted_atom.z == 0)
		return

	var/turf/TU = get_turf(targeted_atom)
	var/area/targ_area = get_area(targeted_atom)
	var/area/user_area = get_area(user) // Surely future-tech lets the the designator calculate C if it can get eyes on the dropship above too
	if(!istype(TU)) return
	var/is_outside = FALSE
	switch(targ_area.ceiling)
		if(CEILING_NONE)
			is_outside = TRUE
		if(CEILING_GLASS)
			is_outside = TRUE
	switch(user_area.ceiling)
		if(CEILING_NONE)
			is_outside = TRUE
		if(CEILING_GLASS)
			is_outside = TRUE

	if (protected_by_pylon(TURF_PROTECTION_CAS, TU))
		is_outside = FALSE

	if(!is_outside && !range_mode) //rangefinding works regardless of ceiling
		to_chat(user, SPAN_WARNING("INVALID TARGET: target or user must be visible from high altitude."))
		return
	if(user.action_busy)
		return
	playsound(src, 'sound/effects/nightvision.ogg', 35)
	to_chat(user, SPAN_NOTICE("INITIATING LASER TARGETING. Stand still."))
	if(!do_after(user, acquisition_time, INTERRUPT_ALL, BUSY_ICON_GENERIC) || world.time < laser_cooldown || laser)
		return
	if(range_mode)
		var/obj/effect/overlay/temp/laser_coordinate/LT = new (TU, las_name, user)
		coord = LT
		last_x = obfuscate_x(coord.x)
		last_y = obfuscate_y(coord.y)
		show_coords(user)
		playsound(src, 'sound/effects/binoctarget.ogg', 35)
		while(coord)
			if(!do_after(user, 30, INTERRUPT_ALL, BUSY_ICON_GENERIC))
				QDEL_NULL(coord)
				break
	else
		to_chat(user, SPAN_NOTICE("TARGET ACQUIRED. LASER TARGETING IS ONLINE. DON'T MOVE."))
		var/obj/effect/overlay/temp/laser_target/LT = new (TU, las_name, user, tracking_id)
		laser = LT

		var/turf/userloc = get_turf(user)
		msg_admin_niche("Laser target [las_name] has been designated by [key_name(user, 1)] at ([TU.x], [TU.y], [TU.z]). [ADMIN_JMP(userloc)]")
		log_game("Laser target [las_name] has been designated by [key_name(user, 1)] at ([TU.x], [TU.y], [TU.z]).")

		playsound(src, 'sound/effects/binoctarget.ogg', 35)
		while(laser)
			if(!do_after(user, 30, INTERRUPT_ALL, BUSY_ICON_GENERIC))
				QDEL_NULL(laser)
				break

/datum/action/item_action/fire_himat/New(Target, obj/item/holder)
	. = ..()
	name = "Fire HIMATs"
	action_icon_state = "designator_mortar"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/fire_himat/action_activate()
	. = ..()
	var/obj/item/device/binoculars/range/designator/desig = holder_item
	var/howmanyhimats = 0
	if(!desig.range_mode && desig.laser && desig.connected_himats.len)
		if(desig.barrage_mode)
			for(var/obj/structure/mortar/himat/himat in desig.connected_himats)
				if(himat.handle_shell(get_turf(desig.laser), himat.loaded_shell))
					howmanyhimats++
			to_chat(usr, SPAN_NOTICE("Command sent. Fired: [howmanyhimats] shells."))
		else
			var/obj/structure/mortar/himat/himat = desig.connected_himats[desig.himat_id]
			if(himat.handle_shell(get_turf(desig.laser), himat.loaded_shell))
				to_chat(usr, SPAN_NOTICE("Command sent. Fired: HIMAT [himat.id]."))

/datum/action/item_action/switch_himat/New(Target, obj/item/holder)
	. = ..()
	name = "Switch HIMAT"
	action_icon_state = "designator_swap_mortar"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/switch_himat/action_activate()
	. = ..()
	var/obj/item/device/binoculars/range/designator/desig = holder_item
	desig.himat_id++
	if(desig.himat_id > desig.connected_himats.len)
		desig.himat_id = 1
	var/obj/structure/mortar/himat/selected_himat = desig.connected_himats[desig.himat_id]
	to_chat(usr, SPAN_NOTICE("Selected HIMAT ID: [selected_himat.id]"))

/datum/action/item_action/himat_barrage/New(Target, obj/item/holder)
	. = ..()
	name = "Switch Barrage Mode"
	action_icon_state = "designator_one_weapon"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/himat_barrage/action_activate()
	. = ..()
	var/obj/item/device/binoculars/range/designator/desig = holder_item
	desig.barrage_mode = !desig.barrage_mode
	button.overlays.Cut()
	if(desig.barrage_mode)
		action_icon_state = "designator_all_weapons"
	else
		action_icon_state = "designator_one_weapon"
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)
/obj/item/device/binoculars/range/designator/upp

	icon_state = "binoculars_upp_alt"
	cas_laser_overlay = "binoculars_laser_civ"
	range_laser_overlay = "binoculars_range_civ"

//pve binocs
/obj/item/device/binoculars/range/monocular
	name = "rangefinder monocular"
	desc = "A military-grade monocular equipped with rangefinding capabilities. Capable of withstanding a pretty hefty beating. Ctrl + Click turf to acquire it's coordinates. Ctrl + Click rangefinder to stop lasing."
	icon_state = "advanced_monocular"
	uses_camo = FALSE
	range_laser_overlay = FALSE
	zoom_offset = 8
	view_range = 9

/obj/item/device/binoculars/range/designator/sergeant
	name = "tactical binoculars"
	desc = "A laser designator issued to USCM command elements. It has two modes: target marking for CAS with IR laser and rangefinding. Ctrl + Click turf to target something. Ctrl + Click designator to stop lasing. Alt + Click designator to switch modes."
	icon_state = "advanced_binoculars"
	range_laser_overlay = "adv_laser_range"
	cas_laser_overlay = "adv_laser_cas"
	uses_camo = FALSE

/obj/item/device/binoculars/range/designator/monocular
	name = "tactical monocular"
	desc = "Two-mode tactical monocular, developed alongside M112 HIMAT, even though other tactical optical devices can be connected to them. Use IR laser mode to laze for HIMAT strike. Ctrl + Click designator to stop lasing. Alt + Click designator to switch modes."
	icon_state = "advanced_monocular"
	range_laser_overlay = "adv_laser_range"
	cas_laser_overlay = "adv_laser_cas"
	uses_camo = FALSE


//IMPROVED LASER DESIGNATER, faster cooldown, faster target acquisition, can be found only in scout spec kit
/obj/item/device/binoculars/range/designator/scout
	name = "scout laser designator"
	desc = "An improved laser designator, issued to USCM scouts, with two modes: target marking for CAS with IR laser and rangefinding. Ctrl + Click turf to target something. Ctrl + Click designator to stop lasing. Alt + Click designator to switch modes."
	unacidable = TRUE
	indestructible = TRUE
	cooldown_duration = 80
	target_acquisition_delay = 30

/obj/item/device/binoculars/range/designator/spotter
	name = "spotter's laser designator"
	desc = "A specially-designed laser designator, issued to USCM spotters, with two modes: target marking for CAS with IR laser and rangefinding. Ctrl + Click turf to target something. Ctrl + Click designator to stop lasing. Alt + Click designator to switch modes. Additionally, a trained spotter can laze targets for a USCM marksman, increasing the speed of target acquisition. A targeting beam will connect the binoculars to the target, but it may inherit the user's cloak, if possible."
	unacidable = TRUE
	indestructible = TRUE
	var/is_spotting = FALSE
	var/spotting_time = 10 SECONDS
	var/spotting_cooldown_delay = 5 SECONDS
	COOLDOWN_DECLARE(spotting_cooldown)

	/// The off-white band that covers the binoculars.
	var/spotter_band = "spotter_overlay"

	/// The yellow dot overlay that shows up if the binoculars are spotting.
	var/spot_laser_overlay = "laser_spotter"

/obj/item/device/binoculars/range/designator/spotter/Initialize()
	LAZYADD(actions_types, /datum/action/item_action/specialist/spotter_target)
	return ..()

/obj/item/device/binoculars/range/designator/spotter/update_icon()
	overlays += spotter_band
	if(is_spotting)
		overlays += spot_laser_overlay
	else if(range_mode)
		overlays += range_laser_overlay
	else
		overlays += cas_laser_overlay

/datum/action/item_action/specialist/spotter_target
	ability_primacy = SPEC_PRIMARY_ACTION_1
	var/minimum_laze_distance = 2

/datum/action/item_action/specialist/spotter_target/New(mob/living/user, obj/item/holder)
	..()
	name = "Spot Target"
	button.name = name
	button.overlays.Cut()
	var/image/IMG = image('icons/mob/hud/actions.dmi', button, "spotter_target")
	button.overlays += IMG
	var/obj/item/device/binoculars/range/designator/spotter/designator = holder_item
	COOLDOWN_START(designator, spotting_cooldown, 0)

/datum/action/item_action/specialist/spotter_target/action_activate()
	. = ..()
	if(!ishuman(owner))
		return
	var/mob/living/carbon/human/human = owner
	if(human.selected_ability == src)
		to_chat(human, "You will no longer use [name] with [human.get_ability_mouse_name()].")
		button.icon_state = "template"
		human.set_selected_ability(null)
	else
		to_chat(human, "You will now use [name] with [human.get_ability_mouse_name()].")
		if(human.selected_ability)
			human.selected_ability.button.icon_state = "template"
			human.set_selected_ability(null)
		button.icon_state = "template_on"
		human.set_selected_ability(src)

/datum/action/item_action/specialist/spotter_target/can_use_action()
	var/mob/living/carbon/human/human = owner
	if(istype(human) && !human.is_mob_incapacitated() && (holder_item == human.r_hand || holder_item || human.l_hand))
		return TRUE

/datum/action/item_action/specialist/spotter_target/proc/use_ability(atom/targeted_atom)
	var/mob/living/carbon/human/human = owner
	if(!istype(targeted_atom, /mob/living))
		return

	var/mob/living/target = targeted_atom

	if(target.stat == DEAD || target == human)
		return

	var/obj/item/device/binoculars/range/designator/spotter/designator = holder_item
	if(!COOLDOWN_FINISHED(designator, spotting_cooldown))
		return

	if(!check_can_use(target))
		return

	human.face_atom(target)

	///Add a decisecond to the default 1.5 seconds for each two tiles to hit.
	var/distance = floor(get_dist(target, human) * 0.5)
	var/f_spotting_time = designator.spotting_time + distance

	designator.is_spotting = TRUE
	designator.update_icon()
	var/image/I = image(icon = 'icons/effects/Targeted.dmi', icon_state = "spotter_lockon")
	I.pixel_x = -target.pixel_x + target.base_pixel_x
	I.pixel_y = (target.icon_size - world.icon_size) * 0.5 - target.pixel_y + target.base_pixel_y
	target.overlays += I
	ADD_TRAIT(target, TRAIT_SPOTTER_LAZED, TRAIT_SOURCE_EQUIPMENT(designator.tracking_id))
	if(human.client)
		playsound_client(human.client, 'sound/effects/nightvision.ogg', human, 50)
	playsound(target, 'sound/effects/nightvision.ogg', 70, FALSE, 8, falloff = 0.4)

	var/datum/beam/laser_beam
	if(human.alpha == initial(human.alpha))
		laser_beam = target.beam(human, "laser_beam_spotter", 'icons/effects/beam.dmi', f_spotting_time + 1 SECONDS, beam_type = /obj/effect/ebeam/laser/weak)
		laser_beam.visuals.alpha = 0
		animate(laser_beam.visuals, alpha = initial(laser_beam.visuals.alpha), 1 SECONDS, easing = SINE_EASING|EASE_OUT)

	//timer is a magic number because the trait is added instantly, spotting time is different from aiming time, it just ends the spot

	//timer is (f_spotting_time + 1 SECONDS) because sometimes it janks out. blame sleeps or something

	if(!do_after(human, f_spotting_time, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, NO_BUSY_ICON))
		target.overlays -= I
		designator.is_spotting = FALSE
		designator.update_icon()
		qdel(laser_beam)
		REMOVE_TRAIT(target, TRAIT_SPOTTER_LAZED, TRAIT_SOURCE_EQUIPMENT(designator.tracking_id))
		return

	target.overlays -= I
	designator.is_spotting = FALSE
	designator.update_icon()
	qdel(laser_beam)
	REMOVE_TRAIT(target, TRAIT_SPOTTER_LAZED, TRAIT_SOURCE_EQUIPMENT(designator.tracking_id))

/datum/action/item_action/specialist/spotter_target/proc/check_can_use(mob/target, cover_lose_focus)
	var/mob/living/carbon/human/human = owner
	var/obj/item/device/binoculars/range/designator/spotter/designator = holder_item

	if(!can_use_action())
		return FALSE

	if(designator != human.r_hand && designator != human.l_hand)
		to_chat(human, SPAN_WARNING("How do you expect to do this without your laser designator?"))
		return FALSE

	if(get_dist(human, target) < minimum_laze_distance)
		to_chat(human, SPAN_WARNING("\The [target] is too close to laze!"))
		return FALSE

	COOLDOWN_START(designator, spotting_cooldown, designator.spotting_cooldown_delay)
	return TRUE

//ADVANCED LASER DESIGNATER, was used for WO.
/obj/item/device/binoculars/designator
	name = "advanced laser designator" // Make sure they know this will kill people in the desc below.
	gender = NEUTER
	desc = "An advanced laser designator, used to mark targets for airstrikes and mortar fire. This one comes with two modes, one for IR laser which calls in a napalm airstrike upon the position, the other being a UV laser which calculates the distance for a mortar strike. On the side there is a label that reads:<span class='notice'> !!WARNING: Deaths from use of this tool will have the user held accountable!!</span>"
	icon_state = "designator_e"

	//laser_con is to add you to the list of laser users.
	flags_atom = FPRINT|CONDUCT
	force = 5
	w_class = SIZE_SMALL
	throwforce = 5
	throw_range = 15
	throw_speed = SPEED_VERY_FAST
	var/atom/target = null // required for lazing at things.
	var/las_r = 0 //Red Laser, Used to Replace the IR. 0 is not active, 1 is cool down, 2 is actively Lazing the target
	var/las_b = 0 //Blue laser, Used to rangefind the coordinates for a mortar strike. 0 is not active, 1 is cool down, 2 is active laz.
	var/las_mode = 0 //What laser mode we are on. If we're on 0 we're not active, 1 is IR laser, 2 is UV Laser
	var/plane_toggle = 0 //Attack plane for Airstrike 0 for E-W 1 for N-S, Mortar power for mortars.
	var/mob/living/carbon/human/FAC = null // Our lovely Forward Air Controllers
	var/lasing = FALSE //Are we using it right now?

/obj/item/device/binoculars/designator/update_icon()
	switch(las_mode)
		if(0)
			icon_state = "designator_e"
		if(1)
			icon_state = "designator_r"
		if(2)
			icon_state = "designator_b"
	return

/obj/item/device/binoculars/designator/verb/switch_mode()
	set category = "Weapons"
	set name = "Change Laser Setting"
	set desc = "This will disable the laser, enable the IR laser, or enable the UV laser. IR for airstrikes and UV for Mortars"
	set src in usr

	playsound(src,'sound/machines/click.ogg', 15, 1)

	switch(las_mode)
		if(0) //Actually adding descriptions so you can tell what the hell you've selected now.
			las_mode = 1
			to_chat(usr, SPAN_WARNING("IR Laser enabled! You will now designate airstrikes!"))
			update_icon()
			return
		if(1)
			las_mode = 2
			to_chat(usr, SPAN_WARNING("UV Laser enabled! You will now designate mortars!"))
			update_icon()
			return
		if(2)
			las_mode = 0
			to_chat(usr, SPAN_WARNING(" System offline, now this is just a pair of binoculars but heavier."))
			update_icon()
			return
	return

/obj/item/device/binoculars/designator/verb/switch_laz()
	set category = "Weapons"
	set name = "Change Lasing Mode"
	set desc = "Will change the airstrike plane from going East/West to North/South, or if using Mortars, it'll change the warhead used on them."
	set src in usr

	playsound(src,'sound/machines/click.ogg', 15, 1)

	switch(plane_toggle)
		if(0)
			plane_toggle = 1
			to_chat(usr, SPAN_WARNING(" Airstrike plane is now N-S! If using mortars its now HE rounds!"))
			return
		if(1)
			plane_toggle = 0
			to_chat(usr, SPAN_WARNING(" Airstrike plane is now E-W! If using mortars its now concussion rounds!"))
			return
	return

/obj/item/device/binoculars/designator/proc/lasering(mob/living/carbon/human/user, atom/targeted_atom, params)
	if(istype(targeted_atom,/atom/movable/screen))
		return FALSE
	if(user.stat)
		zoom(user)
		FAC = null
		return FALSE
	if(lasing)
		return FALSE
	target = targeted_atom
	if(!istype(target))
		return FALSE
	if(target.z != user.z)
		return FALSE

	var/list/modifiers = params2list(params) //Only single clicks.
	if(modifiers[MIDDLE_CLICK] || modifiers[SHIFT_CLICK] || modifiers[ALT_CLICK] || modifiers[CTRL_CLICK])
		return FALSE

	var/turf/SS = get_turf(src) //Stand Still, not what you're thinking.
	var/turf/T = get_turf(targeted_atom)

	if(!las_mode)
		to_chat(user, SPAN_WARNING("The Laser Designator is currently off!"))
		return 0

	if(las_r || las_b) //Make sure we don't spam strikes
		to_chat(user, SPAN_WARNING("The laser is currently cooling down. Please wait roughly 5 minutes from lasing the target."))
		return 0

	to_chat(user, SPAN_BOLDNOTICE(" You start lasing the target area."))
	message_admins("ALERT: [user] ([user.key]) IS CURRENTLY LASING A TARGET: CURRENT MODE [las_mode], at ([T.x],[T.y],[T.z]) [ADMIN_JMP(T)].") // Alert all the admins to this asshole. Added the jmp command from the explosion code.
	var/obj/effect/las_target/lasertarget = new(T.loc)
	if(las_mode == 1 && !las_r) // Heres our IR bomb code.
		lasing = TRUE
		lasertarget.icon_state = "las_r"
		las_r = 2
		playsound(src, 'sound/effects/nightvision.ogg', 35)
		sleep(50)
		if(SS != get_turf(src)) //Don't move.
			lasing = FALSE
			las_r = 0
			return 0
		lasertarget.icon_state = "laslock_r"
		var/offset_x = 0
		var/offset_y = 0
		if(!plane_toggle)
			offset_x = 4
		if(plane_toggle)
			offset_y = 4
		var/turf/target = locate(T.x + offset_x,T.y + offset_y,T.z) //Three napalm rockets are launched
		var/turf/target_2 = locate(T.x,T.y,T.z)
		var/turf/target_3 = locate(T.x - offset_x,T.y - offset_y,T.z)
		var/turf/target_4 = locate(T.x - (offset_x*2),T.y - (offset_y*2),T.z)
		sleep(50) //AWW YEAH
		var/datum/cause_data/cause_data = create_cause_data("artillery fire", user)
		flame_radius(cause_data, 3, target, , , , , )
		explosion(target,  -1, 2, 3, 5, , , , cause_data)
		flame_radius(cause_data, 3, target_2, , , , , )
		explosion(target_2,  -1, 2, 3, 5, , , , cause_data)
		flame_radius(cause_data, 3, target_3, , , , , )
		explosion(target_3,  -1, 2, 3, 5, , , , cause_data)
		flame_radius(cause_data, 3, target_4, , , , , )
		explosion(target_4,  -1, 2, 3, 5, , , , cause_data)
		sleep(1)
		qdel(lasertarget)
		lasing = FALSE
		las_r = 1
		addtimer(VARSET_CALLBACK(src, las_r, FALSE), 5 MINUTES)
		return
	else if(las_mode == 2 && !las_b) //Give them the option for mortar fire.
		lasing = TRUE
		lasertarget.icon_state = "las_b"
		las_b = 2
		playsound(src, 'sound/effects/nightvision.ogg', 35)
		sleep(50)
		if(SS != get_turf(src)) //Don't move.
			lasing = FALSE
			las_b = 0
			return 0
		lasertarget.icon_state = "laslock_b"
		var/HE_power = 0
		var/con_power = 0
		if(!plane_toggle)
			con_power = 5
			HE_power = 1
		else
			con_power = 3
			HE_power = 3
		var/turf/target = locate(T.x + rand(-2,2),T.y + rand(-2,2),T.z)
		var/turf/target_2 = locate(T.x + rand(-2,2),T.y + rand(-2,2),T.z)
		var/turf/target_3 = locate(T.x + rand(-2,2),T.y + rand(-2,2),T.z)
		if(target && istype(target))
			qdel(lasertarget)
			var/datum/cause_data/cause_data = create_cause_data("artillery fire", user)
			explosion(target, -1, HE_power, con_power, con_power, , , , cause_data) //Kaboom!
			sleep(rand(15,30)) //This is all better done in a for loop, but I am mad lazy
			explosion(target_2, -1, HE_power, con_power, con_power, , , , cause_data)
			sleep(rand(15,30))
			explosion(target_3, -1, HE_power, con_power, con_power, , , , cause_data)
			lasing = FALSE
			las_b = 1
			addtimer(VARSET_CALLBACK(src, las_b, FALSE), 5 MINUTES)
			return

/obj/item/device/binoculars/designator/afterattack(atom/targeted_atom as mob|obj|turf, mob/user as mob, params) // This is actually WAY better, espically since its fucken already in the code.
	lasering(user, targeted_atom, params)
	return

/obj/effect/las_target
	name = "laser"
	icon = 'icons/obj/items/binoculars.dmi'
	icon_state = "las_r"
	opacity = TRUE
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	unacidable = TRUE
