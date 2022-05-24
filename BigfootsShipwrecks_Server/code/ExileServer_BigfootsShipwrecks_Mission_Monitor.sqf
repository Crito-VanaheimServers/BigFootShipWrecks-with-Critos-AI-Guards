/*
ExileServer_BigfootsShipwrecks_AICleanUP_Monitor
by Ketanna
*/

	private ["_bsGroupID","_markerPosition","_wreckageVars","_bsRappelVars","_wreckage","_bsBoatArray","_bs_cleanup","_bs_playerCleanRange",
			 "_bsCrate","_bs_crateCleanRange","_bsLoopTime","_bsMrkrId","_isPlayerAtCrate","_bsmrkrPos","_bsCompMarker","_bs_MarkerName",
			 "_bs_AttackHeliSent","_bs_EnemyAir","_bsCleanTime","_bs_CleanTimer","_bs_RappelHeliSent","_bs_Enemy","_bs_RappelHeliRoll",
			 "_bs_AttackHeliRoll","_bsNewMrkrPos","_showCrateClaimMessage","_crateClaimMessageRadius","_bsClaimMsg","_bs_BoatCrewgrp",
			 "_bsRappelObj","_isPlayerInRange","_coords","_message","_bsRappelArray","_bs_HGunGroup","_bsCargoGroup","_bsAttackHObj",
			 "_bsAttackHArray"];
	
	_bsGroupID = _this select 0;	
	_markerPosition = _this select 1;
	_showCrateClaimMessage = _this select 2;
	_crateClaimMessageRadius = _this select 3;

	//_bs_MarkerName = [] call ExileServer_BigfootsShipwrecks_CrateMarkerCommand;
	//_bsMrkrId = _bs_MarkerName;
	
	/// retrieves mission namespace variables saved previously on mission creation to use below for mission cleanup ///
	_wreckageVars = missionNamespace getVariable [_bsGroupID,objNull];
	//_bsGroup = _wreckageVars select 0;
	_wreckage = [_wreckageVars select 1];
	_bsBoatArray = _wreckageVars select 2;
	_bsCrate = _wreckageVars select 3;
	
	{
		_bs_BoatCrewgrp = group _x;
	}forEach _bsBoatArray;

	_bs_cleanup = false;
	_bsClaimMsg = false;
	_bs_RappelHeliRoll = false;
	_bs_AttackHeliRoll = false;
	_bs_AttackHeliSent = false;
	_bs_RappelHeliSent = false;
	
	_bsRappelArray = [];
	
	_bsAttackHArray = [];
	
	_bs_CleanTimer = 0;
	
		while {_bs_cleanup == false} do	//added by Crito
		{
			_bsLoopTime = time;
			
			_isPlayerInRange = [_markerPosition, _crateClaimMessageRadius] call ExileServer_BigfootsShipwrecks_isAlivePlayerInRange;

			if ((_isPlayerInRange) && (_bsClaimMsg == false)) then 
			{
					format["Crate found by players at [%1].", _markerPosition] call ExileServer_BigfootsShipwrecks_util_logCommand;
									
					if (_showCrateClaimMessage) then 
					{
						_coords = mapGridPosition _markerPosition;
						_message = format ["Player found ship wreck at %1.", _coords];
		
						["Info", "Shipwreck loot found!", _message] call ExileServer_BigfootsShipwrecks_sendClientNotificationCommand;
						["systemChatRequest", [_message]] call ExileServer_system_network_send_broadcast;
					};
					_bsClaimMsg = true;
			};
			
			_isPlayerAtCrate = [_markerPosition, BS_Player_nearCrate] call ExileServer_BigfootsShipwrecks_isAlivePlayerInRange;

			_bs_playerCleanRange = [_markerPosition, BS_RangeCleanUp] call ExileServer_BigfootsShipwrecks_isAlivePlayerInRange; //added by Crito
				
			if (_bs_playerCleanRange) then 
			{
				_bs_CleanTimer = time;
			};
				
			_bs_crateCleanRange = getpos _bsCrate; //added by Crito
			
			//if (useMovingCrateMarker == true) then
			//{
			//_bsmrkrPos = _bs_crateCleanRange;
			//
			//_bsCompMarker = createMarker [_bsMrkrId, _bsmrkrPos];
			//_bsCompMarker setMarkerShape "ICON";
			//_bsCompMarker setMarkerType "loc_Box";
			//_bsCompMarker setMarkerColor "ColorRed";
			//};
						
			if (_isPlayerAtCrate ) then 
			{
				[_bsGroupID] call ExileServer_BigfootsShipWrecks_AIPlayerAtCrate;				
			};
			
			_bs_EnemyAir = _markerPosition nearEntities [["Helicopter"], 1500];
			{
				if (side _x != East) then
				{
					if ((_bs_AttackHeliRoll == false) && BS_attackHeliChance >= (random 100)) then
					{
						if (count _bs_EnemyAir > 0)then
						{
							//_bsAttackHArray = missionnamespace getvariable ["bsAttackHArray",_bsAttackHObj];
							[_markerPosition,_bsAttackHArray] call ExileServer_BigfootsShipWrecks_AttackHeli;
							_bs_AttackHeliSent = true;
						};
						_bs_AttackHeliRoll = true;
					};
				};
			}forEach _bs_EnemyAir;
			
			_bs_Enemy = _markerPosition nearEntities [["Ship","CAManBase"], 1500];
			{
				if (side _x != East) then
				{
					if ((_bs_RappelHeliRoll == false) && BS_RappelHeliChance >= (random 100)) then
					{
						if (count _bs_Enemy > 0)then
						{
							//_bsRappelArray = missionnamespace getvariable ["bsRappelArray",_bsRappelObj];
							[_markerPosition,_bsRappelArray] call ExileServer_BigfootsShipWrecks_Rapel;
							_bs_RappelHeliSent = true;
						};
						_bs_RappelHeliRoll = true;
					};
				};
			}forEach _bs_Enemy;

			if ((!_bs_playerCleanRange) && ((_bs_crateCleanRange distance _markerPosition) > BS_RangeCleanUp)) then  //added by Crito
			{
				deleteMarker _bsGroupID;
				
				//if ((useMovingCrateMarker == true) && (!isNil "_bsmrkrPos")) then
				//{
				//	deleteMarker _bsMrkrId;
				//};
				
				//// deletes all mission ai ///
				{
					deleteVehicle _x;
				}forEach (units _bs_BoatCrewgrp);
				
				/// deletes mission objects ///
				{
					deleteVehicle _x;
				}forEach _wreckage;
				
				//// turns all boat engines off ///
				{
					_x engineOn false;
				}foreach _bsBoatArray;
				
				if (_bs_RappelHeliSent != false) then
				{	
					_bs_HGunGroup = _bsRappelArray select 0;
					_bs_HCargoGroup = _bsRappelArray select 1;
										
					{
						deleteVehicle _x;
					}forEach (units _bs_HGunGroup);
					
					{
						deleteVehicle _x;
					}forEach (units _bs_HCargoGroup);
					
				};
				
				if (_bs_AttackHeliSent != false) then
				{	
					_bs_HAttackGroup = _bsAttackHArray select 0;
										
					{
						deleteVehicle _x;
					}forEach (units _bs_HAttackGroup);
				};

				_bs_cleanup = true;
								
				BS_count_shipwrecks = BS_count_shipwrecks - 1;	//added by Crito

			};
			
			_bsCleanTime = time - _bs_CleanTimer;

			if (_bsCleanTime >= BSCleanTime) then
			{
				deleteMarker _bsGroupID;
				
				//if ((useMovingCrateMarker == true) && (!isNil "_bsmrkrPos"))  then
				//{
				//	deleteMarker _bsMrkrId;
				//};
				
				//// deletes all mission ai ///
				{
					deleteVehicle _x;
				}forEach (units _bs_BoatCrewgrp);
				
				/// deletes mission objects ///
				{
					deleteVehicle _x;
				}forEach _wreckage;
				
				//// turns all boat engines off ///
				{
					deleteVehicle _x;
				}foreach _bsBoatArray;
				
				deleteVehicle _bsCrate;
				
				if (_bs_RappelHeliSent != false) then
				{	
					_bs_HGunGroup = _bsRappelArray select 0;
					_bs_HCargoGroup = _bsRappelArray select 1;
										
					{
						deleteVehicle _x;
					}forEach (units _bs_HGunGroup);
					
					{
						deleteVehicle _x;
					}forEach (units _bs_HCargoGroup);
					
				};
				
				if (_bs_AttackHeliSent != false) then
				{	
					_bs_HAttackGroup = _bsAttackHArray select 0;
										
					{
						deleteVehicle _x;
					}forEach (units _bs_HAttackGroup);
				};

				_bs_cleanup = true;
								
				BS_count_shipwrecks = BS_count_shipwrecks - 1;	//added by Crito
			};
				//if ((useMovingCrateMarker == true) && (!isNil "_bsmrkrPos")) then
				//{
				//	deleteMarker _bsMrkrId;
				//};
			waitUntil {time - _bsLoopTime >= 3};
		};

