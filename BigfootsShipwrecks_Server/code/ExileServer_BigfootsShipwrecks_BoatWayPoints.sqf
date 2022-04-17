/*
ExileServer_BigfootsShipwrecks_BoatWayPoints
by Crito @Vanaheim Gaming Servers
Discord: https://discord.gg/WEFzqPa
*/

private ["_bsMinDist","_bsMaxDist","_bsWayPoint"];

_cratePosition = _this select 0;
_bsMinDist = 1;
_bsMaxDist = BS_max_dist;

_bsWayPoint = [_cratePosition, _bsMinDist, _bsMaxDist, 0, 2] call BIS_fnc_findSafePos;

_bsWayPoint