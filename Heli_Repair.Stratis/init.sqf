	enableSaving [false, false];

//=================HELIPAD=====================
	[] execVM "scripts\helipadInit.sqf";
	sleep 0.1; 
	serialno = 133676;
	heliPadOn = 0;
	#include "scripts\helipadCamera.sqf"
//============================================
