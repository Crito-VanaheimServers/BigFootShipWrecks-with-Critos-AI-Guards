/*
ExileServer_BigfootsShipwrecks_CrateMarkerCommand
by Crito @Vanaheim Gaming Servers
Discord: https://discord.gg/WEFzqPa
*/
	
private ["_bs_AllMrkrNames","_bs_MarkerName"];
	
	_bs_MarkerName = format ["bsMarker%1", count BS_AllMrkrNames];
	BS_AllMrkrNames pushback _bs_MarkerName;

_bs_MarkerName