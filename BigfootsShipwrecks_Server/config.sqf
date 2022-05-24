/*
bigfoots-shipwrecks Config
by Bigfoot
AI config added by Crito @Vanaheim Gaming Servers Discord: https://discord.gg/WEFzqPa
Crate distances and water depth settings added by Ketanna @Kronik Servers
*/

BS_MapMarker = "o_naval"; // sets map marker used

BS_debug_logCrateFill = true; // True to log items spawned in crates to server .RPT, usually right after [Display #24]

BS_player_showCrateClaimMessage = true; // True to show toast and chat notification with coordinates to all players when any players are 
										//close to crate
										
BS_player_showCrateClaimMessageRadius = 30; // Players must be this close (in meters) to trigger serverwide chat/toast notification

BSMonitorRadius = 500;	//Radius for player to trigger mission monitor basically starting the mission.
						//set range high enough to trigger heli events if using them for best effect.
								
BS_Player_nearCrate = 15; //distance Player needs to be to crate for AI if still alive and in boats to jump out and attack them at crate

BS_class_crate = "Exile_Container_SupplyBox"; // Class of loot crate.

BS_class_wreckage = "Land_UWreck_FishingBoat_F"; // Class of shipwreck.

BS_AllowRespawn = true;	// turns shipwreck respawns on/off

BS_AllowRespawn_Timer = 1800; //time in seconds for respawn of next ship wreck from time first set spawned in.
							  //If first set is not complete respawn will not happen until they are completed.

BSCleanTime = 600;	//time in seconds a triggered mission will clear off map if player abandonds it and no players are near it.

BS_RangeCleanUp = 1000;	//Range in meters the player has to be away from location of completed wreck for clean up to happen.
						//If player and crate get past this range BSCleanTime will be skipped and clean up happens imeadiatly.

BS_count_shipwrecks = 2; // Total wrecks to spawn on server start. This will also be the toatal number that will respawn once all current 
						 // wrecks have been completed.

//useMovingCrateMarker = true;	//NOT IN USE WORK IN PROGRESS	// if true a marker will show location of crate when mission marker dissapears and update on move until past
									// the BS_RangeCleanUp where the clean up of mission takes place Or the BSCleanTime timer cleans up mission.

//////////////////AI Config Added by Crito @Vanaheim Gaming Servers (aka VGS). Discord: https://discord.gg/WEFzqPa /////////////////////// 

BS_max_boats = 2;	//Max number of boats to guard the shipwreck.
BS_ai_side = east;	//Side the AI will Be on. east, west, independent, or civilian.
BS_max_dist = 100;	//max distance AI will roam around the position of the wreck.
BS_Respect_Pay = 50; //Amount of respect player gets for each AI kill.

/////AI Skill/////
BS_aimingAccuracy = 0.01;
BS_aimingShake = 0.01;
BS_aimingSpeed = 1.00;
BS_endurance = 1.00;
BS_spotDistance = 1.00;
BS_spotTime = 1.00;
BS_courage = 1.00;
BS_reloadSpeed = 0.50;
BS_commanding = 1.00;
BS_general = 1.00;
/////////////////

/////AI Gear/////
BS_uniform = "U_B_Wetsuit";
BS_vest = "V_RebreatherB";
BS_weapon = "arifle_SDAR_F";
BS_faceWear = "G_B_Diving";
//BS_backPack = "";	//not used. if you want to use this remove the // and put in backpack class name.
					//then go to BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_AIUnitSpawn.sqf
					//and remove the // from lines 21 and 51. Save all changes and pbo back up.
					
//BS_headGear = ""; //not used. if you want to use this remove the // and put in backpack class name.
					//then go to BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_AIUnitSpawn.sqf
					//and remove the // from lines 20 and 52. Save all changes and pbo back up.

BS_attackHeliChance = 75; //% chance to have an attack heli spawn in to attack players who try to approach in a heli.
						  //set to 0 if you do not want attack helis to spawn.
						  //this will not trigger unless it detects entities of air in range.
						  //added due to players using attack helis to wipe mission out
								
BS_AttackHeliType = "O_Heli_Attack_02_black_F";	//class of heli to spawn for attack event.

UsingAdvancedRappelling = true;	//if you have Advanced Rappelling Mod installed you can set this to true for this event
								//If not using Advanced Rappelling !!!!!!Do Not Set To True!!!!!!!!! Things will break!!!!!!!!!!!!!!

BS_RappelHeliChance = 50;		//if UsingAdvancedRappelling set to true for % chance to have a heli spawn in and bring in rappelling troops.

BS_RappelHeliType = "B_Heli_Transport_01_F"; //class of heli to spawn for rappel event.
//////////////////End of AI Config////////////////////////////////////////////////////////////////////////////////////////////////////////

Bs_crate_seperation_distance = 10000; // sets the min distance shipwrecks can spawn near each other. be aware of the size of your map
									 //to ensure the loop can complete.

