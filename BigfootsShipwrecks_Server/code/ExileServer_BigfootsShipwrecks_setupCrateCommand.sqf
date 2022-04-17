private ["_crate"];

_crate = _this;

// Initialize crate
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;

_crate setVariable ["permaLoot", true]; 
_crate allowDamage false;
_crate enableRopeAttach true;