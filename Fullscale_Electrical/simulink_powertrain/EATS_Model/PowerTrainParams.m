% PMSM Simulation
% Tim Green
tic
clc; close all; clear all;
lpftc=10e-7;

% Controller Gains
Kp_T = 1;                   % proportional torque reference gain
Ki_T = 1;                   % integral torque reference gain
Kp_I = 1;                   % proportional current reference gain
Ki_I = 100;                 % integral current reference gain

% Electrical Machine Parameters
p = 10;                     % num of pole pairs
q = 3;                      % num of phases
lambda = 0.0664;            % permanent magnet flux linkage
L_d = 0.000126;             % D axis inductance
L_q = 0.000118;             % Q axis inductance
R_s = 0.0105;               % stator resistance

% Mechanical Machine Parameters
J = 0.0922;                 % moment of inertia
B_f = 0.0025;               % coefficient of friction (john's estimate)
G_r = 0.75;                    % gearing ratio

% Flight Model Speed Parameters (prop requirements)
n_takeoff = 4929;           % rotor takeoff speed
n_climb = 2092;             % rotor climb speed
n_cruise = 1291;            % rotor cruise speed
n_glide = 1291;             % rotor glide speed
n_land = 4929;              % rotor landing speed

% Flight Model Torque Parameters (prop requirements)
T_takeoff = 238;            % rotor takeoff torque
T_climb = 42.94;               % rotor climb torque
T_cruise = 19.1;            % rotor cruise torque
T_glide = 17.2;                % rotor glide torque
T_land = 238;               % rotor landing torque

% Flight Model Timing Parameters
t_change = 5;               % transition time between phases
t_takeoff = 30+t_change;             % total takeoff time
t_climb = 44+t_change;               % total climb time
t_cruise = 2875+t_change;            % total cruise time
t_glide = 105+t_change;              % total glide time
t_land = 100+t_change;               % total landing time

% Battery Cell Measurements
N_ser = 176;                % number of battery cells in series
N_par = 6;                  % number of battery cells in parallel
V_nom = 3.58;               % nominal battery cell voltage
V_exp = 3.7;                % exponential battery voltage
V_full = 4.15;              % full-charge battery voltage
V_dc = 3.7*N_ser;           % total battery voltage
C_nom = 8640;               % capacity at nominal voltage (A*s)
C_max = 10260;              % maximum charge capacity (A*s)
C_exp = 5400;               % expoenential capacity (A*s)

% Battery Cell Parameters
R_int = 0.004;             % internal battery resistance
E_0 = V_exp;               % constant voltage
A = V_full - V_exp;        % exponential voltage difference
Q = C_max;                 % max charge capacity
B = 1/C_exp;               % exponential charge constant
K = (V_exp - V_nom)*(C_max - C_nom)/(C_max*C_nom);      % polarization constant



