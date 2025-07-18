//////////////////
///Trash Parent///
//////////////////
/obj/item/trash
	icon = 'icons/obj/items/trash.dmi'
	w_class = SIZE_SMALL
	desc = "This is rubbish."
	garbage = TRUE

//////////////
///Wrappers///
//////////////

/obj/item/trash/barcardine
	name = "barcardine bar wrapper"
	desc = "An empty wrapper from a barcardine bar. You notice the inside has several medical labels. You're not sure if you care or not about that."
	icon_state = "barcardine_trash"

/obj/item/trash/boonie
	name = "boonie bar wrapper"
	desc = "A minty green wrapper. Reminds you of another terrible decision involving minty green, but you can't remember what..."
	icon_state = "boonie_trash"

/obj/item/trash/burger
	name = "Burger wrapper"
	icon_state = "burger"
	desc = "A greasy plastic film that once held a Cheeseburger. Packaged by the Weyland-Yutani Corporation."

/obj/item/trash/buritto
	name = "Burrito wrapper"
	icon_state = "burrito"
	desc = "A foul-smelling plastic film that once held a microwave burrito. Packaged by the Weyland-Yutani Corporation."

/obj/item/trash/candy
	name = "Candy"
	icon_state= "candy"

/obj/item/trash/cheesie
	name = "Cheesie honkers"
	gender = PLURAL
	icon_state = "cheesie_honkers"

/obj/item/trash/chips
	name = "Chips"
	gender = PLURAL
	icon_state = "chips"

/obj/item/trash/chunk
	name = "chunk bar box"
	desc = "An empty box from a chunk bar. Significantly less heavy."
	icon_state = "chunk_trash"

/obj/item/trash/chunk/hunk
	name = "hunk bar crate"
	desc = "An empty crate from a hunk bar. Tremendously less heavy."
	icon_state = "hunk_trash"

/obj/item/trash/eat
	name = "EAT bar wrapper"
	icon_state = "eat"

/obj/item/trash/hotdog
	name = "Hotdog wrapper"
	icon_state = "hotdog"
	desc = "A musty plastic film that once held a hotdog. Packaged by the Weyland-Yutani Corporation."

/obj/item/trash/kepler
	name = "Kepler wrapper"
	icon_state = "kepler"

/obj/item/trash/kepler/flamehot
	name = "Kepler Flamehot wrapper"
	icon_state = "flamehotkepler"

/obj/item/trash/liquidfood
	name = "\improper \"LiquidFood\" ration"
	icon_state = "liquidfood"

/obj/item/trash/pistachios
	name = "Pistachios pack"
	icon_state = "pistachios_pack"

/obj/item/trash/popcorn
	name = "Popcorn"
	icon_state = "popcorn"

/obj/item/trash/raisins
	name = "4no raisins"
	gender = PLURAL
	icon_state= "4no_raisins"

/obj/item/trash/semki
	name = "Semki pack"
	icon_state = "semki_pack"

/obj/item/trash/sosjerky
	name = "Scaredy's Private Reserve Beef Jerky"
	icon_state = "sosjerky"

/obj/item/trash/syndi_cakes
	name = "Syndi cakes"
	gender = PLURAL
	icon_state = "syndi_cakes"

/obj/item/trash/uscm_mre
	name = "\improper crumbled USCM MRE"
	desc = "It has done its part for the USCM. Have you?"
	icon = 'icons/obj/items/storage/mre.dmi'
	icon_state = "mealpackempty"

/obj/item/trash/upp_mre
	name = "\improper crumbled UPP IRP"
	desc = "Hungry soldier is a dead soldier."
	icon = 'icons/obj/items/storage/mre.dmi'
	icon_state = "upp_mealpackempty"

/obj/item/trash/twe_mre
	name = "\improper crumbled TWE ORP"
	desc = "Hunger never sets on the Empire..."
	icon = 'icons/obj/items/storage/mre.dmi'
	icon_state = "twe_mealpackempty"

/obj/item/trash/pmc_mre
	name = "\improper crumbled PMC CFR"
	desc = "For a piece of crumbled wrapper, it sure has a high market cost."
	icon = 'icons/obj/items/storage/mre.dmi'
	icon_state = "pmc_mealpackempty"

/obj/item/trash/wy_mre
	name = "\improper crumbled W-Y ration"
	desc = "Reminder, trashing on a workplace is punished with a cut in your daily ration."
	icon = 'icons/obj/items/storage/mre.dmi'
	icon_state = "wy_mealpackempty"

/obj/item/trash/merc_mre
	name = "\improper crumbled FSR ration"
	desc = "Who left it in here? Civillians? Hikers? Military collectors? Undercover mercenaries?"
	icon = 'icons/obj/items/storage/mre.dmi'
	icon_state = "mealpackempty"

