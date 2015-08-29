%% Unsymmetrical Fault Analysis
% Aim: A 50 MVA 11 KV generator was subjected to different types of faults.
% The fault currents are as under:
%
% 3 Phase Fault 2000 A
%
% Line to line fault 2600 A
% 
% Line to ground fault 4200 A
%
% The generator is solidly grounded 
%
% Find the values of sequence reactances of alternator.
%
% (Ignore Resistance)
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
% $$3\ Phase\ Fault\  =\ 2000\ A$$ 
%
%
% $$Line\ -\ Line\ Fault\  =\ 2600\ A$$ 
%
%
% $$Line\ -\ Ground\ Fault\  =\ 4200\ A$$ 
%


phase_fault = 2000;
lnl_fault = 2600;
lg_fault = 4200;
ln_voltage = 11;

%% For a 3 Phase Fault

%% Formula

%%
%
% $$X_{1}\ =\ \frac{Line\ -\ Line\ Neutral\ Voltage}{Fault\ Current}$$ 
%

%% Calculations

x1 = ln_voltage * 1000 / (sqrt(3) * phase_fault)





%% For a line to line Fault

%% Formula

%%
%
% $$X_{1}\ + X_{2}\ =\ \frac{\sqrt{3}\ \times\ Line\ -\ Neutral\ Voltage}{Fault\ Current}$$ 
%

%% Calculations

k = ln_voltage * 1000 / (lnl_fault)

x2 = k - x1


%% For a Single Line to Ground Fault

%% Formula

%%
%
% $$X_{0}\ + X_{1}\ +\ X_{2}\ =\ \frac{\sqrt{3}\ \times\ Line\ -\ Neutral\ Voltage}{Fault\ Current}$$ 
%

%% Calculations
% K is X1 + x2

t = (sqrt(3) * ln_voltage * 1000) / (lg_fault) 

x0 = t - k

%% Answer

%%
%
% $$X_{0}\ =\ 0.3056\ \Omega$$ 
%
%
% $$X_{1}\ =\ 3.1754\ \Omega$$ 
%
%
% $$X_{2}\ =\ 1.0533\ \Omega$$ 
%


%% Conclusion
% Conclusion: Thus this proves given different values of fault currents we
% can find out the Sequence reactances of the alternators. Thus this is one
% of the methods to obtain the sequence reactance values of generators.

%%
% <http://www.kaustubh.us www.kaustubh.us> 