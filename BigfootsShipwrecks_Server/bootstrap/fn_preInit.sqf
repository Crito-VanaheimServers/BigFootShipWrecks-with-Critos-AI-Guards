/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */
 
private["_code"];

{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ['ExileServer_BigfootsShipwrecks_addItemsToCrateCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_addItemsToCrateCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_addMoneyToCrateCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_addMoneyToCrateCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_createShipwreckMarkerCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_createShipwreckMarkerCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_getWreckIdForSpawnCountIndexQuery', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_getWreckIdForSpawnCountIndexQuery.sqf'],
    ['ExileServer_BigfootsShipwrecks_initialize', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_initialize.sqf'],
    ['ExileServer_BigfootsShipwrecks_maintainShipwrecksCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_maintainShipwrecksCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_sendClientNotificationCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_sendClientNotificationCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_setupCrateCommand',
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_setupCrateCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_spawnShipwrecksCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_spawnShipwrecksCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_util_logCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_util_logCommand.sqf'],
	['ExileServer_BigfootsShipwrecks_AIStart',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_AIStart.sqf'],
	['ExileServer_BigfootsShipwrecks_BoatSpawn',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_BoatSpawn.sqf'],
	['ExileServer_BigfootsShipwrecks_AIUnitSpawn',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_AIUnitSpawn.sqf'],
	['ExileServer_BigfootsShipwrecks_BoatWayPoints',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_BoatWayPoints.sqf'],
	['ExileServer_BigfootsShipwrecks_RespectPayout',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_RespectPayout.sqf'],
	['ExileServer_BigfootsShipwrecks_Mission_Monitor',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_Mission_Monitor.sqf'],
	['ExileServer_BigfootsShipwrecks_AIDriverDeath',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_AIEvents\ExileServer_BigfootsShipwrecks_AIDriverDeath.sqf'],
	['ExileServer_BigfootsShipWrecks_AIPlayerAtCrate',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_AIEvents\ExileServer_BigfootsShipWrecks_AIPlayerAtCrate.sqf'],
	['ExileServer_BigfootsShipwrecks_CrateMarkerCommand',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_CrateMarkerCommand.sqf'],
	['ExileServer_BigfootsShipWrecks_AttackHeli',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_AIEvents\ExileServer_BigfootsShipWrecks_AttackHeli.sqf'],
	['ExileServer_BigfootsShipWrecks_Rapel',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_AIEvents\ExileServer_BigfootsShipWrecks_Rapel.sqf'],
	['ExileServer_BigfootsShipwrecks_isAlivePlayerInRange',
		'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_isAlivePlayerInRange.sqf']

];

"PreInit finished" call ExileServer_BigfootsShipwrecks_util_logCommand;
