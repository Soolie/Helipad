cameraPOV = 0.700;
cameraTakenFrom = "";
cameraTakenFromView = "";
addCamera = 
{
	private ["_camera", "_position", "_source", "_angle", "_hideSource"];

	_source = _this select 0;
	_hideSource = if(count _this > 1) then {_this select 1} else {false};
	_angle = if(count _this > 2) then {_this select 2} else {"DEFAULT"};	
	if(_hideSource) then
	{
		hideObject _source;
	};	
	_position = position _source;	
	_position = [_position, _angle] call setCameraAngle;
	_camera = "camera" camCreate (_position);	
	_camera camPrepareFOV cameraPOV;	
	_camera
};
removeCamera = 
{
	private ["_camera"];	
	_camera = _this select 0;
	camDestroy _camera;
};
zoomShot = 
{
	private ["_camera", "_target", "_hideTarget", "_duration"];	
	_camera = _this select 0;
	_target = _this select 1;
	_duration = if(count _this > 3) then {_this select 3} else {5};
	_hideTarget = if(count _this > 4) then {_this select 4} else {false};
	
	if(_hideTarget) then
	{
		hideObject _target;
	};
	_camera camPrepareTarget _target;
	_camera camPreparePos [(getpos _target select 0)- 30,(getpos _target select 1)+20, 2];
	_camera camCommitPrepared 0;
	_camera camPrepareFOV 0.100;
	_camera camCommitPrepared _duration;
	sleep _duration;
	_camera camPrepareFOV cameraPOV;
};
startCinematic = 
{
	private ["_camera", "_cinemaBorder"];	
	_camera = _this select 0;
	_cinemaBorder = if(count _this > 1) then {_this select 1} else {false};			
	if(_cinemaBorder) then 
	{
		showCinemaBorder true;
	};	
	0 cutFadeOut 2;
	sleep 1;	
	_camera cameraEffect ["Internal", "Back"];	
};
stopCinematic = 
{
	private ["_camera"];	
	_camera = _this select 0;	
	1 cutFadeOut 2;	
	sleep 1;	
	_camera cameraEffect ["Terminate", "Back"];
};
setCameraAngle = 
{
	private ["_position", "_angle", "_Y"];	
	_position = _this select 0;
	_angle = _this select 1;	
	switch(_angle) do 
	{
		case "ZOOM":
			{
				_Y = _position select 2;
				_position set [2,_Y+6];
			};
	};
	_position
};