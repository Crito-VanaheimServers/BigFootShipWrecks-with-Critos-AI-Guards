/*
ExileServer_BigfootsShipwrecks_BoatSpawn
by Crito @Vanaheim Gaming Servers
Discord: https://discord.gg/WEFzqPa
*/

private ["_bsSpawnPos","_bsBoatClass","_cratePosition","_bsBoat","_bsDriver","_bsWP1Pos","_bsWP2Pos","_bsWP3Pos","_bsWP4Pos","_bsWP1",
		 "_bsWP2","_bsWP3","_bsWP4","_bsTurret","_bsTurretCrew","_bsGunner","_bsGunnerCrew","_bsGroupID",
		 "_wreckage","_bsGroup","_wreckageVars","_bsBoatArray","_bs_Boatgrp","_crate","_bsCommander","_bsCommanderCrew"];

		_bsSpawnPos = _this select 0;
		_bsGroup = _this select 1;
		_cratePosition = _this select 2;
		_bsGroupID = _this select 3;		
		_wreckage = _this select 4;
		_bsBoatArray = _this select 5;
		_crate = _this select 6;
		
		_bsBoatClass = selectRandom BS_boats;

		_bsBoat = createVehicle [_bsBoatClass, _bsSpawnPos, [], 0, "NONE"];
				
		_bsBoatArray append [_bsBoat];
		
		missionNamespace setVariable ["bsBoatArray",_bsBoatArray];

		_bsBoat engineOn true;
		_bsBoat lock 0;
		_bsBoat setFuel 1;
		_bsBoat setVehicleAmmo 1;
		
		_bsGroup addVehicle _bsBoat;	

		/// creates missionNamespace variable and passes the group ID as well as ai and boats to modify or delete on mission completion
		_wreckageVars = [_bsGroup,_wreckage,_bsBoatArray,_crate];	//Added by Ketanna
		missionNamespace setVariable [_bsGroupID,_wreckageVars];	//Added by Ketanna
	
		_bsDriver = [_bsGroup] call ExileServer_BigfootsShipwrecks_AIUnitSpawn;
		_bsDriver moveInDriver _bsBoat;
		[_bsDriver] joinSilent _bsGroup;
		
		_bsCommander = (fullCrew [_bsBoat, "commander", true]);
		{
			if (isNull(_x select 0))then 
			{
				_bsCommanderCrew = [_bsGroup] call ExileServer_BigfootsShipwrecks_AIUnitSpawn;
				_bsCommanderCrew moveInTurret [_bsBoat, _x select 3];
				[_bsCommanderCrew] joinSilent _bsGroup;
			};
		}forEach _bsCommander;

		_bsTurret = (fullCrew [_bsBoat, "turret", true]);	
		{
			if (isNull(_x select 0))then 
			{
				_bsTurretCrew = [_bsGroup] call ExileServer_BigfootsShipwrecks_AIUnitSpawn;
				_bsTurretCrew moveInTurret [_bsBoat, _x select 3];
				[_bsTurretCrew] joinSilent _bsGroup;
			};
		}forEach _bsTurret;
	
		_bsGunner = (fullCrew [_bsBoat, "gunner", true]);	
		{
			if (isNull(_x select 0))then 
			{
				_bsGunnerCrew = [_bsGroup] call ExileServer_BigfootsShipwrecks_AIUnitSpawn;
				_bsGunnerCrew moveInTurret [_bsBoat, _x select 3];
				[_bsGunnerCrew] joinSilent _bsGroup;
			};
		}forEach _bsGunner;

		_bs_Boatgrp = group _bsBoat;
		
		for "_i" from (count (waypoints _bs_Boatgrp) -1) to 0 step -1 do
		{
			deleteWaypoint [_bs_Boatgrp, _i];
		};

		_bsWP1Pos = [_cratePosition] call ExileServer_BigfootsShipwrecks_BoatWayPoints;
		_bsWP2Pos = [_cratePosition] call ExileServer_BigfootsShipwrecks_BoatWayPoints;
		_bsWP3Pos = [_cratePosition] call ExileServer_BigfootsShipwrecks_BoatWayPoints;
		_bsWP4Pos = [_cratePosition] call ExileServer_BigfootsShipwrecks_BoatWayPoints;

		_bsWP1 = _bs_Boatgrp addWaypoint [_bsWP1Pos, 1];
		_bsWP1 setWaypointSpeed "FULL";
		_bsWP1 setWaypointType "MOVE";
			
		_bsWP2 = _bs_Boatgrp addWaypoint [_bsWP2Pos, 1];
		_bsWP2 setWaypointSpeed "FULL";
		_bsWP2 setWaypointType "MOVE";
		
		_bsWP3 = _bs_Boatgrp addWaypoint [_bsWP3Pos, 1];
		_bsWP3 setWaypointSpeed "FULL";
		_bsWP3 setWaypointType "MOVE";
			
		_bsWP4 = _bs_Boatgrp addWaypoint [_bsWP4Pos, 1];
		_bsWP4 setWaypointSpeed "FULL";
		_bsWP4 setWaypointType "CYCLE";

		_bs_Boatgrp setCombatMode "RED";
		_bs_Boatgrp setBehaviour "AWARE";