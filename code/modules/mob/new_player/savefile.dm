#define SAVEFILE_VERSION_MIN	5
#define SAVEFILE_VERSION_MAX	6

datum/preferences/proc/savefile_path(mob/user)
	return "data/player_saves/[copytext(user.ckey, 1, 2)]/[user.ckey]/preferences.sav"

datum/preferences/proc/savefile_save(mob/user)
	if (IsGuestKey(user.key))
		return 0

	var/savefile/F = new /savefile(src.savefile_path(user))
//	var/version
//	F["version"] >> version

	F["version"] << SAVEFILE_VERSION_MAX

	F["real_name"] << src.real_name
	F["name_is_always_random"] << src.be_random_name

	F["gender"] << src.gender
	F["age"] << src.age

	//Job data
	F["job_civilian_high"] << src.job_civilian_high
	F["job_civilian_med"] << src.job_civilian_med
	F["job_civilian_low"] << src.job_civilian_low

	F["job_medsci_high"] << src.job_medsci_high
	F["job_medsci_med"] << src.job_medsci_med
	F["job_medsci_low"] << src.job_medsci_low

	F["job_engsec_high"] << src.job_engsec_high
	F["job_engsec_med"] << src.job_engsec_med
	F["job_engsec_low"] << src.job_engsec_low

	//Body data
	F["hair_red"] << src.r_hair
	F["hair_green"] << src.g_hair
	F["hair_blue"] << src.b_hair
	F["facial_red"] << src.r_facial
	F["facial_green"] << src.g_facial
	F["facial_blue"] << src.b_facial
	F["skin_tone"] << src.s_tone
	F["hair_style_name"] << src.h_style
	F["facial_style_name"] << src.f_style
	F["eyes_red"] << src.r_eyes
	F["eyes_green"] << src.g_eyes
	F["eyes_blue"] << src.b_eyes
	F["blood_type"] << src.b_type
	F["underwear"] << src.underwear

	F["be_special"] << src.be_special
	F["UI"] << src.UI
	F["midis"] << src.midis
	F["ooccolor"] << src.ooccolor
	F["lastchangelog"] << src.lastchangelog

	return 1

// loads the savefile corresponding to the mob's ckey
// if silent=true, report incompatible savefiles
// returns 1 if loaded (or file was incompatible)
// returns 0 if savefile did not exist

datum/preferences/proc/savefile_load(mob/user)
	if(IsGuestKey(user.key))	return 0

	var/path = savefile_path(user)
	if(!fexists(path))	return 0

	var/savefile/F = new /savefile(path)

	var/version = null
	F["version"] >> version

	if (isnull(version) || version < SAVEFILE_VERSION_MIN || version > SAVEFILE_VERSION_MAX)
		fdel(path)
		alert(user, "Your savefile was incompatible with this version and was deleted.")
		return 0

	F["real_name"] >> src.real_name
	F["gender"] >> src.gender
	F["age"] >> src.age

	F["hair_red"] >> src.r_hair
	F["hair_green"] >> src.g_hair
	F["hair_blue"] >> src.b_hair
	F["facial_red"] >> src.r_facial
	F["facial_green"] >> src.g_facial
	F["facial_blue"] >> src.b_facial
	F["skin_tone"] >> src.s_tone
	F["hair_style_name"] >> src.h_style
	F["facial_style_name"] >> src.f_style
	F["eyes_red"] >> src.r_eyes
	F["eyes_green"] >> src.g_eyes
	F["eyes_blue"] >> src.b_eyes
	F["blood_type"] >> src.b_type
	F["underwear"] >> src.underwear
	F["name_is_always_random"] >> src.be_random_name
	F["midis"] >> src.midis
	F["ooccolor"] >> src.ooccolor
	F["lastchangelog"] >> src.lastchangelog
	F["UI"] >> src.UI
	F["be_special"] >> src.be_special

	F["job_civilian_high"] >> src.job_civilian_high
	F["job_civilian_med"] >> src.job_civilian_med
	F["job_civilian_low"] >> src.job_civilian_low

	F["job_medsci_high"] >> src.job_medsci_high
	F["job_medsci_med"] >> src.job_medsci_med
	F["job_medsci_low"] >> src.job_medsci_low

	F["job_engsec_high"] >> src.job_engsec_high
	F["job_engsec_med"] >> src.job_engsec_med
	F["job_engsec_low"] >> src.job_engsec_low

	//NOTE: Conversion things go inside this if statement
	//When updating the save file remember to add 1 to BOTH the savefile constants
	//Also take the old conversion things that no longer apply out of this if
	if(version && version < SAVEFILE_VERSION_MAX)
		convert_hairstyles() // convert version 4 hairstyles to version 5

	style_to_datum() // convert f_style and h_style to /datum

	return 1

#undef SAVEFILE_VERSION_MAX
#undef SAVEFILE_VERSION_MIN



datum/preferences/proc/convert_hairstyles()
	// convert hairstyle names from old savefiles
	switch(h_style)
		if("Balding")
			h_style = "Balding Hair"
		if("Fag")
			h_style = "Flow Hair"
		if("Jensen Hair")
			h_style = "Adam Jensen Hair"
		if("Kusangi Hair")
			h_style = "Kusanagi Hair"

	switch(f_style)
		if("Watson")
			f_style = "Watson Mustache"
		if("Chaplin")
			f_style = "Square Mustache"
		if("Selleck")
			f_style = "Selleck Mustache"
		if("Van Dyke")
			f_style = "Van Dyke Mustache"
		if("Elvis")
			f_style = "Elvis Sideburns"
		if("Abe")
			f_style = "Abraham Lincoln Beard"
		if("Hipster")
			f_style = "Hipster Beard"
		if("Hogan")
			f_style = "Hulk Hogan Mustache"
		if("Jensen Goatee")
			f_style = "Adam Jensen Beard"
	return

