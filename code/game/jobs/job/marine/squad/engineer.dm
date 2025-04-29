/datum/job/marine/engineer
	title = JOB_SQUAD_ENGI
	total_positions = 12
	spawn_positions = 12
	allow_additional = 1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/engineer
	entry_message_body = "You have the <a href='"+WIKI_PLACEHOLDER+"'>equipment and skill</a> to build fortifications, reroute power lines, and bunker down. Your squaddies will look to you when it comes to construction in the field of battle."

/datum/job/marine/engineer/set_spawn_positions(count)
	for(var/datum/squad/sq in GLOB.RoleAuthority.squads)
		if(sq)
			sq.max_engineers = engi_slot_formula(count)

/datum/job/marine/engineer/get_total_positions(latejoin=0)
	var/slots = engi_slot_formula(get_total_marines())

	if(slots <= total_positions_so_far)
		slots = total_positions_so_far
	else
		total_positions_so_far = slots

	if(latejoin)
		for(var/datum/squad/sq in GLOB.RoleAuthority.squads)
			if(sq)
				sq.max_engineers = slots

	return (slots*4)

/datum/job/marine/engineer/whiskey
	title = JOB_WO_SQUAD_ENGINEER
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/engineer

/obj/effect/landmark/start/marine/engineer
	name = JOB_SQUAD_ENGI
	icon_state = "engi_spawn"
	job = /datum/job/marine/engineer

/obj/effect/landmark/start/marine/engineer/alpha
	icon_state = "engi_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/engineer/bravo
	icon_state = "engi_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/engineer/charlie
	icon_state = "engi_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/engineer/delta
	icon_state = "engi_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/engineer/ai
	total_positions = 0
	spawn_positions = 0

/datum/job/marine/engineer/ai/set_spawn_positions(count)
	return spawn_positions

/datum/job/marine/engineer/ai/get_total_positions(latejoin=0)
	return latejoin ? total_positions : spawn_positions

/datum/job/marine/engineer/ai/rmc
	total_positions = 1
	spawn_positions = 1
	title = JOB_RMCTROOP_ENGI
	gear_preset = /datum/equipment_preset/uscm/rmc/eng
	job_options = null

/obj/effect/landmark/start/marine/engineer/rmc
	name = JOB_RMCTROOP_ENGI
	squad = SQUAD_TWE
	job = /datum/job/marine/engineer/ai/rmc

/datum/job/marine/engineer/ai/rmcmortar
	total_positions = 1
	spawn_positions = 1
	title = JOB_RMCTROOP_BREACHER
	gear_preset = /datum/equipment_preset/uscm/rmc/mor
	job_options = null

/obj/effect/landmark/start/marine/engineer/rmcmortar
	name = JOB_RMCTROOP_BREACHER
	squad = SQUAD_TWE
	job = /datum/job/marine/engineer/ai/rmcmortar
