%% Unsymmetrical Fault Analysis
% Aim: A 3 phase, 3 wire system has a normal voltage of 10.4 KV between the
% line it is supplied by a generator having positive, negative and zero
% sequence reactances of 0.6, 0.5, 0.2 ohm/ phase. Calculate the fault
% current when line to line fault occurs at the generator terminals


%%
% 
% <<C:\Users\Kaustubh\Pictures\mlogo.jpg>>
%


%% Clearing Screen

clear all;
clc;
disp('Fault Analysis');

%% Load Inputs

%%
%
% $$Generator\ Reactance\ _{Positive Sequence} = 0.6\ {\Omega}$$ 
%
%
% $$Generator\ Reactance\ _{Negative Sequence} = 0.5\ {\Omega}$$ 
%
%
% $$Generator\ Reactance\ _{Zero Sequence} = 0.2\ {\Omega}$$ 
%
%
% $$Line\ -\ Line\ Neutral\ Voltage\ =\ 10.4\ KV$$ 
%
z0 = complex(0,0.2);
z1 = complex(0,0.6);
z2 = complex(0,0.5);
lnl_voltage = 10.4;

%% Formula

%%
%
% $$Fault\ Current = \frac{\sqrt{3} \times Line\ -\ Line\ Neutral\ Voltage }{X_{1} + X_{2}}$$ 
%

%% Calculations

fault_current = sqrt(3) * lnl_voltage * 1000 / ((z1 + z2) * sqrt(3))

%% Answer

%%
%
% $$Fault\ Current\ =\ 9454.54\ Angle\ -90\ Amperes$$ 
%

%% Conclusion
% Conclusion: Thus the amount of current conducted during the line to line
% fault has been derived thus providing us with one of the parameeters to
% consider the ratings of Circuit Breakers.

%%
% <http://www.kaustubh.us www.kaustubh.us> 