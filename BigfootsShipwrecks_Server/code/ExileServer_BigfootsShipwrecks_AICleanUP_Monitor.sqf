/*
ExileServer_BigfootsShipwrecks_AICleanUP_Monitor
by Ketanna @Kronik Servers
*/

	private ["_bsGroupID","_markerPosition","_bsGroup","_wreckageVars","_wreckage","_bsBoatArray","_bs_cleanup","_bs_playerCleanRange","_bsCrate","_bs_crateCleanRange"];
	
	_bsGroupID = _this select 0;	
	_markerPosition = _this select 1;

	/// retrieves mission namespace variables saved previously on mission creation to use below for mission cleanup ///
	_wreckageVars = missionNamespace getVariable [_bsGroupID,objNull];
	
	_bsGroup = _wreckageVars select 0;
	_wreckage = [_wreckageVars select 1];
	_bsBoatArray = _wreckageVars select 2;
	_bsCrate = _wreckageVars select 3;	//added by Crito
	
	_bs_cleanup = false; 

		while {_bs_cleanup == false} do	//added by Crito
		{
			_bs_playerCleanRange = [_markerPosition, BS_RangeCleanUp] call ExileClient_util_world_isAlivePlayerInRange; //added by Crito
		
			_bs_crateCleanRange = getpos _bsCrate; //added by Crito
			
			if ((!_bs_playerCleanRange) && ((_bs_crateCleanRange distance _markerPosition) > BS_RangeCleanUp)) then  //added by Crito
			{
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
			};
			sleep 10;	//added by Crito
		};