///////!!!!!!!!!!!!!!!!!WARNING DO NOT SET THESE TWO SETTINGS EXACTLY THE SAME OR THINGS WILL BREAK!!!!!!!!!!!!!!!!!!!!!
////////////// Water Depth check for crate spawns added by Ketanna  ////////////////
BS_locations_WaterDepth_max = 50;  // the max water depth you want your crates to spawn in 
BS_locations_WaterDepth_MIN = 25; // the min water depth you want your crates to spawn in
///////!!!!!!!!!!!!!!!!!WARNING DO NOT SET THESE TWO SETTINGS EXACTLY THE SAME OR THINGS WILL BREAK!!!!!!!!!!!!!!!!!!!!!

BS_loot_enablePoptabs = true; // True to spawn random number of poptabs in crates, otherwise false.
BS_loot_count_poptabs_seed = [3000, 5000, 18000]; // min/mid/max, so will spawn around 5k most of the time with small chance to be much closer to 18k and small chance to be closer to 3k

BS_loot_itemCargo = // Items to put in loot crate.
[   // [class (if array, picks one random item), guaranteed amount, possible random additional amount, % chance of spawning additional random amount]
    ["Exile_Item_SafeKit", 0, 1, 100], // 100% of the time 0-1 safes will spawn.
    ["Exile_Weapon_AKS_Gold", 0, 2, 100], // 100% of the time 0-2 safes will spawn.
    ["Exile_Magazine_30Rnd_762x39_AK", 0, 2, 100],
    ["Exile_Weapon_TaurusGold", 1, 1, 100], // One pistol guaranteed, with 100% chance to spawn random pistol (so really 50%)
    ["Exile_Magazine_6Rnd_45ACP", 0, 3, 100],
    ["arifle_SDAR_F", 1, 1, 50],
    ["20Rnd_556x45_UW_mag", 1, 2, 100], // One mag guaranteed, with 100% chance to spawn between 0-2 more mags 
    [["V_RebreatherB", "V_RebreatherIA", "V_RebreatherIR"], 1, 1, 100],
    [["G_Diving", "G_B_Diving", "G_O_Diving", "G_I_Diving"], 1, 1, 100],
    [["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR"], 1, 2, 100],
    ["optic_tws", 0, 1, 25],
    ["Exile_Item_ConcreteFloorKit", 0, 1, 100],
    ["H_HelmetO_ViperSP_hex_F", 0, 1, 25],
    ["Exile_Item_FortificationUpgrade", 0, 2, 100],
    ["Exile_Item_Knife", 0, 1, 25],
    ["ToolKit", 0, 1, 25],
    ["Exile_Item_Wrench", 0, 1, 25],
    ["Exile_Item_ConcreteWallKit", 0, 1, 100],
    ["Laserdesignator_02_ghex_F", 0, 1, 25],
    ["Exile_Item_Rope", 1, 1, 100],
    ["Laserdesignator_03", 0, 1, 25],
    ["Laserdesignator_01_khk_F", 0, 1, 25],
    ["Laserdesignator", 0, 1, 25],
    ["Laserbatteries", 0, 1, 25],
    ["optic_tws_mg", 0, 1, 25],
    ["H_HelmetO_ViperSP_ghex_F", 0, 1, 25],
    ["Exile_Item_Vishpirin", 1, 3, 100],
    ["Laserdesignator_02", 0, 1, 50],
    ["SatchelCharge_Remote_Mag", 1, 2, 100],
    ["Exile_Item_CodeLock", 0, 1, 25],
    ["optic_Nightstalker", 0, 1, 25],
    ["B_Static_Designator_01_F", 0, 1, 25],
    ["Exile_Item_DuctTape", 1, 2, 100],
    ["Exile_Item_Beer", 0, 1, 25],
    ["Exile_Item_Defibrillator", 1, 2, 100],
    ["Exile_Item_EMRE", 0, 2, 100],
    ["Exile_Item_PlasticBottleFreshWater", 0, 2, 100],
    ["Exile_Item_RubberDuck", 0, 2, 14],
	["Exile_Magazine_Battery", 0, 1, 25],
	["Exile_Item_Grinder", 0, 1, 25],
	["Exile_Item_Laptop", 0, 1, 25],
	["Exile_Item_Knife", 0, 1, 25],
	["Exile_Item_ThermalScannerPro", 0, 1, 25],
	["Exile_Item_BreachingCharge_Wood", 0, 1, 25],
	["Exile_Item_BreachingCharge_Metal", 0, 1, 25],
	["Exile_Item_BreachingCharge_BigMomma", 0, 1, 25],
	["Exile_Headgear_GasMask", 0, 1, 25]
]; 

