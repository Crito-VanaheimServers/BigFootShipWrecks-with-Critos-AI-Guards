/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */

if (!isServer) exitWith {};

"Starting initialization..." call ExileServer_BigfootsShipwrecks_util_logCommand;

// Spawns shipwrecks with loot crates at server start
[
    BS_count_shipwrecks, // Wreck count
    [ // Positioning (center, min, max)
        BS_locations_center,
        BS_locations_distance_min,
        BS_locations_distance_max
    ], 
    BS_class_wreckage, // Wreckage class
    BS_class_crate, // Crate class
    BS_loot_itemCargo, // Crate cargo
    BS_loot_count_poptabs_seed, // Crate poptabs seed (generated random poptab amount)
    BS_debug_logCrateFill, // Enable logging of items added to crate (true/false)
	BS_max_boats //Max Boats Guarding Shipwreck
] call ExileServer_BigfootsShipwrecks_spawnShipwrecksCommand;

// Handles marker cleanup and player detection
if (ExileServerShipWreckthread isEqualTo -1) then
{
	[
		10, 
		ExileServer_BigfootsShipwrecks_maintainShipwrecksCommand, 
		[
			BS_count_shipwrecks, 
			BS_player_showCrateClaimMessageRadius,
			BS_player_showCrateClaimMessage
		], 
		true
	] call ExileServer_system_thread_addTask;
	
	"Finished initialization." call ExileServer_BigfootsShipwrecks_util_logCommand;
	
	["systemChatRequest", ["Bigfoot's Shipwrecks Initialized"]] call ExileServer_system_network_send_broadcast;
};
true
