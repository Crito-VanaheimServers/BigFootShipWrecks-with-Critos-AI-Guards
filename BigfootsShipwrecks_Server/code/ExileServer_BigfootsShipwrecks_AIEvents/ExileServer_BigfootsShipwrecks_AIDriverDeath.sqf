/*
ExileServer_BigfootsShipwrecks_AIDriverDeath
by Crito @Vanaheim Gaming Servers
Discord: https://discord.gg/WEFzqPa
*/

private ["_bsBoatCrew","_bsBoat","_bsGroup","_bsDriver","_bsWreck","_bsBoatPos","_bsWreckage","_bsWreckWP","_bsWP1Guard","_bsWP2Guard","_bsWP3Guard",
		 "_bsWP4Guard","_bsWP1","_bsWP2","_bsWP3","_bsWP4","_bsWrecktoASL","_bsGroupScuba"];

_bsBoatCrew = _this select 0;
_bsBoat = _this select 1;
_bsDriver = driver _bsBoat;
_bsGroup = group _bsBoat;
_bsBoatPos = getpos _bsBoat;
_bsWreck = nearestObjects [_bsBoatPos, [BS_class_wreckage], 1000, false];
_bsWreckage = _bsWreck select 0;
_bsWreckWP = getPosASL _bsWreckage;

	{
		doGetOut _x;
		_x leaveVehicle _bsBoat;
		_x moveTo _bsWreckWP;
	}forEach _bsBoatCrew;

	_bsBoatCrew allowGetIn false;