BS_boats =
[
	"I_Boat_Armed_01_minigun_F",
	"I_Boat_Transport_01_F",
	"I_C_Boat_Transport_02_F",
	"I_C_Boat_Transport_01_F",
	"B_Boat_Armed_01_minigun_F",
	"O_Boat_Armed_01_hmg_F"
	
	//////////RHS///////////////////////////////
	//"rhsgref_hidf_rhib",					////
	//"rhsusf_mkvsoc",			 			////
	//"rhsgref_hidf_assault_boat" 			////
	////////////////////////////////////////////
	
	/////CUP MOD BOATS///////////////
	//"CUP_B_RHIB_HIL",          //// Works
	//"CUP_I_RHIB_RACS"			 //// Works
	
	///////////////////////////////// 
	//"CUP_B_RHIB2Turret_HIL",   //// DO not work causes errors....
	//"CUP_B_Frigate_ANZAC",     //// DO not work causes errors....
	//"CUP_B_Zodiac_USMC",       //// DO not work causes errors....
	//"CUP_O_ZUBR_CSAT_T",       //// DO not work causes errors....
	//"CUP_O_ZUBR_SLA",          //// DO not work causes errors....
	//"CUP_I_Frigate_AAF",       //// DO not work causes errors....
	//"CUP_I_Frigate_RACS",      //// DO not work causes errors....
	//"CUP_I_RHIB2Turret_RACS",  //// DO not work causes errors....
	/////////////////////////////////
	
	/////Hellenic Armed Forces Mod (HAFM) - NAVY/////////// 
	//"HAFM_ABurke",							      ///// DO not work causes errors....
	//"HAFM_MEKO_TN",		                          ///// DO not work causes errors....
	//"HAFM_MEKO_HN",	                              ///// DO not work causes errors....
	//"HAFM_FREMM",                                  ///// DO not work causes errors....
	//"HAFM_Russen",                                   ///// DO not work causes errors....
	//"HAFM_Replenishment",                           ///// DO not work causes errors....
	//"HAFM_Admiral",                                 ///// DO not work causes errors....
	//"HAFM_BUYAN",                                   ////	DO not work causes errors....
	//"HAFM_Replenishment_OPF",                       ///// DO not work causes errors....
	//"HAFM_052C",		                              ///// DO not work causes errors....
	//"HAFM_052D",                                    ///// DO not work causes errors....
	//"HAFM_Russen_IND",                               ///// DO not work causes errors....
	//"HAFM_CB90_BLU",	                              ///// DO not work causes errors....
	//"HAFM_GunBoat_BLU",                             ///// DO not work causes errors....
	//"HAFM_CB90",                                    ///// DO not work causes errors....
	//"HAFM_GunBoat"                                 ///// DO not work causes errors....
	///////////////////////////////////////////////////////
];

///////////////////////////////////////////DO NOT CHANGE ANYTHING BELOW THIS LINE//////////////////////////////////////////////////////
BS_respawn_count = BS_count_shipwrecks;
BS_locations_crateWreckOffset = 10; // Distance from wreck to spawn crate.
// BS_locations_center = [14912.4,15108.7,0]; // Center o fmap from which to spawn wrecks, on Altis this is in the central bay

private _WorldSizeAdj = worldsize/2;
BS_locations_center = [_WorldSizeAdj, _WorldSizeAdj,0];

BS_locations_distance_min = 0; // Minimum distance from BS_location_center to spawn crate.

//BS_locations_distance_max = 13000; // Maximum distance from BS_locations_center to spawn crate. Careful putting this too high or they will spawn off the map!
BS_locations_distance_max = _WorldSizeAdj;

BS_LastShipWreckSpawned = diag_tickTime;
BS_AllMrkrNames = [];

//publicVariable "BS_debug_logCrateFill";
//publicVariable "BS_player_showCrateClaimMessage";
//publicVariable "BS_player_showCrateClaimMessageRadius";
//publicVariable "BS_class_crate";
//publicVariable "BS_class_wreckage";
//publicVariable "BS_count_shipwrecks";
//publicVariable "BS_locations_crateWreckOffset";
//publicVariable "BS_locations_center";
//publicVariable "BS_locations_distance_min";
//publicVariable "BS_locations_distance_max";
//publicVariable "BS_loot_enablePoptabs";
//publicVariable "BS_loot_count_poptabs_seed";
//publicVariable "BS_loot_itemCargo";
//publicVariable "BS_boats";
//publicVariable "BS_max_boats";
//publicVariable "BS_ai_side";
//publicVariable "BS_max_dist";
//publicVariable "BS_aimingAccuracy";
//publicVariable "BS_aimingShake";
//publicVariable "BS_aimingSpeed";
//publicVariable "BS_endurance";
//publicVariable "BS_spotDistance";
//publicVariable "BS_spotTime";
//publicVariable "BS_courage";
//publicVariable "BS_reloadSpeed";
//publicVariable "BS_commanding";
//publicVariable "BS_general";
//publicVariable "BS_uniform";
//publicVariable "BS_vest";
//publicVariable "BS_weapon";
//publicVariable "BS_faceWear";
//publicVariable "BS_headGear";
//publicVariable "BS_backPack";
//publicVariable "BS_Respect_Pay";
//publicVariable "BS_BoatMissions";
//publicVariable "BS_respawn_count";
//publicVariable "BS_RangeCleanUp";
