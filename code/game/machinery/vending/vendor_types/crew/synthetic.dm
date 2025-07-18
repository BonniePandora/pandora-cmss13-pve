//------------GEAR VENDOR---------------

/obj/structure/machinery/cm_vending/gear/synth
	name = "\improper ColMarTech Synthetic Auxiliary Gear Rack"
	desc = "An automated gear rack hooked up to a colossal storage of various medical and engineering supplies. Can be accessed only by synthetic units."
	icon_state = "gear"
	req_access = list(ACCESS_MARINE_SYNTH)
	vendor_role = list(JOB_SYNTH, JOB_SYNTH_SURVIVOR, JOB_UPP_SUPPORT_SYNTH, JOB_CMB_SYN, JOB_PMC_SYNTH)

	listed_products = list(
		list("ENGINEER SUPPLIES", 0, null, null, null),
		list("Airlock Circuit Board", 1, /obj/item/circuitboard/airlock, null, VENDOR_ITEM_REGULAR),
		list("APC Circuit Board", 1, /obj/item/circuitboard/apc, null, VENDOR_ITEM_REGULAR),
		list("Entrenching Tool", 2, /obj/item/tool/shovel/etool, null, VENDOR_ITEM_REGULAR),
		list("High-Capacity Power Cell", 2, /obj/item/cell/high, null, VENDOR_ITEM_REGULAR),
		list("Metal x10", 5, /obj/item/stack/sheet/metal/small_stack, null, VENDOR_ITEM_REGULAR),
		list("Plasteel x10", 7, /obj/item/stack/sheet/plasteel/small_stack, null, VENDOR_ITEM_REGULAR),
		list("Sandbags x25", 5, /obj/item/stack/sandbags_empty/half, null, VENDOR_ITEM_REGULAR),
		list("Plastic Explosive", 3, /obj/item/explosive/plastic, null, VENDOR_ITEM_REGULAR),
		list("ES-11 Mobile Fuel Canister", 4, /obj/item/tool/weldpack/minitank, null, VENDOR_ITEM_REGULAR),
		list("Engineer Kit", 1, /obj/item/storage/toolkit/empty, null, VENDOR_ITEM_REGULAR),
		list("Tactical Prybar", 5, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),

		list("FIRSTAID KITS", 0, null, null, null),
		list("Advanced Firstaid Kit", 12, /obj/item/storage/firstaid/adv, null, VENDOR_ITEM_REGULAR),
		list("Firstaid Kit", 5, /obj/item/storage/firstaid/regular, null, VENDOR_ITEM_REGULAR),
		list("Fire Firstaid Kit", 6, /obj/item/storage/firstaid/fire, null, VENDOR_ITEM_REGULAR),
		list("Toxin Firstaid Kit", 6, /obj/item/storage/firstaid/toxin, null, VENDOR_ITEM_REGULAR),
		list("Oxygen Firstaid Kit", 6, /obj/item/storage/firstaid/o2, null, VENDOR_ITEM_REGULAR),
		list("Radiation Firstaid Kit", 6, /obj/item/storage/firstaid/rad, null, VENDOR_ITEM_REGULAR),

		list("MEDICAL SUPPLIES", 0, null, null, null),
		list("Burn Kit", 2, /obj/item/stack/medical/advanced/ointment, null, VENDOR_ITEM_REGULAR),
		list("Trauma Kit", 2, /obj/item/stack/medical/advanced/bruise_pack, null, VENDOR_ITEM_REGULAR),
		list("Medical Splints", 1, /obj/item/stack/medical/splint, null, VENDOR_ITEM_REGULAR),
		list("Roller Bed", 3, /obj/item/roller, null, VENDOR_ITEM_REGULAR),
		list("MS-11 Smart Refill Tank", 4, /obj/item/reagent_container/glass/minitank, null, VENDOR_ITEM_REGULAR),

		list("Pillbottle (Bicaridine)", 5, /obj/item/storage/pill_bottle/bicaridine, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Dexalin)", 5, /obj/item/storage/pill_bottle/dexalin, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Dylovene)", 5, /obj/item/storage/pill_bottle/antitox, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Inaprovaline)", 5, /obj/item/storage/pill_bottle/inaprovaline, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Kelotane)", 5, /obj/item/storage/pill_bottle/kelotane, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Peridaxon)", 5, /obj/item/storage/pill_bottle/peridaxon, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Tramadol)", 5, /obj/item/storage/pill_bottle/tramadol, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Imidazoline-Alkysine)", 10, /obj/item/storage/pill_bottle/imialk, null, VENDOR_ITEM_RECOMMENDED),

		list("Injector (Bicaridine)", 1, /obj/item/reagent_container/hypospray/autoinjector/bicaridine, null, VENDOR_ITEM_REGULAR),
		list("Injector (Dexalin+)", 1, /obj/item/reagent_container/hypospray/autoinjector/dexalinp, null, VENDOR_ITEM_REGULAR),
		list("Injector (Inaprovaline)", 1, /obj/item/reagent_container/hypospray/autoinjector/inaprovaline, null, VENDOR_ITEM_REGULAR),
		list("Injector (Kelotane)", 1, /obj/item/reagent_container/hypospray/autoinjector/kelotane, null, VENDOR_ITEM_REGULAR),
		list("Injector (Oxycodone)", 2, /obj/item/reagent_container/hypospray/autoinjector/oxycodone, null, VENDOR_ITEM_REGULAR),
		list("Injector (Tramadol)", 1, /obj/item/reagent_container/hypospray/autoinjector/tramadol, null, VENDOR_ITEM_REGULAR),
		list("Injector (Tricord)", 1, /obj/item/reagent_container/hypospray/autoinjector/tricord, null, VENDOR_ITEM_REGULAR),

		list("Health Diagnostic Equipment", 2, /obj/item/device/healthanalyzer/soul, null, VENDOR_ITEM_REGULAR),
		list("Surgical Line", 3, /obj/item/tool/surgery/surgical_line, null, VENDOR_ITEM_REGULAR),
		list("Synth-Graft", 3, /obj/item/tool/surgery/synthgraft, null, VENDOR_ITEM_REGULAR),

		list("OTHER SUPPLIES", 0, null, null, null),
		list("Binoculars", 5,/obj/item/device/binoculars, null, VENDOR_ITEM_REGULAR),
		list("Rangefinder", 8, /obj/item/device/binoculars/range, null,  VENDOR_ITEM_REGULAR),
		list("Laser Designator", 12, /obj/item/device/binoculars/range/designator, null, VENDOR_ITEM_RECOMMENDED),
		list("Flashlight", 1, /obj/item/device/flashlight, null, VENDOR_ITEM_RECOMMENDED),
		list("Motion Detector", 3, /obj/item/device/motiondetector, null, VENDOR_ITEM_REGULAR),
		list("Space Cleaner", 1, /obj/item/reagent_container/spray/cleaner, null, VENDOR_ITEM_REGULAR),
		list("Whistle", 2, /obj/item/device/whistle, null, VENDOR_ITEM_REGULAR),
		list("Machete Scabbard (Full)", 2, /obj/item/storage/large_holster/machete/full, null, VENDOR_ITEM_REGULAR)

	)

