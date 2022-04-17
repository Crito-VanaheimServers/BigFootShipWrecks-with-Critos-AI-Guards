/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */
 
if (!isServer) exitWith {};

private ["_actualCount", "_actualAdditionalCount", "_cargoItems", "_chance", "_class", "_count", "_cargoItems", "_crate", "_enableCrateFillDebug", "_minCount", "_possibleAdditionalCount", "_wreckId"];

_wreckId = _this select 0;
_crate = _this select 1;
_cargoItems = _this select 2;
_enableCrateFillDebug = _this select 3;

{
    _class = _x select 0;
    _minCount = _x select 1;
    _possibleAdditionalCount = _x select 2;
    _chance = _x select 3;

    if (_chance > random 100) then {
        if (typeName _class == "ARRAY") then
        {
            _class = _class call BIS_fnc_selectRandom;
        };

        _actualAdditionalCount = floor(random (_possibleAdditionalCount + 1));
        _actualCount = _minCount + _actualAdditionalCount;
        _crate addItemCargoGlobal [_class, _actualCount];

        if (_enableCrateFillDebug) then {
            format["Added [%1] [%2] to crate [%3].", _actualCount, _class, _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
        };
    };
} foreach _cargoItems;  