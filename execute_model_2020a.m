clear; clc;
% Variables required to run our model

% Parameters for the Platform position and orientation
Ax = 0; Ay = 0; Aa = 0; Ab = 0; Ac = 0; Az = 0;
wz = 0; pz = 0; kz = 75;
wy = 0; py = 0; ky = 0;
wx = 0; px = 0; kx = 0;

% PID controller values to minimize error
Kp = 450; Ki = 11.5; Kd = 8;

% Parameters
wa = 0; pa = 0; ka = 0;
wb = 0; pb = 0; kb = 0;
wc = 0; pc = 0; kc = 0;

% Parameters for the manipulator itself
base_rad = 28; hex_rad = 28; base_thick = 8; hex_thick = 8;
hex_skew = -0.25; flange_width = 2.25; flange_len = 3; flange_thick = 0.8;
flange_ref_rot = 0; kind_val = 0; upper_leg_len = 10; lower_leg_len = 14;
collar_thick = 0.5; platform_rad = 18; platform_thick = 2; leg_rad = 3;
lengths(1) = 2.573; rad = 3;
flange_sep = 2 * leg_rad * cos(pi/6) - flange_thick;
shininess = 0;
asm_offset = 2.573; nom_length = 30;

% Base Points and Platform Points
format long
B = [24.233423136094 6.1219332628706 -6.1219332628706 -24.233423136094 -18.111489873223 18.111489873223;
    -6.9221737364514 24.447846924741 24.447846924741 -6.9221737364514 -17.525673188289 -17.525673188289;
    7 7 7 7 7 7];
P = [14.574164873203 11.040422061358 -11.040422061358 -14.574164873203 -3.5337428118454 3.5337428118454;
    4.3339832854262 10.454605376424 10.454605376424 4.3339832854262 -14.78858866185 -14.78858866185;
    -35 -35 -35 -35 -35 -35];

% The initial velocity of the ball in x and y direction
% The velocity should be under 0.7 m/s in either direction to achieve
% accurate results. Higher velocity values require rigorous PID tuning and
% gain amplification of the platform.

x_velocity = 0.7;
y_velocity = 0.7;
warning("off")
% To run the simulink file
addpath("Simscape-Multibody-Contact-Forces-Library-20.1.5.1\CFL_Core\Libraries\")
sim('Project_2_2020a.slx')
clear; clc;