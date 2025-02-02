/*
	fn_Zone.sqf
	Description: Handles the radiation zone
	[] call RS_Radiation_fnc_Zone;
*/

if (!hasInterface) exitWith {};

private
[
	 "_size"
	,"_unit"
];

// Get our markers
_radMarkerList = [] call RS_Radiation_fnc_Markers;

if (!(_radMarkerList isEqualTo [])) then
{
	_size = 500;
	_unit = player;

	// Set some variables
	_unit setVariable ["RS_RadiationZone_Run_RadiationHandler", true, true];
	_unit setVariable ["RS_RadiationZone_Run_RadiationMarkerHandler", true, true];

	// Setup the Marker Handler
	[_unit, _radMarkerList] spawn RS_Radiation_fnc_MarkerHandler;

	// Setup the Radiation Handler
	[_radMarkerList, _size, _unit, "RS_RadiationZone_Run_RadiationHandler"] spawn RS_Radiation_fnc_Handler;
};