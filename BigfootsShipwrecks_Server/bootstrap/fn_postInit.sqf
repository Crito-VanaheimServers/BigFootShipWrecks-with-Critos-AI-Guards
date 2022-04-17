/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */

"PostInit started..." call ExileServer_BigfootsShipwrecks_util_logCommand;

call compile preprocessFileLineNumbers "BigfootsShipwrecks_Server\config.sqf";

[] call ExileServer_BigfootsShipwrecks_initialize;

"PostInit finished" call ExileServer_BigfootsShipwrecks_util_logCommand;