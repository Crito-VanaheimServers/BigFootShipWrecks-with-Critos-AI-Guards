/**
 * Based off of ExileClient_util_world_isAlivePlayerInRange
 * Modified to block out plane detection in shipwrecks
 */
 
private["_BSposition", "_BSrange", "_BShasPlayersInRange"];
_BSposition = _this select 0;
_BSrange = _this select 1;
_BSPlayersInRange = false;
{
	if (!(vehicle _x isKindOf "Air")) then
	{
		if (alive _x && {(_x distance2D _BSposition) <= _BSrange}) exitWith
		{
			_BSPlayersInRange = true;
		};
	};		
}
forEach allPlayers;
_BSPlayersInRange