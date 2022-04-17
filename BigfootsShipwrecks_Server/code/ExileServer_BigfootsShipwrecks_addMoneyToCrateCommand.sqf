/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */
 
if (!isServer) exitWith {};

private ["_countPoptabs", "_crate", "_enableCrateFillDebug", "_randomDistributionSeed", "_wreckId"];

_wreckId = _this select 0;
_crate = _this select 1;
_randomDistributionSeed = _this select 2;
_enableCrateFillDebug = _this select 3;

_countPoptabs = floor(random _randomDistributionSeed);
_crate setVariable ["ExileMoney", _countPoptabs, true];

if (_enableCrateFillDebug) then 
{
    format["Added [%1] poptabs to crate [%2].", _countPoptabs, _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
};
