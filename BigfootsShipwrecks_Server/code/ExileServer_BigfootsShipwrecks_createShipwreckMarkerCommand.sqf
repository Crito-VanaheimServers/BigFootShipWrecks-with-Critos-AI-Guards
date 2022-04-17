/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */
 
private ["_marker", "_markerId", "_markerPosition", "_markerText"];

_markerId = _this select 0;
_markerPosition = _this select 1;
_markerText = _this select 2;

_marker = createMarker [_markerId, _markerPosition];
_marker setMarkerShape "ICON";
_marker setMarkerType BS_MapMarker;
_marker setMarkerColor "ColorBlue";
//_marker setMarkerText _markerText;