/obj/item/trash/hdr_mre
	name = "\improper crumbled HDR"
	desc = "Someone is going to live another day."
	icon = 'icons/obj/items/storage/mre.dmi'
	icon_state = "hdr_mealpackempty"

/obj/item/trash/waffles
	name = "Waffles"
	gender = PLURAL
	icon_state = "waffles"

/obj/item/trash/wy_chips_pepper
	name = "Weyland-Yutani Pepper Chips"
	gender = PLURAL
	icon_state = "wy_chips_pepper"
	desc = "An oily empty bag that once held Weyland-Yutani Pepper Chips."

//////////////////////
///Ciagarette Butts///
//////////////////////

/obj/item/trash/cigbutt
	name = "cigarette butt"
	desc = "A manky old cigarette butt."
	icon = 'icons/obj/items/clothing/masks.dmi'
	icon_state = "cigbutt"
	w_class = SIZE_TINY
	throwforce = 1

/obj/item/trash/cigbutt/Initialize()
	. = ..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)
	apply_transform(turn(transform,rand(0,360)))

/obj/item/trash/cigbutt/ucigbutt
	desc = "A manky old unfiltered cigarette butt."
	icon_state = "ucigbutt"


/obj/item/trash/cigbutt/bcigbutt
	desc = "A manky old cigarette butt in a fancy black package."
	icon_state = "bcigbutt"

/obj/item/trash/cigbutt/cigarbutt
	name = "cigar butt"
	desc = "A manky old cigar butt."
	icon_state = "cigarbutt"

////////////
///Dishes///
////////////

/obj/item/trash/plate
	name = "Plate"
	icon_state = "plate"

/obj/item/trash/ceramic_plate
	name = "ceramic plate"
	icon_state = "ceramic_plate"
	desc = "A ceramic plate, it doesn't seem like it's done its patriotic duty of being a stand for food yet. Now that you look at it, this might make a good throwing weapon..."
	throw_range = 5
	throw_speed = SPEED_VERY_FAST
	throwforce = 5

/obj/item/trash/ceramic_plate/launch_impact(atom/hit_atom)
	. = ..()
	playsound(get_turf(src), "shatter", 50, TRUE)
	visible_message(SPAN_DANGER("\The [src] shatters into a thousand tiny fragments!"))
	qdel(src)

/obj/item/trash/snack_bowl
	name = "Snack bowl"
	icon_state = "snack_bowl"

/obj/item/trash/tray
	name = "Tray"
	icon_state = "tray"

/obj/item/trash/USCMtray
	name = "\improper USCM Tray"
	desc = "Finished with its tour of duty."
	icon = 'icons/obj/items/food_canteen.dmi'
	icon_state = "tray"

/obj/item/trash/UPPtray
	name = "\improper UPP Tray"
	desc = "Finished with its tour of duty."
	icon = 'icons/obj/items/food.dmi'
	icon_state = "upp_tray"


//////////
///Misc///
//////////

/obj/item/trash/candle
	name = "candle"
	icon = 'icons/obj/items/candle.dmi'
	icon_state = "candle4"

/obj/item/trash/c_tube
	name = "cardboard tube"
	desc = "A tube... of cardboard."
	icon = 'icons/obj/items/items.dmi'
	icon_state = "c_tube"
	throwforce = 1
	w_class = SIZE_SMALL
	throw_speed = SPEED_VERY_FAST
	throw_range = 5

/obj/item/trash/grenade
	name = "spent M47 smoke grenade"
	desc = "A used-up smoke grenade canister. This is trash."
	icon = 'icons/obj/items/weapons/grenade.dmi'
	icon_state = "grenade_spent"

/obj/item/trash/grenade/gas
	name = "spent gas grenade"
	desc = "A used gas grenade canister, no way to tell what was once inside it now. This is trash."
	icon_state = "flashbang2_spent"

/obj/item/trash/grenade/gas/marine
	name = "spent M66 tear gas grenade"
	desc = "A used tear gas grenade. This is trash."
	icon_state = "grenade_spent"

/obj/item/trash/grenade/Initialize()
	. = ..()
	animation_spin(5, 1,)

/obj/item/trash/grenade/animation_spin(speed = 5, loop_amount = -1, clockwise = TRUE, sections = 3, angular_offset = 0, pixel_fuzz = 0)
	clockwise = pick(TRUE, FALSE)
	angular_offset = rand(360)
	return ..()

/obj/item/trash/tooth
	name = "tooth"
	desc = "Has seen heavy use, that's for sure."
	icon = 'icons/obj/items/items.dmi'
	icon_state = "tooth"
	w_class = SIZE_TINY

/obj/item/trash/tooth/Initialize()
	. = ..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)
	apply_transform(turn(transform,rand(0,360)))
