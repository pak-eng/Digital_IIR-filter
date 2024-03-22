%ADD LIBRARY FILE (My_FI_Operations.slx) TO MATLAB PATH 
% OR JUST OPEN LIBRARY .slx FILE IN SIMULINK
open_system('My_FI_Operations.slx');
open_system('FP_sub.slx');

clear;
close all force;

f_0 = 0.21; % Input signal frequency (divided by Sample Rate)
WL = 11;    % Input signal word length
FL = 3;     % Input signal fractional length
INT = WL - FL;
A_0 = (2^(WL-1)-1); % Input signal amplitude (maximum)
FLout = FL;
if (0.221<f_0)&&(f_0<0.233)||(0.267<f_0)&&(f_0<0.279)
    FLout = FL-1;
end
lsb_val = 2^(-FLout);

%-------------Test signal generation
N = 256;                % Number of Samples
Ts = 1;                 % Sample period
T = Ts * N;             % Simulation Time
t = 0:Ts:Ts*(N-1);      % Time Vector 
fs = 1/Ts;              % Sample rate
f_0 = f_0*fs;           % Denormalized Input Signal Frequency
A_0 = A_0 * 2^(-FL);    % Input Signal Amplitude 
x_0 = A_0 * sin(2*pi*f_0.*t); % Input Signal Vector
test_in = [t', x_0'];
%-------------Simulation
w=warning('off','all');
sim("REFvsFI.slx");