//------------CLOTHING VENDOR---------------

GLOBAL_LIST_INIT(cm_vending_clothing_synth, list(
		list("EXPERIMENTAL EQUIPMENT (CHOOSE 1)", 0, null, null, null),
		list("Breaching Hammer", 0, /obj/item/weapon/twohanded/breacher/synth, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Compact Nailgun kit", 0, /obj/effect/essentials_set/cnailgun, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Crew Monitor", 0, /obj/item/tool/crew_monitor, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Maintenance Jack", 0, /obj/item/maintenance_jack, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_RECOMMENDED),
		list("Portable Dialysis Machine", 0, /obj/item/tool/portadialysis, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Telescopic Baton", 0, /obj/item/weapon/telebaton, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),

		list("RADIO (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/mcom/synth, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),

		list("UNIFORM (CHOOSE 1)", 0, null, null, null),
		list("Uniform, Outdated Synth", 0, /obj/item/clothing/under/rank/synthetic/old, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),
		list("Uniform, Standard Synth", 0, /obj/item/clothing/under/rank/synthetic, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("USCM Standard Uniform", 0, /obj/item/clothing/under/marine, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),
		list("USCM Medical Uniform", 0, /obj/item/clothing/under/marine/medic, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),

		list("WEBBING (CHOOSE 1)", 0, null, null, null),
		list("Black Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Brown Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest/brown_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Webbing", 0, /obj/item/clothing/accessory/storage/webbing, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Surgical Webbing Vest", 0, /obj/item/clothing/accessory/storage/surg_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Surgical Webbing Vest (Blue)", 0, /obj/item/clothing/accessory/storage/surg_vest/blue, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Surgical Drop Pouch", 0, /obj/item/clothing/accessory/storage/surg_vest/drop_green, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Surgical Drop Pouch (Blue)", 0, /obj/item/clothing/accessory/storage/surg_vest/drop_blue, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Surgical Drop Pouch (Black)", 0, /obj/item/clothing/accessory/storage/surg_vest/drop_black, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Tool Webbing", 0, /obj/item/clothing/accessory/storage/tool_webbing/equipped, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 0, /obj/item/clothing/accessory/storage/droppouch, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),

		list("SHOES (CHOOSE 1)", 0, null, null, null),
		list("Boots", 0, /obj/item/clothing/shoes/marine/knife, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_REGULAR),
		list("Shoes, White", 0, /obj/item/clothing/shoes/white, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (CHOOSE 1)", 0, null, null, null),
		list("Expedition Cap", 0, /obj/item/clothing/head/cmcap/flap, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Hard Hat, Orange", 0, /obj/item/clothing/head/hardhat/orange, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Welding Helmet", 0, /obj/item/clothing/head/welding, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("SUIT (CHOOSE 1)", 0, null, null, null),
		list("M3-VL Pattern Flak Vest", 0, /obj/item/clothing/suit/storage/marine/light/vest/dcc, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_RECOMMENDED),
		list("M3-VL Pattern Ballistics Vest", 0, /obj/item/clothing/suit/storage/marine/light/vest, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),
		list("M70 Flak Jacket", 0, /obj/item/clothing/suit/armor/vest/pilot, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),
		list("Shoulder-lamp Rig", 0, /obj/item/clothing/suit/marine/lamp, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),

		list("GLOVES (CHOOSE 1)", 0, null, null, null),
		list("Insulated Gloves", 0, /obj/item/clothing/gloves/yellow, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Black Gloves", 0, /obj/item/clothing/gloves/black, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),
		list("Latex Gloves", 0, /obj/item/clothing/gloves/latex, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),

		list("BACKPACK (CHOOSE 1)", 0, null, null, null),
		list("Tactical IMP Rucksack", 0, /obj/item/storage/backpack/marine/marsoc, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Logistics IMP Backpack", 0, /obj/item/storage/backpack/marine/satchel/big, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Expedition Chestrig", 0, /obj/item/storage/backpack/marine/satchel/intel/chestrig, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("BELT (CHOOSE 1)", 0, null, null, null),
		list("G8-A General Utility Pouch", 0, /obj/item/storage/backpack/general_belt, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Lifesaver Bag", 0, /obj/item/storage/belt/medical/lifesaver/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Medical Storage Belt", 0, /obj/item/storage/belt/medical/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Toolbelt Rig (Full)", 0, /obj/item/storage/belt/utility/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Autoinjector Pouch", 0, /obj/item/storage/pouch/autoinjector, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Construction Pouch", 0, /obj/item/storage/pouch/construction, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Electronics Pouch (Full)", 0, /obj/item/storage/pouch/electronics/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Refillable Injectors)", 0, /obj/item/storage/pouch/firstaid/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", 0, /obj/item/storage/pouch/firstaid/full/alternate, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Pill Packets)", 0, /obj/item/storage/pouch/firstaid/full/pills, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch", 0, /obj/item/storage/pouch/first_responder, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 0, /obj/item/storage/pouch/general/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 0, /obj/item/storage/pouch/sling, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Pouch", 0, /obj/item/storage/pouch/medical, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Kit Pouch", 0, /obj/item/storage/pouch/medkit, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pressurized Reagent Canister Pouch (Bicaridine)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/bicaridine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pressurized Reagent Canister Pouch (Kelotane)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/kelotane, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pressurized Reagent Canister Pouch (Tricordrazine)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/tricordrazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tools Pouch (Full)", 0, /obj/item/storage/pouch/tools/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", 0, /obj/item/storage/pouch/machete/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("MASK", 0, null, null, null),
		list("Sterile mask", 0, /obj/item/clothing/mask/surgical, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR)
	))

/obj/structure/machinery/cm_vending/clothing/synth
	name = "\improper ColMarTech Synthetic Equipment Rack"
	desc = "An automated rack hooked up to a colossal storage of various equipment. Can be accessed only by synthetic units."
	req_access = list(ACCESS_MARINE_SYNTH)
	vendor_role = list(JOB_SYNTH, JOB_SYNTH_SURVIVOR, JOB_UPP_SUPPORT_SYNTH, JOB_CMB_SYN, JOB_PMC_SYNTH)

/obj/structure/machinery/cm_vending/clothing/synth/get_listed_products(mob/user)
	return GLOB.cm_vending_clothing_synth

//------------SNOWFLAKE VENDOR---------------

GLOBAL_LIST_INIT(cm_vending_clothing_synth_snowflake, list(
	list("USCM UNIFORMS", 0, null, null, null),
	list("Medical Scrubs, Blue", 12, /obj/item/clothing/under/rank/medical/blue, null, VENDOR_ITEM_REGULAR),
	list("Medical Scrubs, Light Blue", 12, /obj/item/clothing/under/rank/medical/lightblue, null, VENDOR_ITEM_REGULAR),
	list("Medical Scrubs, Green", 12, /obj/item/clothing/under/rank/medical/green, null, VENDOR_ITEM_REGULAR),
	list("Medical Scrubs, Purple", 12, /obj/item/clothing/under/rank/medical/purple, null, VENDOR_ITEM_REGULAR),
	list("Medical Scrubs, Olive", 12, /obj/item/clothing/under/rank/medical/olive, null, VENDOR_ITEM_REGULAR),
	list("Medical Scrubs, Grey", 12, /obj/item/clothing/under/rank/medical/grey, null, VENDOR_ITEM_REGULAR),
	list("Medical Scrubs, White", 12, /obj/item/clothing/under/rank/medical, null, VENDOR_ITEM_REGULAR),
	list("USCM Service Uniform, Tan", 12, /obj/item/clothing/under/marine/officer/bridge, null, VENDOR_ITEM_REGULAR),
	list("USCM Service Uniform, White", 12, /obj/item/clothing/under/marine/dress, null, VENDOR_ITEM_REGULAR),
	list("USCM Flightsuit", 12, /obj/item/clothing/under/rank/synthetic/flight, null, VENDOR_ITEM_REGULAR),
	list("USCM Vehicle Crewman Uniform", 12, /obj/item/clothing/under/marine/officer/tanker, null, VENDOR_ITEM_REGULAR),
	list("USCM Engineers Uniform", 12, /obj/item/clothing/under/marine/engineer/standard, null, VENDOR_ITEM_REGULAR),
	list("USCM Engineers Uniform (Darker)", 12, /obj/item/clothing/under/marine/engineer/darker, null, VENDOR_ITEM_REGULAR),
	list("USCM Engineering Officers Uniform", 12, /obj/item/clothing/under/marine/officer/engi, null, VENDOR_ITEM_REGULAR),
	list("USCM Military Police Uniform", 12, /obj/item/clothing/under/marine/mp/standard, null, VENDOR_ITEM_REGULAR),
	list("USCM Military Police Uniform (Darker)", 12, /obj/item/clothing/under/marine/mp/darker, null, VENDOR_ITEM_REGULAR),

	list("NON-STANDARD UNIFORMS", 0, null, null, null),
	list("White T-Shirt and Brown Jeans", 12, /obj/item/clothing/under/tshirt/w_br, null, VENDOR_ITEM_REGULAR),
	list("Gray T-Shirt and Blue Jeans", 12, /obj/item/clothing/under/tshirt/gray_blu, null, VENDOR_ITEM_REGULAR),
	list("Red T-Shirt and Black Jeans", 12, /obj/item/clothing/under/tshirt/r_bla, null, VENDOR_ITEM_REGULAR),
	list("Frontier Jumpsuit", 12, /obj/item/clothing/under/rank/synthetic/frontier, null, VENDOR_ITEM_REGULAR),
	list("UA Grey Jumpsuit", 12, /obj/item/clothing/under/colonist/ua_civvies, null, VENDOR_ITEM_REGULAR),
	list("UA Brown Jumpsuit", 12, /obj/item/clothing/under/colonist/wy_davisone, null, VENDOR_ITEM_REGULAR),
	list("UA Green Utility Uniform", 12, /obj/item/clothing/under/rank/synthetic/utility, null, VENDOR_ITEM_REGULAR),
	list("Grey Utilities", 12, /obj/item/clothing/under/rank/synthetic/utility/yellow, null, VENDOR_ITEM_REGULAR),
	list("Grey Utilities and Blue Jeans", 12, /obj/item/clothing/under/rank/synthetic/utility/red, null, VENDOR_ITEM_REGULAR),
	list("Blue Utilities and Brown Jeans", 12, /obj/item/clothing/under/rank/synthetic/utility/blue, null, VENDOR_ITEM_REGULAR),
	list("White Service Uniform", 12, /obj/item/clothing/under/colonist/white_service, null, VENDOR_ITEM_REGULAR),
	list("Steward Clothes", 12, /obj/item/clothing/under/colonist/wy_joliet_shopsteward, null, VENDOR_ITEM_REGULAR),
	list("Red Dress Skirt", 12, /obj/item/clothing/under/blackskirt, null, VENDOR_ITEM_REGULAR),
	list("Blue Suit Pants", 12, /obj/item/clothing/under/liaison_suit/blue, null, VENDOR_ITEM_REGULAR),
	list("Brown Suit Pants", 12, /obj/item/clothing/under/liaison_suit/brown, null, VENDOR_ITEM_REGULAR),
	list("White Suit Pants", 12, /obj/item/clothing/under/liaison_suit/corporate_formal, null, VENDOR_ITEM_REGULAR),
	list("Working Joe Uniform", 36, /obj/item/clothing/under/rank/synthetic/joe, null, VENDOR_ITEM_REGULAR),

	list("GLASSES", 0, null, null, null),
	list("HealthMate HUD", 12, /obj/item/clothing/glasses/hud/health, null, VENDOR_ITEM_REGULAR),
	list("Marine RPG Glasses", 12, /obj/item/clothing/glasses/regular, null, VENDOR_ITEM_REGULAR),
	list("Optical Meson Scanner", 12, /obj/item/clothing/glasses/meson, null, VENDOR_ITEM_REGULAR),
	list("PatrolMate HUD", 12, /obj/item/clothing/glasses/hud/security, null, VENDOR_ITEM_REGULAR),
	list("Security HUD Glasses", 12, /obj/item/clothing/glasses/sunglasses/sechud, null, VENDOR_ITEM_REGULAR),
	list("Sunglasses", 12, /obj/item/clothing/glasses/sunglasses, null, VENDOR_ITEM_REGULAR),
	list("Welding Goggles", 12, /obj/item/clothing/glasses/welding, null, VENDOR_ITEM_REGULAR),

	list("SHOES", 0, null, null, null),
	list("Boots", 12, /obj/item/clothing/shoes/marine, null, VENDOR_ITEM_REGULAR),
	list("Shoes, Black", 12, /obj/item/clothing/shoes/black, null, VENDOR_ITEM_REGULAR),
	list("Shoes, Blue", 12, /obj/item/clothing/shoes/blue, null, VENDOR_ITEM_REGULAR),
	list("Shoes, Brown", 12, /obj/item/clothing/shoes/brown, null, VENDOR_ITEM_REGULAR),
	list("Shoes, Green", 12, /obj/item/clothing/shoes/green, null, VENDOR_ITEM_REGULAR),
	list("Shoes, Purple", 12, /obj/item/clothing/shoes/purple, null, VENDOR_ITEM_REGULAR),
	list("Shoes, Red", 12, /obj/item/clothing/shoes/red, null, VENDOR_ITEM_REGULAR),
	list("Shoes, White", 12, /obj/item/clothing/shoes/white, null, VENDOR_ITEM_REGULAR),
	list("Shoes, Yellow", 12, /obj/item/clothing/shoes/yellow, null, VENDOR_ITEM_REGULAR),
	list("Shoes, Seegson", 24, /obj/item/clothing/shoes/laceup, null, VENDOR_ITEM_REGULAR),

	list("HEADWEAR", 0, null, null, null),
	list("Beanie", 12, /obj/item/clothing/head/beanie, null, VENDOR_ITEM_REGULAR),
	list("Beret, Engineering", 12, /obj/item/clothing/head/beret/eng, null, VENDOR_ITEM_REGULAR),
	list("Beret, Purple", 12, /obj/item/clothing/head/beret/jan, null, VENDOR_ITEM_REGULAR),
	list("Beret, Red", 12, /obj/item/clothing/head/beret/cm/red, null, VENDOR_ITEM_REGULAR),
	list("Beret, Standard", 12, /obj/item/clothing/head/beret/cm, null, VENDOR_ITEM_REGULAR),
	list("Beret, Tan", 12, /obj/item/clothing/head/beret/cm/tan, null, VENDOR_ITEM_REGULAR),
	list("Beret, Green", 12, /obj/item/clothing/head/beret/cm, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
	list("Beret, Black", 12, /obj/item/clothing/head/beret/cm/black, null, VENDOR_ITEM_REGULAR),
	list("Beret, White", 12, /obj/item/clothing/head/beret/cm/white, null, VENDOR_ITEM_REGULAR),
	list("Surgical Cap, Blue", 12, /obj/item/clothing/head/surgery/blue, null, VENDOR_ITEM_REGULAR),
	list("Surgical Cap, Blue", 12, /obj/item/clothing/head/surgery/purple, null, VENDOR_ITEM_REGULAR),
	list("Surgical Cap, Green", 12, /obj/item/clothing/head/surgery/green, null, VENDOR_ITEM_REGULAR),
	list("Ushanka", 12, /obj/item/clothing/head/ushanka, null, VENDOR_ITEM_REGULAR),
	list("Cap", 12, /obj/item/clothing/head/cmcap, null, VENDOR_ITEM_REGULAR),
	list("MP Cap", 12, /obj/item/clothing/head/beret/marine/mp/mpcap, null, VENDOR_ITEM_REGULAR),
	list("Req Cap", 12, /obj/item/clothing/head/cmcap/khaki, null, VENDOR_ITEM_REGULAR),
	list("Officer Cap", 12, /obj/item/clothing/head/cmcap/bridge, null, VENDOR_ITEM_REGULAR),
	list("Bio Hood", 12, /obj/item/clothing/head/bio_hood/synth, null, VENDOR_ITEM_REGULAR),
	list("Fedora", 12, /obj/item/clothing/head/fedora, null, VENDOR_ITEM_REGULAR),

	list("HELMET", 0, null, null, null),
	list("Marine Helmet (Mission-Specific Camo)", 12, /obj/item/clothing/head/helmet/marine, null, VENDOR_ITEM_REGULAR),
	list("Marine Helmet (Grey)", 12, /obj/item/clothing/head/helmet/marine/grey, null, VENDOR_ITEM_REGULAR),
	list("Marine Helmet (Jungle)", 12, /obj/item/clothing/head/helmet/marine/jungle, null, VENDOR_ITEM_REGULAR),
	list("Marine Helmet (Snow)", 12, /obj/item/clothing/head/helmet/marine/snow, null, VENDOR_ITEM_REGULAR),
	list("Marine Helmet (Desert)", 12, /obj/item/clothing/head/helmet/marine/desert, null, VENDOR_ITEM_REGULAR),
	list("Technician Helmet", 12, /obj/item/clothing/head/helmet/marine/tech, null, VENDOR_ITEM_REGULAR),
	list("Pilot Helmet", 12, /obj/item/clothing/head/helmet/upp/marinepilot, null, VENDOR_ITEM_REGULAR),
	list("Crewman Helmet", 12, /obj/item/clothing/head/helmet/marine/tech/tanker, null, VENDOR_ITEM_REGULAR),
	list("Corpsman Helmet", 12, /obj/item/clothing/head/helmet/marine/medic, null, VENDOR_ITEM_REGULAR),
	list("White Corpsman Helmet", 12, /obj/item/clothing/head/helmet/marine/medic/white, null, VENDOR_ITEM_REGULAR),
	list("Attachable Helmet Shield", 12, /obj/item/prop/helmetgarb/riot_shield, null, VENDOR_ITEM_REGULAR),

	list("MASK", 0, null, null, null),
	list("Surgical Mask", 12, /obj/item/clothing/mask/surgical, null, VENDOR_ITEM_REGULAR),
	list("Rebreather", 12, /obj/item/clothing/mask/rebreather, null, VENDOR_ITEM_REGULAR),
	list("Skull Balaclava, Blue", 12, /obj/item/clothing/mask/rebreather/skull, null, VENDOR_ITEM_REGULAR),
	list("Skull balaclava, Black", 12, /obj/item/clothing/mask/rebreather/skull/black, null, VENDOR_ITEM_REGULAR),
	list("Balaclava", 12, /obj/item/clothing/mask/rebreather/scarf, null, VENDOR_ITEM_REGULAR),
	list("Balaclava (Green)", 12, /obj/item/clothing/mask/rebreather/scarf/green, null, VENDOR_ITEM_REGULAR),
	list("Balaclava (Tan)", 12, /obj/item/clothing/mask/rebreather/scarf/tan, null, VENDOR_ITEM_REGULAR),
	list("Balaclava (Grey)", 12, /obj/item/clothing/mask/rebreather/scarf/gray, null, VENDOR_ITEM_REGULAR),
	list("Wrap (Grey)", 12, /obj/item/clothing/mask/rebreather/scarf/tacticalmask, null, VENDOR_ITEM_REGULAR),
	list("Wrap (Red)", 12, /obj/item/clothing/mask/rebreather/scarf/tacticalmask/red, null, VENDOR_ITEM_REGULAR),
	list("Wrap (Green)", 12, /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, null, VENDOR_ITEM_REGULAR),
	list("Wrap (Tan)", 12, /obj/item/clothing/mask/rebreather/scarf/tacticalmask/tan, null, VENDOR_ITEM_REGULAR),
	list("Wrap (Black)", 12, /obj/item/clothing/mask/rebreather/scarf/tacticalmask/black, null, VENDOR_ITEM_REGULAR),
	list("Scarf", 12, /obj/item/clothing/mask/tornscarf, null, VENDOR_ITEM_REGULAR),
	list("Scarf (Green)", 12, /obj/item/clothing/mask/tornscarf/green, null, VENDOR_ITEM_REGULAR),
	list("Scarf (Snow)", 12, /obj/item/clothing/mask/tornscarf/snow, null, VENDOR_ITEM_REGULAR),
	list("Scarf (Desert)", 12, /obj/item/clothing/mask/tornscarf/desert, null, VENDOR_ITEM_REGULAR),
	list("Scarf (Urban)", 12, /obj/item/clothing/mask/tornscarf/urban, null, VENDOR_ITEM_REGULAR),
	list("Scarf (Black)", 12, /obj/item/clothing/mask/tornscarf/black, null, VENDOR_ITEM_REGULAR),

	list("SUIT", 0, null, null, null),
	list("Bomber Jacket, Brown", 12, /obj/item/clothing/suit/storage/bomber, null, VENDOR_ITEM_REGULAR),
	list("Bomber Jacket, Black", 12, /obj/item/clothing/suit/storage/bomber/alt, null, VENDOR_ITEM_REGULAR),
	list("External Webbing", 12, /obj/item/clothing/suit/storage/webbing, null, VENDOR_ITEM_REGULAR),
	list("Utility Vest", 12, /obj/item/clothing/suit/storage/utility_vest, null, VENDOR_ITEM_REGULAR),
	list("Hazard Vest(Orange)", 12, /obj/item/clothing/suit/storage/hazardvest, null, VENDOR_ITEM_REGULAR),
	list("Hazard Vest(Blue)", 12, /obj/item/clothing/suit/storage/hazardvest/blue, null, VENDOR_ITEM_REGULAR),
	list("Hazard Vest(Yellow)", 12, /obj/item/clothing/suit/storage/hazardvest/yellow, null, VENDOR_ITEM_REGULAR),
	list("Hazard Vest(Black)", 12, /obj/item/clothing/suit/storage/hazardvest/black, null, VENDOR_ITEM_REGULAR),
	list("Synthetic's Snow Suit", 12, /obj/item/clothing/suit/storage/snow_suit/synth, null, VENDOR_ITEM_REGULAR),
	list("USCM Service Jacket", 12, /obj/item/clothing/suit/storage/jacket/marine/service, null, VENDOR_ITEM_REGULAR),
	list("USCM MP Service Jacket", 12, /obj/item/clothing/suit/storage/jacket/marine/service/mp, null, VENDOR_ITEM_REGULAR),
	list("USCM Light Flak Jacket", 12, /obj/item/clothing/suit/storage/jacket/marine/pilot, null, VENDOR_ITEM_REGULAR),
	list("USCM Vehicle Crewman Jacket", 12, /obj/item/clothing/suit/storage/jacket/marine/service/tanker, null, VENDOR_ITEM_REGULAR),
	list("Windbreaker, Brown", 12, /obj/item/clothing/suit/storage/windbreaker/windbreaker_brown, null, VENDOR_ITEM_REGULAR),
	list("Windbreaker, Grey", 12, /obj/item/clothing/suit/storage/windbreaker/windbreaker_gray, null, VENDOR_ITEM_REGULAR),
	list("Windbreaker, Green", 12, /obj/item/clothing/suit/storage/windbreaker/windbreaker_green, null, VENDOR_ITEM_REGULAR),
	list("Windbreaker, First Responder", 12, /obj/item/clothing/suit/storage/windbreaker/windbreaker_fr, null, VENDOR_ITEM_REGULAR),
	list("Windbreaker, Exploration", 12, /obj/item/clothing/suit/storage/windbreaker/windbreaker_covenant, null, VENDOR_ITEM_REGULAR),
	list("Labcoat", 12, /obj/item/clothing/suit/storage/labcoat, null, VENDOR_ITEM_REGULAR),
	list("Labcoat, Researcher", 12, /obj/item/clothing/suit/storage/labcoat/researcher, null, VENDOR_ITEM_REGULAR),
	list("Quartermaster Jacket", 12, /obj/item/clothing/suit/storage/jacket/marine/RO, null, VENDOR_ITEM_REGULAR),
	list("Bio Suit", 12, /obj/item/clothing/suit/storage/synthbio, null, VENDOR_ITEM_REGULAR),
	list("Black Suit Jacket", 12, /obj/item/clothing/suit/storage/jacket/marine/corporate/black, null, VENDOR_ITEM_REGULAR),
	list("Brown Suit Jacket", 12, /obj/item/clothing/suit/storage/jacket/marine/corporate/brown, null, VENDOR_ITEM_REGULAR),
	list("Blue Suit Jacket", 12, /obj/item/clothing/suit/storage/jacket/marine/corporate/blue, null, VENDOR_ITEM_REGULAR),
	list("Brown Vest", 12, /obj/item/clothing/suit/storage/jacket/marine/vest, null, VENDOR_ITEM_REGULAR),
	list("Tan Vest", 12, /obj/item/clothing/suit/storage/jacket/marine/vest/tan, null, VENDOR_ITEM_REGULAR),
	list("Grey Vest", 12, /obj/item/clothing/suit/storage/jacket/marine/vest/grey, null, VENDOR_ITEM_REGULAR),
	list("USCM Poncho (Mission-Specific Camo)", 12, /obj/item/clothing/accessory/poncho, null, VENDOR_ITEM_REGULAR),
	list("USCM Poncho (Green)", 12, /obj/item/clothing/accessory/poncho/green, null, VENDOR_ITEM_REGULAR),
	list("USCM Poncho (Brown)", 12, /obj/item/clothing/accessory/poncho/brown, null, VENDOR_ITEM_REGULAR),
	list("USCM Poncho (Black)", 12, /obj/item/clothing/accessory/poncho/black, null, VENDOR_ITEM_REGULAR),
	list("USCM Poncho (Blue)", 12, /obj/item/clothing/accessory/poncho/blue, null, VENDOR_ITEM_REGULAR),
	list("USCM Poncho (Purple)", 12, /obj/item/clothing/accessory/poncho/purple, null, VENDOR_ITEM_REGULAR),


	list("BACKPACK", 0, null, null, null),
	list("Backpack, Industrial", 12, /obj/item/storage/backpack/industrial, null, VENDOR_ITEM_REGULAR),
	list("Backpack, USCM Medical", 12, /obj/item/storage/backpack/marine/medic, null, VENDOR_ITEM_REGULAR),
	list("Chestrig, Technician", 12, /obj/item/storage/backpack/marine/satchel/tech, null, VENDOR_ITEM_REGULAR),
	list("Satchel, USCM", 12, /obj/item/storage/backpack/marine/satchel, null, VENDOR_ITEM_REGULAR),
	list("Satchel, Leather", 12, /obj/item/storage/backpack/satchel, null, VENDOR_ITEM_REGULAR),
	list("Satchel, Medical", 12, /obj/item/storage/backpack/satchel/med, null, VENDOR_ITEM_REGULAR),
	list("USCM RTO Pack", 12, /obj/item/storage/backpack/marine/satchel/rto, null, VENDOR_ITEM_REGULAR),
	list("USCM Welderpack", 12, /obj/item/storage/backpack/marine/engineerpack, null, VENDOR_ITEM_REGULAR),
	list("USCM Weldersatchel", 12, /obj/item/storage/backpack/marine/engineerpack/satchel, null, VENDOR_ITEM_REGULAR),
	list("USCM Welder Chestrig", 12, /obj/item/storage/backpack/marine/engineerpack/welder_chestrig, null, VENDOR_ITEM_REGULAR),

	list("OTHER", 0, null, null, null),
	list("Red Armband", 6, /obj/item/clothing/accessory/armband, null, VENDOR_ITEM_REGULAR),
	list("Purple Armband", 6, /obj/item/clothing/accessory/armband/science, null, VENDOR_ITEM_REGULAR),
	list("Yellow Armband", 6, /obj/item/clothing/accessory/armband/engine, null, VENDOR_ITEM_REGULAR),
	list("Green Armband", 6, /obj/item/clothing/accessory/armband/medgreen, null, VENDOR_ITEM_REGULAR),
	list("Blue Tie", 6, /obj/item/clothing/accessory/blue, null, VENDOR_ITEM_REGULAR),
	list("Green Tie", 6, /obj/item/clothing/accessory/green, null, VENDOR_ITEM_REGULAR),
	list("Black Tie", 6, /obj/item/clothing/accessory/black, null, VENDOR_ITEM_REGULAR),
	list("Gold Tie", 6, /obj/item/clothing/accessory/gold, null, VENDOR_ITEM_REGULAR),
	list("Red Tie", 6, /obj/item/clothing/accessory/red, null, VENDOR_ITEM_REGULAR),
	list("Purple Tie", 6, /obj/item/clothing/accessory/purple, null, VENDOR_ITEM_REGULAR),
	list("Stethoscope", 6, /obj/item/clothing/accessory/stethoscope, null, VENDOR_ITEM_REGULAR),
	list("Dress Gloves", 6, /obj/item/clothing/gloves/marine/dress, null, VENDOR_ITEM_REGULAR),

))

/obj/structure/machinery/cm_vending/clothing/synth/snowflake
	name = "\improper W-Y Synthetic Conformity Unit"
	desc = "A vendor with a large snowflake on it. Provided by Wey-Yu Fashion Division(TM)."
	icon_state = "snowflake"
	show_points = TRUE
	use_snowflake_points = TRUE
	vendor_theme = VENDOR_THEME_COMPANY
	req_access = list(ACCESS_MARINE_SYNTH)
	vendor_role = list(JOB_SYNTH, JOB_SYNTH_SURVIVOR, JOB_WORKING_JOE, JOB_UPP_SUPPORT_SYNTH, JOB_CMB_SYN, JOB_PMC_SYNTH)

	vend_delay = 1 SECONDS

/obj/structure/machinery/cm_vending/clothing/synth/snowflake/get_listed_products(mob/user)
	return GLOB.cm_vending_clothing_synth_snowflake


//------------EXPERIMENTAL TOOLS---------------
/obj/structure/machinery/cm_vending/own_points/experimental_tools
	name = "\improper W-Y Experimental Tools Vendor"
	desc = "A smaller vendor hooked up to a cache of specially provisioned, experimental tools and equipment provided by the Wey-Yu Research and Development Division(TM). Handle with care."
	icon_state = "robotics"
	available_points = 0
	available_points_to_display = 0
	vendor_theme = VENDOR_THEME_COMPANY
	req_access = list(ACCESS_MARINE_SYNTH)
	vendor_role = list(JOB_SYNTH)

/obj/structure/machinery/cm_vending/own_points/experimental_tools/redeem_token(obj/item/coin/marine/token, mob/user)
	if(token.token_type == VEND_TOKEN_SYNTH)
		if(user.drop_inv_item_to_loc(token, src))
			available_points = 30
			available_points_to_display = available_points
			to_chat(user, SPAN_NOTICE("You insert \the [token] into \the [src]."))
			return TRUE
	return ..()

/obj/structure/machinery/cm_vending/own_points/experimental_tools/get_listed_products(mob/user)
	return GLOB.cm_vending_synth_tools

GLOBAL_LIST_INIT(cm_vending_synth_tools, list(
	list("Autocompressor", 15, /obj/item/clothing/suit/auto_cpr, null, VENDOR_ITEM_REGULAR),
	list("Backpack Firefighting Watertank", 15, /obj/item/reagent_container/glass/watertank/atmos, null, VENDOR_ITEM_REGULAR),
	list("Breaching Hammer", 15, /obj/item/weapon/twohanded/breacher/synth, null, VENDOR_ITEM_REGULAR),
	list("Compact Nailgun kit", 15, /obj/effect/essentials_set/cnailgun, null, VENDOR_ITEM_REGULAR),
	list("Crew Monitor", 15, /obj/item/tool/crew_monitor, null, VENDOR_ITEM_REGULAR),
	list("Experimental Meson Goggles", 15, /obj/item/clothing/glasses/night/experimental_mesons, null, VENDOR_ITEM_REGULAR),
	list("Maintenance Jack", 15, /obj/item/maintenance_jack, null, VENDOR_ITEM_REGULAR),
	list("Portable Dialysis Machine", 15, /obj/item/tool/portadialysis, null, VENDOR_ITEM_REGULAR),
	list("Telescopic Baton", 15, /obj/item/weapon/telebaton, null, VENDOR_ITEM_REGULAR),
))

//------------EXPERIMENTAL TOOL KITS---------------
/obj/effect/essentials_set/cnailgun
	spawned_gear_list = list(
		/obj/item/weapon/gun/smg/nailgun/compact,
		/obj/item/ammo_magazine/smg/nailgun,
		/obj/item/ammo_magazine/smg/nailgun,
		/obj/item/storage/belt/gun/m4a3/nailgun,
	)
