	 enableSaving [false, false];

	//null = [5, "scripts"] execVM "scripts\helipad_lights\helipad_light_auto.sqf";

//=================HELIPAD=====================
	[] execVM "scripts\helipadInit.sqf";
	sleep 0.1; 
	serialno = 133676;
	heliPadOn = 0;
	#include "scripts\helipadCamera.sqf"
//============================================
