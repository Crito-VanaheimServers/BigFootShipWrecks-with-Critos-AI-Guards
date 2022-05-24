/*
ExileServer_BigfootsShipwrecks_AIStart
by Crito @Vanaheim Gaming Servers
Discord: https://discord.gg/WEFzqPa
*/

private ["_bsGroup","_bsSpawnPos","_bsGroupID","_wreckage","_bsBoat","_bsCrate","_crate"];

	_wreckagePosition = _this select 0;
	_maxBoats = _this select 1;
	_cratePosition = _this select 2;
	_bsGroupID = _this select 3;
	_wreckage = _this select 4;
	_crate = _this select 5;

	createCenter BS_ai_side;
	_bsGroup = createGroup BS_ai_side;

	_bsBoat = [];
	missionnamespace setvariable ["bsBoatArray",_bsBoat];	//Added by Ketanna
	
	for "_i" from 1 to _maxBoats do
	{	
		_bsBoatArray = missionnamespace getvariable ["bsBoatArray",_bsBoat];	//Added by Ketanna
		_bsSpawnPos = [_wreckagePosition, 1, BS_max_dist, 0, 2, 0, 0] call BIS_fnc_findSafePos;			
		[_bsSpawnPos, _bsGroup, _cratePosition, _bsGroupID, _wreckage,_bsBoatArray,_crate] call ExileServer_BigfootsShipwrecks_BoatSpawn;
	};
	
	
