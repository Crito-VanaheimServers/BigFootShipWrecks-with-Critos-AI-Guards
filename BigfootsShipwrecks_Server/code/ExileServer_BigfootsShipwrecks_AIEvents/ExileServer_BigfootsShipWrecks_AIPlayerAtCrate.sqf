/*
ExileServer_BigfootsShipWrecks_AIPlayerAtCrate
by Crito @Vanaheim Gaming Servers
Discord: https://discord.gg/WEFzqPa
*/

private ["_bsGroupID","_wreckageVars","_bsWreckage","_bsBoatArray","_bsWreckagePos","_bsGroup","_bsBoatCrew","_bsCrateThief","_bsCrateThiefPos"];

_bsGroupID = _this select 0;
_wreckageVars = missionNamespace getVariable [_bsGroupID,objNull];
_bsWreckage = _wreckageVars select 1;
_bsBoatArray = _wreckageVars select 2;
_bsWreckagePos = getpos _bsWreckage;
_bsCrateThief = nearestObject [_bsWreckagePos, "CAManBase"];
_bsCrateThiefPos = getpos _bsCrateThief;

	{
		_bsGroup = group _x;
		_bsBoatCrew = crew _x;
	}forEach _bsBoatArray;
	
if (({alive _x} count (units _bsGroup) > 0) && (count _bsBoatCrew > 0)) then
	{
			{
				 _x engineOn false;
				 
				{
					moveOut _x;
					_x leaveVehicle (assignedVehicle _x);
					_x moveTo _bsCrateThiefPos;
				}forEach (units _bsGroup);
			}forEach _bsBoatArray;

			_bsBoatCrew allowGetIn false;
			_bsGroup reveal _bsCrateThief;
			
			[_bsGroup, group _bsCrateThief, 5] spawn BIS_fnc_stalk;
						
	};