class CfgPatches
{
	class SAEF_TOOLBOX_THERIFT
	{
		version=2;
		units[]={};
		weapons[]={};
		author="Rabid Squirrel";
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Data_F"
		};
	};
};

class CfgFunctions
{
	class RS_Rift
	{
		class TheRift
		{
			file = "saef_therift\Functions";
			class CreateRiftInteractionCamera {};
			class CreateRiftInteractionPoint {};
			class CreateRiftInteractionSounds {};
			class CreateRiftInteractionTrigger{};
			class CreateRiftParticleEffect {};
			class DeleteRiftParticleEffects {};
			class FlickerObject {};
			class Init 
			{
				postInit = 1;
			};
			class ObjectHideHandler {};
			class PostProcessEffectsHandler {}; 
			class Readme {};
			class RiftControlObject {};
			class RiftDamageHandler {};
			class RiftForcefulExit {};
			class RiftMarkerHandler {};
			class RiftSwitch {};
		};
	};
};

class CfgSounds
{
	#include "Sounds\_Sounds.hpp"
};