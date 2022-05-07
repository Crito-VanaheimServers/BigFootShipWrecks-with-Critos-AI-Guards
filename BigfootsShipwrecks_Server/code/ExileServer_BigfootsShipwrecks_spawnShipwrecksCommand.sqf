if (!isServer) exitWith {};

private["_maxBoats","_crate", "_crateCargo", "_crateClass", "_crateCountPoptabsSeed", "_cratePosition", "_isDebugFillLogEnabled", "_marker",
		"_minDistance", "_maxDistance", "_positioning", "_spawnCenter", "_wreckage", "_wreckageClass", "_wreckCount", "_wreckId",
		"_wreckagePosition", "_CrateSpreadOK","_bigfoot_locationFound","_BigFootPos","_BS_ArrayVar", "_BS_WreckCounter","_BigFootPosDepth",
		"_wreckcounter"];

"Starting shipwreck spawns..." call ExileServer_BigfootsShipwrecks_util_logCommand;

_positioning = _this select 1;
_spawnCenter = _positioning select 0;
_minDistance = _positioning select 1;
_maxDistance = _positioning select 2;



_wreckageClass = _this select 2;
_crateClass = _this select 3;
_crateCargo = _this select 4;
_crateCountPoptabsSeed = _this select 5;
_isDebugFillLogEnabled = _this select 6;
_maxBoats = _this select 7;

_wreckCount = BS_count_shipwrecks;

		 ///// builds an array of ship wreck map markers for later use  ////
		 BS_Array = []; 
		 { 
		   if (markerType _x == BS_MapMarker) then  
		   {  
				BS_Array append [_x]; 				
		   };  		   
		 }foreach allmapmarkers; 
		 


	///// subtracts current shipwrecks from max ship wrecks to get total number of wrecks to spawn, used for real time wreck respawns/// 
	_BS_WreckCounter = count BS_Array;
	_wreckCount = BS_count_shipwrecks - _BS_WreckCounter;


for "_i" from 1 to _wreckCount do
{   

	//////////////// Added by Ketanna to allow customization of crate water spawn depth min and max settings ///////////////		
	_bigfoot_locationFound = false;
	while {!_bigfoot_locationFound} do
	{	
		 ///// builds an array of ship wreck map markers for later use  ////
		private _BS_ArrayVar = []; 
		 { 
		   if (markerType _x == BS_MapMarker) then  
		   {  
				_BS_ArrayVar append [_x]; 				
		   };  		   
		 }foreach allmapmarkers; 
	
		/// sets default value to true for _CrateSpreadOK
		_CrateSpreadOK = true;

		// Finds a subtable crate location based on peramaters							// suspected operation            objdistanc,  water mode,  max grade,   shore mode
		_wreckagePosition = [_spawnCenter, _minDistance, _maxDistance, 1, 2, 800, 0] call BIS_fnc_findSafePos; //  _maxdistance,   1,          2,          800,           0] original 

		/// creates a place holder for the crate locations to be checked against other crate location to ensure they are not too close
		private _BigFootPos = createVehicle ["Land_HelipadEmpty_F", _wreckagePosition, [], 0, "CAN_COLLIDE"];		
		private _BigFootPosDepth =  getposASL _BigFootPos select 2;

		BS_locations_WaterDepth_max = BS_locations_WaterDepth_max * -1;    // converts the positive number in the config to a neg number for water depth calculation
		BS_locations_WaterDepth_MIN = BS_locations_WaterDepth_MIN * -1;	 // converts the positive number in the config to a neg number for water depth calculation
			
					 
		///// checks the current ship wreck requested spawn location against other shipwreck locations to insure they are not closer 
		///// than the defined spawn distance from each other 		 
		_wreckcounter = count _BS_ArrayVar;
		if (_wreckcounter >= 1) then
		{
			{ 		   
				_Cratechecker = getmarkerpos  _x;
				_Crate_distance_Check = _BigFootPos distance2d  _Cratechecker;

				if (_Crate_distance_Check <= Bs_crate_seperation_distance) then
				{
					_CrateSpreadOK = false;
				};			
			}foreach _BS_ArrayVar;
		};
		
		//// creates the ship wreck after all conditions have been met ///
		if (_BigFootPosDepth >= BS_locations_WaterDepth_max && _BigFootPosDepth <= BS_locations_WaterDepth_MIN && _CrateSpreadOK) then
		{
				BS_LastShipWreckSpawned = diag_tickTime;

				_bigfoot_locationFound = true;

			    format["Found position at [%1] for wreck.", _wreckagePosition] call ExileServer_BigfootsShipwrecks_util_logCommand;

				// Create ID for this wreck
				_wreckId = _i call ExileServer_BigfootsShipwrecks_getWreckIdForSpawnCountIndexQuery;

				// Create a marker
				[_wreckId, _wreckagePosition, "Shipwreck"] call ExileServer_BigfootsShipwrecks_createShipwreckMarkerCommand;
				
				format["Spawning wreck and crate near [%1] with id [%2].", _wreckagePosition, _wreckId ] call ExileServer_BigfootsShipwrecks_util_logCommand;
				
				// Create wreck
				_wreckage = _wreckageClass createVehicle _wreckagePosition;
		
				// Create crate nearby
				_cratePosition = _wreckage getRelPos [10, 0];
				_crate = _crateClass createVehicle _cratePosition;    
				_crate call ExileServer_BigfootsShipwrecks_setupCrateCommand;
				// Put cargo in crate
				[_wreckId, _crate, _crateCargo, _isDebugFillLogEnabled] call ExileServer_BigfootsShipwrecks_addItemsToCrateCommand;

				// Put money in crate
				[_wreckId, _crate, _crateCountPoptabsSeed, _isDebugFillLogEnabled] call ExileServer_BigfootsShipwrecks_addMoneyToCrateCommand;
				
				//AI Guard Spawning				
				[_wreckagePosition,_maxBoats,_cratePosition,_wreckId,_wreckage,_crate] call ExileServer_BigfootsShipwrecks_AIStart;
					
		};
			deleteVehicle _BigFootPos;	// deletes wreck place holder
	};
	////////////////////////////////// water depth spawn select ended ///////////////////////////
};

"Finished shipwreck spawns." call ExileServer_BigfootsShipwrecks_util_logCommand;