/*
ExileServer_BigfootsShipWrecks_Rapel
by Crito @Vanaheim Gaming Servers
Discord: https://discord.gg/WEFzqPa
*/

private ["_bsRHGroup","_bs_MarkerPosition","_bs_RappelHPos","_bs_RappelHSpawn","_bs_RappelHeli","_bsRappelGuardPos",
		 "_bs_Empty","_bsRHeliUnit","_bs_AHWP1","_bs_AHWP2","_bs_Heading","_emptyCargo","_bsCargoGroup","_bsCargo","_bs_RHWP1",
		 "_bs_RHWP2","_bs_RappelPos","_bsRappelArray","_bs_WreckObj","_bs_HGunGroup","_bs_HCargoGroup"];

if !(UsingAdvancedRappelling == true) exitWith {};

_bsRHGroup = createGroup BS_ai_side;

_bs_MarkerPosition = _this select 0;
_bsRappelArray = _this select 1;
		
_bs_RappelHPos = [_bs_MarkerPosition,1500,1500,0,2] call BIS_fnc_findSafePos;
_bs_RappelHSpawn = _bs_RappelHPos; 

_bs_RappelHeli = createVehicle [BS_RappelHeliType, _bs_RappelHSpawn, [], 0, "FLY"];
_bs_Heading = _bs_RappelHSpawn getDir _bs_MarkerPosition;
_bs_RappelHeli setDir _bs_Heading;
_bs_RappelPos = ATLToASL _bs_MarkerPosition;

_bs_WreckObj = nearestObject [_bs_MarkerPosition, "Land_UWreck_FishingBoat_F"];
_bsRappelGuardPos = getPosASL _bs_WreckObj;

_bs_RappelHeli engineOn true;
_bs_RappelHeli setFuel 1;
_bs_RappelHeli setVehicleAmmo 1;
_bs_RappelHeli flyInHeight 50;

_bs_Empty = [BS_RappelHeliType, false] call BIS_fnc_crewCount;

	for "_i" from 1 to _bs_Empty do
		{
			_bsRHeliUnit = [_bsRHGroup] call ExileServer_BigfootsShipwrecks_AIUnitSpawn;
			_bsRHeliUnit moveInAny _bs_RappelHeli;
			[_bsRHeliUnit] joinSilent _bsRHGroup;
			
			_bsRHeliUnit setSkill ["aimingAccuracy", 0.01];
			_bsRHeliUnit setSkill ["aimingShake", 0.01];
			_bsRHeliUnit setSkill ["aimingSpeed", 1.00];
			_bsRHeliUnit setSkill ["endurance", 1.00];
			_bsRHeliUnit setSkill ["spotDistance", 1.00];
			_bsRHeliUnit setSkill ["spotTime", 1.00];
			_bsRHeliUnit setSkill ["courage", 1.00];
			_bsRHeliUnit setSkill ["reloadSpeed", 0.50];
			_bsRHeliUnit setSkill ["commanding", 1.00];
			_bsRHeliUnit setSkill ["general", 1.00];
		};
_bs_HGunGroup = group _bsRHeliUnit;

//_bs_HGunGroup selectLeader ((units _bs_HGunGroup) select 0);

_bs_HGunGroup addVehicle _bs_RappelHeli;

		_bs_HGunGroup setCombatMode "RED";
		_bs_HGunGroup setBehaviour "AWARE";
	
_emptyCargo = _bs_RappelHeli emptyPositions "cargo";
_bsCargoGroup = createGroup BS_ai_side;

	for "_i" from 1 to _emptyCargo do
	{
		_bsCargo = [_bsCargoGroup] call ExileServer_BigfootsShipwrecks_AIUnitSpawn;
		_bsCargo moveInCargo _bs_RappelHeli;
		[_bsCargo] joinSilent _bsCargoGroup;
		
			_bsCargo setSkill ["aimingAccuracy", 0.01];
			_bsCargo setSkill ["aimingShake", 0.01];
			_bsCargo setSkill ["aimingSpeed", 1.00];
			_bsCargo setSkill ["endurance", 1.00];
			_bsCargo setSkill ["spotDistance", 1.00];
			_bsCargo setSkill ["spotTime", 1.00];
			_bsCargo setSkill ["courage", 1.00];
			_bsCargo setSkill ["reloadSpeed", 0.50];
			_bsCargo setSkill ["commanding", 1.00];
			_bsCargo setSkill ["general", 1.00];
	};

_bs_HCargoGroup = group _bsCargo;

		_bs_HCargoGroup setCombatMode "RED";
		_bs_HCargoGroup setBehaviour "AWARE";

	//_bs_HCargoGroup selectLeader ((units _bs_HCargoGroup) select 0);

	while {(count (waypoints _bs_HGunGroup)) > 0} do 
	{
		deleteWaypoint ((waypoints _bs_HGunGroup) #0)
	};
	
	while {(count (waypoints _bs_HCargoGroup)) > 0} do 
	{
		deleteWaypoint ((waypoints _bs_HCargoGroup) #0)
	};

	[_bs_RappelHeli,75,_bs_RappelPos] call AR_Rappel_All_Cargo;
		
	while {(count (waypoints _bs_HGunGroup)) > 0} do 
	{
		deleteWaypoint ((waypoints _bs_HGunGroup) #0)
	};
	
	_bs_RHWP2 = _bs_HGunGroup addWaypoint [_bs_RappelPos, 75];
	_bs_RHWP2 setWaypointType "LOITER";
	_bs_RHWP2 setWaypointLoiterType "CIRCLE";
	_bs_RHWP2 setWaypointSpeed "LIMITED";

	_bs_HCargoGroup move _bsRappelGuardPos;

_bsRappelArray append [_bs_HGunGroup,_bs_HCargoGroup];