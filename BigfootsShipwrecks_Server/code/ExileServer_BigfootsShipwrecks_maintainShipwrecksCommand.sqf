if (!isServer) exitWith {};

private["_coords", "_countWrecks", "_crateClaimMessageRadius", "_i", "_isPlayerInRange", "_markerId", "_markerPosition", 
		"_message", "_showCrateClaimMessage"];

	_countWrecks = _this select 0;
	_crateClaimMessageRadius = _this select 1;
	_showCrateClaimMessage = _this select 2;

	for "_i" from 1 to _countWrecks do
	{
		_markerId = _i call ExileServer_BigfootsShipwrecks_getWreckIdForSpawnCountIndexQuery;
		_markerPosition = getMarkerPos _markerId;
		
		if((!isNil "_markerPosition") && (markerColor _markerId == "ColorBlue")) then 
		{
			_bsMonitorDetect = [_markerPosition, BSMonitorRadius] call ExileServer_BigfootsShipwrecks_isAlivePlayerInRange;

			if (_bsMonitorDetect) then 
			{
					_markerId setMarkerColor "ColorRed";
					[_markerId,_markerPosition,_showCrateClaimMessage,_crateClaimMessageRadius] spawn ExileServer_BigfootsShipwrecks_Mission_Monitor; //added by Crito
			};
		};
	};			

	if (BS_count_shipwrecks <= 0 && BS_AllowRespawn) then 	//added by Ketanna
	{
		
		if(diag_tickTime - BS_LastShipWreckSpawned >= BS_AllowRespawn_Timer) then
		{	
			BS_count_shipwrecks = BS_respawn_count;		//added by Crito
			[] call ExileServer_BigfootsShipwrecks_initialize;	//added by Crito
		};
	};
