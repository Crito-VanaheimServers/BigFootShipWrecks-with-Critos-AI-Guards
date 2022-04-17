if (!isServer) exitWith {};

private ["_message", "_toastType"];

_type = _this select 0;
_title = _this select 1;
_message = _this select 2;

_toastType = format ["%1TitleAndText", _type];

["toastRequest", [_toastType, [_title,_message]]] call ExileServer_system_network_send_broadcast; 