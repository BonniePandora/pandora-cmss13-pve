/*
---------------------
CONTRACTORS
---------------------
*/
/datum/skills/contractor
	name = "Contractor Standard"
	skills = list(
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_ENGINEER = SKILL_ENGINEER_NOVICE,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_TRAINED,
		SKILL_FIREARMS = SKILL_FIREARMS_MAX,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_EXPERT,
		SKILL_VEHICLE = SKILL_VEHICLE_LARGE,
		SKILL_MEDICAL = SKILL_MEDICAL_TRAINED,
		SKILL_MELEE_WEAPONS = SKILL_MELEE_TRAINED,
		SKILL_JTAC = SKILL_JTAC_BEGINNER,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
	)

/datum/skills/contractor/leader
	name = "Contractor Leader"
	skills = list(
		SKILL_ENGINEER = SKILL_ENGINEER_TRAINED,
		SKILL_FIREARMS = SKILL_FIREARMS_MAX,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
		SKILL_LEADERSHIP = SKILL_LEAD_MASTER,
		SKILL_OVERWATCH = SKILL_OVERWATCH_TRAINED,
		SKILL_MEDICAL = SKILL_MEDICAL_TRAINED,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CQC = SKILL_CQC_SKILLED,
		SKILL_MELEE_WEAPONS = SKILL_MELEE_TRAINED,
		SKILL_VEHICLE = SKILL_VEHICLE_LARGE,
		SKILL_POWERLOADER = SKILL_POWERLOADER_TRAINED,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
		SKILL_JTAC = SKILL_JTAC_MASTER,
	)

/datum/skills/contractor/medic
	name = "Contractor Medic"
	skills = list(
		SKILL_FIREARMS = SKILL_FIREARMS_MAX,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_TRAINED,
		SKILL_ENGINEER = SKILL_ENGINEER_NOVICE,
		SKILL_MEDICAL = SKILL_MEDICAL_DOCTOR,
		SKILL_SURGERY = SKILL_SURGERY_TRAINED,
		SKILL_VEHICLE = SKILL_VEHICLE_LARGE,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
		SKILL_MELEE_WEAPONS = SKILL_MELEE_TRAINED,
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_JTAC = SKILL_JTAC_BEGINNER,
	)

/datum/skills/contractor/engi
	name = "Contractor Engi"
	skills = list(
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_ENGINEER = SKILL_ENGINEER_MAX,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_MAX,
		SKILL_FIREARMS = SKILL_FIREARMS_MAX,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_VEHICLE = SKILL_VEHICLE_LARGE,
		SKILL_MEDICAL = SKILL_MEDICAL_TRAINED,
		SKILL_MELEE_WEAPONS = SKILL_MELEE_TRAINED,
		SKILL_JTAC = SKILL_JTAC_EXPERT,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
		SKILL_POWERLOADER = SKILL_POWERLOADER_TRAINED,
	)

/datum/skills/contractor/heavy
	name = "Contractor Machinegunner"
	skills = list(
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_ENGINEER = SKILL_ENGINEER_NOVICE,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_TRAINED,
		SKILL_FIREARMS = SKILL_FIREARMS_MAX,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_EXPERT,
		SKILL_VEHICLE = SKILL_VEHICLE_LARGE,
		SKILL_MEDICAL = SKILL_MEDICAL_TRAINED,
		SKILL_MELEE_WEAPONS = SKILL_MELEE_TRAINED,
		SKILL_SPEC_WEAPONS = SKILL_SPEC_SMARTGUN,
		SKILL_JTAC = SKILL_JTAC_BEGINNER,
		SKILL_ENDURANCE = SKILL_ENDURANCE_TRAINED,
	)
