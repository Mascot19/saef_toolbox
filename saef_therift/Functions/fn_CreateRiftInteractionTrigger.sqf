/*
	fn_CreateRiftInteractionTrigger.sqf
	Description: Creates a trigger that allows entry or exit from the rift
	[object, _control] call RS_Rift_fnc_CreateRiftInteractionTrigger;
*/

private 
[
	"_object"
	,"_control"
	,"_type"
	,"_script"
	,"_trg"
];

_object = _this select 0;
_control = _this select 1;
_type = _this select 2;

_script = "{ ['INSIDE', _x] spawn RS_Rift_fnc_RiftSwitch } forEach thisList;";
if (_control > 0) then
{
	_script = "{ ['OUTSIDE', _x] spawn RS_Rift_fnc_RiftSwitch } forEach thisList;";
};

_trg = createTrigger ["EmptyDetector", (getPos _object)];

if (toUpper(_type)  == "REC") then
{
	_trg setTriggerArea [1, 2, 0, true, 3];
}
else
{
	_trg setTriggerArea [2, 2, 0, false, 3];
};

_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements ["(this && !(missionNamespace getVariable ['RS_RiftClosed', false]))", _script, ""];