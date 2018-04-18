_Hellis = ["JAS_CUP_B_CH47F_AAC","GOL_RUSGEO_WAR_GEORGIA_Mi8"];

_Red = "PortableHelipadLight_01_red_F" createVehicle position player;
Red attachTo [Helli,[0,-3,3] ];
Red setVectorDirAndUp [[0,1,0],[0,1,-180]];
Helli addAction["<t color='#088A29'>Green Light</t>",{detach Red; Red setPos(getPos Green); Green attachTo [Helli,[0,-3,3]]; Green setVectorDirAndUp [[0,1,0],[0,1,-180]];} ];
sleep 300;
detach Green;
green setPos(getPos Green);
Red attachTo [Helli,[0,-3,3] ];

if (isPlayer Test) then {
	_Chin = ["JAS_CUP_B_CH47F_AAC"];
	_Mi8 = ["GOL_RUSGEO_WAR_GEORGIA_Mi8"];
	
	_veh = createVehicle ["_Chin", getMarkerPos "chinspawn",[],0,"NONE"];
	_veh1 = createVehicle ["_Mi8", getMarkerPos "mi8pawn",[],0,"NONE"];
	
	_Red = "PortableHelipadLight_01_red_F" createVehicle position player; //Create light for chin
	_Red1 = "PortableHelipadLight_01_red_F" createVehicle position player; //  other for mi8
	Red attachTo [_Chin,[0,-3,-1] ];
	//_Red1 attachTo [_Mi8,[0,-3,-1] ];
	Red setVectorDirAndUp [[0,1,0],[0,1,-180]];
	_Chin addAction["<t color='#088A29'>Green Light</t>",{detach Red; Red setPos(getPos Green); Green attachTo [_Chin,[0,-3,3]]; Green setVectorDirAndUp [[0,1,0],[0,1,-180]];} ];
};
	
	
	
	//_veh1 = createVehicle _Mi8;
	getMarkerPos "mi8pawn";
	_Chin setVehiclePosition [chinspawn,[],0,"None"];
/////// neko
if (isPlayer Test) then 
{
    _Chin = "JAS_CUP_B_CH47F_AAC";
    _Mi8 = "GOL_RUSGEO_WAR_GEORGIA_Mi8";
   
	{
		_Veh = createVehicle [_x, markerPos (["chinspawn","mi8spawn"] select _ForEachIndex), [], 0, "NONE"]; // Create vehicle _x at position 0 and 1.
		_Red = "PortableHelipadLight_01_red_F" createVehicle [0,0,0]; // Create red light
		_Veh disableCollisionWith _Red;	// Avoid potential collision -- explosion
		_Red attachTo [_Chin,[0,-3,-1]]; // Attach red light
		_Red setVectorDirAndUp [[0,1,0],[0,1,-180]]; // Set light vectordir
		
		_Veh addAction 
		["<t color='#088A29'>Green Light</t>",
		{
			Params ["_Target","_Caller","_ID","_Args"]; // Default parameters in an addaction, Target = Object with addaction. _Caller = Player executing addaction. _Args = Variables passed in to the addAction (See the end of the addAction command).
			_Args Params ["_Red"];	// Defines _Red in the AddAction code to be the first Variable passed from the script
			
			deleteVehicle _Red;
			_Green = "PortableHelipadLight_01_green_F" createVehicle [0,0,0]; // Create green light
			_Green attachTo [_Target,[0,-3,3]]; 
			_Green setVectorDirAndUp [[0,1,0],[0,1,-180]];
			_Veh disableCollisionWith _Green;	// Avoid potential collision -- explosion
		},[_Red]];
		Sleep 0.5;	// To reduce lag spikes
		
	} forEach [_Chin, _Mi8];
};
//////////////////////////// back up
if (!IsServer) then {
	if ((dayTime > 04.30) and (dayTime < 19.30)) then {_LightClass = "PortableHelipadLight_01_red_F"} else {_LightClass = "Chemlight_red"};
    _Chin = "JAS_CUP_B_CH47F_AAC";
    _Mi8 = "GOL_RUSGEO_WAR_GEORGIA_Mi8";
   
    _veh = createVehicle [_Chin, getMarkerPos "chinspawn",[],0,"NONE"];
    _veh1 = createVehicle [_Mi8, getMarkerPos "mi8spawn",[],0,"NONE"];
   
    _Red = "PortableHelipadLight_01_red_F" createVehicle [0,0,0]; //Create light for chin
    _Red1 = "PortableHelipadLight_01_red_F" createVehicle [0,0,0]; //  other for mi8
    _Red attachTo [_Veh,[0,-3,-1] ];
    _Red1 attachTo [_Veh1,[0,0,-1] ];
    _Red setVectorDirAndUp [[0,1,0],[0,1,-180]];
	_Red1 setVectorDirAndUp [[0,1,0],[0,1,-180]];
	
    // AddAction //Chinook
    _veh remoteExec addAction
    ["<t color='#088A29'>Green Light</t>",
    {
        Params ["_Target","_Caller","_ID","_Args"]; // Default parameters in an addaction, Target = Object with addaction. _Caller = Player executing addaction. _Args = Variables passed in to the addAction (See the end of the addAction command).
        _Args Params ["_Red"];  // Defines _Red in the AddAction code to be the first Variable passed from the script
       
        deleteVehicle _Red;
        _Green = "PortableHelipadLight_01_green_F" createVehicle [0,0,0]; // Create green light
        _Green attachTo [_Target,[0,-3,-1]];
        _Green setVectorDirAndUp [[0,1,0],[0,1,-180]];
        _Target disableCollisionWith _Green;    // Avoid potential collision -- explosion
    }, [_Red], 1, false, true, "", "!((assignedVehicleRole _This) isEqualTo []) && (((assignedVehicleRole _This) select 0) isEqualTo 'Turret')"];// Jason added this but pilots cant use the action 
	//M8IJ
	_veh1 remoteExec addAction 
    ["<t color='#088A29'>Green Light</t>",
    {
        Params ["_Target","_Caller","_ID","_Args"]; // Default parameters in an addaction, Target = Object with addaction. _Caller = Player executing addaction. _Args = Variables passed in to the addAction (See the end of the addAction command).
        _Args Params ["_Red1"];  // Defines _Red1 in the AddAction code to be the first Variable passed from the script
       
		deleteVehicle _Red1;
		_Green1 = "PortableHelipadLight_01_green_F" createVehicle [0,0,0]; // Create green light
		_Green1 attachTo [_Target,[0,0,-1]]; 
		_Green1 setVectorDirAndUp [[0,1,0],[0,1,-180]];
		_Target disableCollisionWith _Green1;	// Avoid potential collision -- explosion and added green1 cuz not sure if will cause issues with green
		_role = assignedVehicleRole player; (!(_role isEqualTo []) && {_role select 0 isEqualTo 'Turret'});
    },[_Red1], 1, false, true, "", "!((assignedVehicleRole _This) isEqualTo []) && (((assignedVehicleRole _This) select 0) isEqualTo 'Turret')"]; // Jason added this but pilots cant use the action 
};