%ADD LIBRARY FILE (My_FI_Operations.slx) TO MATLAB PATH 
% OR JUST OPEN LIBRARY .slx FILE IN SIMULINK
open_system('My_FI_Operations_ML2017a.slx');
open_system('REFvsFI_ML2017a.slx');

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
%-------------Output signal analysis And Plotting
ref_out = ans.ref_out.Data;
fp_out = ans.fp_out.Data;
error = ans.error.Data;
m_y = max(round(ref_out*10))/10;
m_y = max(round([fp_out; m_y]*10))/10;
m_y = m_y*1.25;
m_err = max(error(150:end));

hold on;
grid on;
grid minor;

plot(x_0(150:end), '-+', 'MarkerSize', 8, 'LineWidth', 2);
plot(ref_out(150:end), '-x', 'MarkerSize', 8, 'LineWidth', 2);
plot(fp_out(150:end), '-o', 'MarkerSize', 8, 'LineWidth', 2);

fontsz = 16;
legend('Stimulus Signal', 'Reference Model Output Signal', 'Fixed Point Model Output Signal');
legend('NumColumns',3, 'FontSize', fontsz);
legend('boxoff');
xlabel('Time', 'FontSize', fontsz);
ylabel('Sample Magnitude', 'FontSize', fontsz);

fprintf('max error absolute = %f\n',m_err);
fprintf('max error = %f in lsb\n',m_err/lsb_val);
formatSpec = '%.3f';
str_f = num2str(f_0,formatSpec);
str = num2str(m_err/lsb_val,formatSpec);
str = "Input signal frequency = "+str_f+"; Maximum error in LSB = "+str;
title(str, 'FontSize', fontsz)

ax = gca;
ax.YAxis.Limits = [-m_y m_y];
ax.FontSize = fontsz;

%-------------Exporting Stimulus And Output Data For RTL-Simulation
sim_in = ans.sim_in.Data;
sim_out = ans.sim_out.Data;

fileID_in = fopen('stimulus.mem','w');
fileID_out = fopen('reference.mem','w');

formatSpec = '%.3f';
for i = 1 : N
    data_in = sim_in(i);
    data_out = sim_out(i);

    bin_in = data_in.bin;
    dbl_in = data_in.double;
    bin_out = data_out.bin;
    dbl_out = data_out.double;
    
    str_BIN = convertCharsToStrings(bin_in);
    str_DBL = num2str(dbl_in,formatSpec);
    str_in = str_BIN + "// DBL = " + str_DBL;   
    str_BIN = convertCharsToStrings(bin_out);
    str_DBL = num2str(dbl_out,formatSpec);
    str_out = str_BIN + "// DBL = " + str_DBL;
    if (i==N)
        fprintf(fileID_in,'%s',str_in);
        fprintf(fileID_out,'%s',str_out);
    else
        fprintf(fileID_in,'%s\n',str_in);
        fprintf(fileID_out,'%s\n',str_out);
    end
end

fclose(fileID_in);
fclose(fileID_out);