/*
ExileServer_BigfootsShipWrecks_AttackHeli
by Crito @Vanaheim Gaming Servers
Discord: https://discord.gg/WEFzqPa
*/

private ["_bs_MarkerPosition","_bsAttackHGroup","_bs_AttackHPos","_bs_AttackHSpawn","_bs_AttackHeli","_bs_AttackEmpty",
		 "_bsAttackUnit","_bs_AHWP1Pos","_bs_AHWP2Pos","_bs_AHWP3Pos","_bs_AHWP4Pos","_bs_AHWP1","_bs_AHWP2","_bs_AHWP3","_bs_AHWP4",
		 "_bs_AttackHeading","_bsAttackHArray","_bs_HAttackGroup"];

_bs_MarkerPosition = _this select 0;
_bsAttackHArray = _this select 1;

_bsAttackHGroup = createGroup BS_ai_side;

_bs_AttackHPos = [_bs_MarkerPosition,1500,1500,0,2] call BIS_fnc_findSafePos;
_bs_AttackHSpawn = _bs_AttackHPos; 

_bs_AttackHeli = createVehicle [BS_AttackHeliType, _bs_AttackHSpawn, [], 0, "FLY"];
_bs_AttackHeading = _bs_AttackHSpawn getDir _bs_MarkerPosition;
_bs_AttackHeli setDir _bs_AttackHeading;

_bs_AttackHeli engineOn true;
_bs_AttackHeli setFuel 1;
_bs_AttackHeli setVehicleAmmo 1;
_bs_AttackHeli flyInHeight 75;

_bs_AttackEmpty = [BS_AttackHeliType, false] call BIS_fnc_crewCount;

for "_i" from 1 to _bs_AttackEmpty do
	{
		_bsAttackUnit = [_bsAttackHGroup] call ExileServer_BigfootsShipwrecks_AIUnitSpawn;
		_bsAttackUnit moveInAny _bs_AttackHeli;
		[_bsAttackUnit] joinSilent _bsAttackHGroup;

		_bsAttackUnit setSkill ["aimingAccuracy", 1.00];
		_bsAttackUnit setSkill ["aimingShake", 1.00];
		_bsAttackUnit setSkill ["aimingSpeed", 1.00];
		_bsAttackUnit setSkill ["endurance", 1.00];
		_bsAttackUnit setSkill ["spotDistance", 0.80];
		_bsAttackUnit setSkill ["spotTime", 0.85];
		_bsAttackUnit setSkill ["courage", 1.00];
		_bsAttackUnit setSkill ["reloadSpeed", 1.00];
		_bsAttackUnit setSkill ["commanding", 1.00];
		_bsAttackUnit setSkill ["general", 1.00];
	};

_bs_HAttackGroup = group _bsAttackUnit;

		_bs_HAttackGroup setCombatMode "RED";
		_bs_HAttackGroup setBehaviour "AWARE";

_bs_HAttackGroup addVehicle _bs_AttackHeli;
	
			while {(count (waypoints _bs_HAttackGroup)) > 0} do 
			{
				deleteWaypoint ((waypoints _bs_HAttackGroup) #0)
			};
		
		
		_bs_AHWP1Pos = _bs_MarkerPosition;
		_bs_AHWP2Pos = [_bs_MarkerPosition, 1, 200, 0, 2] call BIS_fnc_findSafePos;
		_bs_AHWP3Pos = [_bs_MarkerPosition, 1, 200, 0, 2] call BIS_fnc_findSafePos;
		_bs_AHWP4Pos = [_bs_MarkerPosition, 1, 200, 0, 2] call BIS_fnc_findSafePos;
		
		_bs_AHWP1 = _bs_HAttackGroup addWaypoint [_bs_MarkerPosition, 1];
		_bs_AHWP1 setWaypointSpeed "FULL";
		_bs_AHWP1 setWaypointType "MOVE";
			
		
			while {(count (waypoints _bs_HAttackGroup)) > 0} do 
			{
				deleteWaypoint ((waypoints _bs_HAttackGroup) #0)
			};
	
	
		_bs_AHWP2 = _bs_HAttackGroup addWaypoint [_bs_AHWP2Pos, 1];
		_bs_AHWP2 setWaypointSpeed "FULL";
		_bs_AHWP2 setWaypointType "MOVE";
		
		_bs_AHWP3 = _bs_HAttackGroup addWaypoint [_bs_AHWP3Pos, 1];
		_bs_AHWP3 setWaypointSpeed "FULL";
		_bs_AHWP3 setWaypointType "MOVE";
			
		_bs_AHWP4 = _bs_HAttackGroup addWaypoint [_bs_AHWP4Pos, 1];
		_bs_AHWP4 setWaypointSpeed "FULL";
		_bs_AHWP4 setWaypointType "CYCLE";

_bsAttackHArray append [_bs_HAttackGroup];