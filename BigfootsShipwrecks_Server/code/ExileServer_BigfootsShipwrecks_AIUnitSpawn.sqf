/*
ExileServer_BigfootsShipwrecks_AIUnitSpawn
by Crito @Vanaheim Gaming Servers
Discord: https://discord.gg/WEFzqPa
*/

private ["_bsUnit","_bs_AimingAccuracy","_bs_AimingShake","_bs_AimingSpeed","_bs_Endurance","_bs_SpotDistance","_bs_SpotTime",
		 "_bs_Courage","_bs_ReloadSpeed","_bs_Commanding","_bs_General","_bs_Uniform","_bs_Vest","_bs_Weapon","_bs_FaceWear",
		 "_bs_HeadGear","_bs_BackPack"];

_bsGroup = _this select 0;
//_bsGroupID = _this select 1;
_bsSpawn = [0,0,0];
_bs_AimingAccuracy = BS_aimingAccuracy;
_bs_AimingShake = BS_aimingShake;
_bs_AimingSpeed = BS_aimingSpeed;
_bs_Endurance = BS_endurance;
_bs_SpotDistance = BS_spotDistance;
_bs_SpotTime = BS_spotTime;
_bs_Courage = BS_courage;
_bs_ReloadSpeed = BS_reloadSpeed;
_bs_Commanding = BS_commanding;
_bs_General = BS_general;
_bs_Uniform = BS_uniform;
_bs_Vest = BS_vest;
_bs_Weapon = BS_weapon;
_bs_FaceWear = BS_faceWear;
//_bs_HeadGear = BS_headGear;
//_bs_BackPack = BS_backPack;

_bsUnit = _bsGroup createUnit ["O_Soldier_unarmed_F", _bsSpawn, [], 0, "CAN_COLLIDE"];

		_bsUnit allowFleeing 0;
		_bsUnit setUnitPos "UP";

		{_bsUnit removeWeaponGlobal _x;} 	forEach (weapons _bsUnit);
		{_bsUnit unlinkItem _x;} 			forEach (assignedItems _bsUnit);
		{_bsUnit removeItem _x;} 			forEach (items _bsUnit);
		removeAllItemsWithMagazines 	_bsUnit;
		removeHeadgear 					_bsUnit;
		removeUniform 					_bsUnit;
		removeVest 						_bsUnit;
		removeBackpackGlobal 			_bsUnit;

		_bsUnit setSkill ["aimingAccuracy", _bs_AimingAccuracy];
		_bsUnit setSkill ["aimingShake", _bs_AimingShake];
		_bsUnit setSkill ["aimingSpeed", _bs_AimingSpeed];
		_bsUnit setSkill ["endurance", _bs_Endurance];
		_bsUnit setSkill ["spotDistance", _bs_SpotDistance];
		_bsUnit setSkill ["spotTime", _bs_SpotTime];
		_bsUnit setSkill ["courage", _bs_Courage];
		_bsUnit setSkill ["reloadSpeed", _bs_ReloadSpeed];
		_bsUnit setSkill ["commanding", _bs_Commanding];
		_bsUnit setSkill ["general", _bs_General];
		
		_bsUnit forceAddUniform _bs_Uniform;
		_bsUnit addVest _bs_Vest;
		//_bsUnit addBackpack _bs_BackPack;
		//_bsUnit addHeadgear _bs_HeadGear;
		_bsUnit addWeapon "Binocular";
		[_bsUnit, _bs_Weapon, 5] call BIS_fnc_addWeapon;
		_bsUnit linkItem _bs_FaceWear;
		_bsUnit linkItem "ItemWatch";
		_bsUnit linkItem "ItemMap";
		_bsUnit linkItem "ItemCompass";
		_bsUnit linkItem "ItemRadio";
		
		missionNamespace setVariable ["BSUnit",_bsUnit];
		
		_bsUnit addMPEventHandler ["MPKilled",'if (isServer) then { _this call ExileServer_BigfootsShipwrecks_RespectPayout; }; '];
		
_bsUnit 