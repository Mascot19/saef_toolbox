/*
	Name:			fn_Admin_AddMissionAction.sqf
	Description:	Generic function that gives ability to add additional mission functions to our Admin Utilities Ace Interaction Menu
*/

private
[
	"_params",
	"_script",
	"_desc",
	"_local",
	"_numFuncs",
	"_name",
	"_missionUtilsParent",
	"_action"
];

_parameters = _this select 0;
_script = _this select 1;
_desc = _this select 2;
_server = _this select 3;

// Work out some name information
_numFuncs = (missionNamespace getVariable "RS_Admin_MissionFunctionsCount");
if (isNil "_numFuncs") then
{
	_numFuncs = 0;
};

_name = format ["mission_func_%1", (_numFuncs + 1)];

// Increment Mission Function Count
missionNamespace setVariable ["RS_Admin_MissionFunctionsCount", (_numFuncs + 1), true];

// Add our generic function 
_missionUtilsParent = ["ACE_SelfActions", "AdminUtils", "AdminUtils_Mission"];

_action = [_name, _desc, "",
	{
		params ["_target", "_player", "_params"];
		
		// Execution Code Block
		_server = (_params select 2);
		
		if (_server) then
		{
			_params spawn RS_fnc_Admin_RunScriptOnServer;
		}
		else
		{
			(_params select 0) execVM (_params select 1);
		};
		
		hint format ["Running Script %1 with these parameters %2", (_params select 1), (_params select 0)];
	}, 
	{true}, {}, [_parameters, _script, _server]
] call ace_interact_menu_fnc_createAction;
 
// Add the action to the Player
[player, 1, _missionUtilsParent, _action, true] call ace_interact_menu_fnc_addActionToObject;

/*
	END
*/