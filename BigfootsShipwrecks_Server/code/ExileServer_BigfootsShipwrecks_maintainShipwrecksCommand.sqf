if (!isServer) exitWith {};

private["_coords", "_countWrecks", "_crateClaimMessageRadius", "_i", "_isPlayerInRange", "_markerId", "_markerPosition", 
		"_message", "_showCrateClaimMessage","_BS_WreckRespawn","_wreckcounter"];

	_countWrecks = _this select 0;
	_crateClaimMessageRadius = _this select 1;
	_showCrateClaimMessage = _this select 2;

	for "_i" from 1 to _countWrecks do
	{
		_markerId = _i call ExileServer_BigfootsShipwrecks_getWreckIdForSpawnCountIndexQuery;
		_markerPosition = getMarkerPos _markerId;

		if(!isNil "_markerPosition") then 
		{
			_isPlayerInRange = [_markerPosition, _crateClaimMessageRadius] call ExileClient_util_world_isAlivePlayerInRange;

			if (_isPlayerInRange ) then 
			{
				format["Crate found by players at [%1].", _markerPosition] call ExileServer_BigfootsShipwrecks_util_logCommand;

				[_markerId] call ExileServer_BigfootsShipWrecks_AIPlayerAtCrate;

				if (_showCrateClaimMessage) then 
				{
					_coords = mapGridPosition _markerPosition;
					_message = format ["Player found ship wreck at %1.", _coords];

					["Info", "Shipwreck loot found!", _message] call ExileServer_BigfootsShipwrecks_sendClientNotificationCommand;
					["systemChatRequest", [_message]] call ExileServer_system_network_send_broadcast;
				};
				
				deleteMarker _markerId;			

				[_markerId,_markerPosition] spawn ExileServer_BigfootsShipwrecks_AICleanUP_Monitor; //added by Crito
												
				BS_count_shipwrecks = BS_count_shipwrecks - 1;	//added by Crito
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
