/*
ExileServer_BigfootsShipwrecks_AICleanUP_Monitor
by Ketanna
*/

	private ["_bsGroupID","_markerPosition","_bsGroup","_wreckageVars","_wreckage","_bsBoatArray","_bs_cleanup","_bs_playerCleanRange","_bsCrate",
			 "_bs_crateCleanRange","_bsLoopTime","_bsMrkrId","_isPlayerAtCrate","_bsmrkrPos","_bsCompMarker","_bs_AllMrkrNames","_bs_MarkerName"];
	
	_bsGroupID = _this select 0;	
	_markerPosition = _this select 1;

	_bs_MarkerName = [] call ExileServer_BigfootsShipwrecks_CrateMarkerCommand;
	_bsMrkrId = _bs_MarkerName;

	/// retrieves mission namespace variables saved previously on mission creation to use below for mission cleanup ///
	_wreckageVars = missionNamespace getVariable [_bsGroupID,objNull];
	
	_bsGroup = _wreckageVars select 0;
	_wreckage = [_wreckageVars select 1];
	_bsBoatArray = _wreckageVars select 2;
	_bsCrate = _wreckageVars select 3;	//added by Crito

	_bs_cleanup = false; 

		while {_bs_cleanup == false} do	//added by Crito
		{
			_bsLoopTime = time;
			
			_isPlayerAtCrate = [_markerPosition, BS_Player_nearCrate] call ExileClient_util_world_isAlivePlayerInRange;

			_bs_playerCleanRange = [_markerPosition, BS_RangeCleanUp] call ExileClient_util_world_isAlivePlayerInRange; //added by Crito
		
			_bs_crateCleanRange = getpos _bsCrate; //added by Crito
			
			_bsmrkrPos = [(_bs_crateCleanRange select 0) + 5,(_bs_crateCleanRange select 1) + 5,+0];
			
			_bsCompMarker = createMarker [_bsMrkrId, _bsmrkrPos];
			_bsCompMarker setMarkerShape "ICON";
			_bsCompMarker setMarkerType "loc_Box";
			_bsCompMarker setMarkerColor "ColorRed";

			if (_isPlayerAtCrate ) then 
			{
					[_bsGroupID] call ExileServer_BigfootsShipWrecks_AIPlayerAtCrate;				
			};

			if ((!_bs_playerCleanRange) && ((_bs_crateCleanRange distance _markerPosition) > BS_RangeCleanUp)) then  //added by Crito
			{
				deleteMarker _bsMrkrId;

				//// deletes all mission ai ///
				{
					deleteVehicle _x;
				}forEach (units _bsGroup);
				
				/// deletes mission objects ///
				{
					deleteVehicle _x;
				}forEach _wreckage;
				
				//// turns all boat engines off ///
				{
					_x engineOn false;
				}foreach _bsBoatArray;
				
				_bs_cleanup = true;
								
				BS_count_shipwrecks = BS_count_shipwrecks - 1;	//added by Crito

			};
			waitUntil {time - _bsLoopTime >= 5};
			deleteMarker _bsMrkrId;
		};

