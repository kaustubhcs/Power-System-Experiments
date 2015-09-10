%% Fault Analysis of Generator power transmission
% Aim: A double line to ground fault occurs on the terminals of generator
% deterine the line current, fault current and line to neutral voltages
% under the fault conditions.
% z0 = j0.05
% z1 = j0.2
% z2 = j0.2
% zn = 0
% 

%%
% 
% <<C:\Users\Kaustubh\Pictures\mlogo.jpg>>
% 



%% Clearing Screen

clear all;
clc

%% Load Inputs
% Mode is used simply for the purposes for publishing
% * 1 = Runtime Analysis
% * 2 = Preset Input data

mode = 2;


if mode == 1
    
    mvaline = input('Enter 3 phase base MVA: '); 
    kvline = input('Enter base voltage (KV line value):'); 

end

if mode == 2
    
    mvaline = 30;
    kvline = 11;
    
end

z2 = 0.2i;
z1 = 0.2i;
z0 = 0.05i;


%%
%
% $$MVA_{Base} = \frac{MVA_{Line}}{3}$$
%
%
% $$KVA_{Base} = \frac{KVA_{Line}}{\sqrt{3}}$$
%

mva_base = mvaline/3;
kv_phase = kvline/sqrt(3);

kv_pu = 11/kvline; 
a=1*exp(1i*deg2rad(120)); 
%%
%
% $$I_{a_{base}} = \frac{MVA_{Base}}{KV_{Phase}}$$
%

Ia_base = mva_base/kv_phase;
Ia1 = kv_pu / ( z1 + z2 * z0 / ( z2 + z0 ) ); 
Ia2 = -Ia1*z0/(z0+z2);
Ia0 = -Ia1*z2/(z0+z2);
Ia = (Ia0 + Ia1 + Ia2)*Ia_base;
Ib = (Ia0 + a*a*Ia1 + a*Ia2)*Ia_base; 
Ic = (Ia0 + a*Ia1 + a*a*Ia2)*Ia_base;
Ifg = Ib + Ic;
va1 = kv_pu - Ia1*z1; 
va0 = va1;
va2 = va1;
va = (va0 + va1 + va2)*kv_phase;
vb = (va0 + a*a*va1 + a*va2)*kv_phase; 
vc = (va0 + a*va1 + a*a*va2)*kv_phase;

%% Line Currents


fprintf('\n Ia is = %f Angle(%f) KA',abs(Ia), radtodeg(angle(Ia))); 
fprintf('\n Ib is = %f Angle(%f) KA',abs(Ib), radtodeg(angle(Ib))); 
fprintf('\n Ic is = %f Angle(%f) KA',abs(Ic), radtodeg(angle(Ic)));

%% Voltages [Line to Neutral]


fprintf('\n Va is = %f Angle(%f) KV',abs(va), radtodeg(angle(va))); 
fprintf('\n Vb is = %f Angle(%f) KV',abs(vb), radtodeg(angle(vb))); 
fprintf('\n Vc is = %f Angle(%f) KV',abs(vc), radtodeg(angle(vc)));

%% Fault Current

fprintf('\n Fault Current is = %f Angle(%f) KA',abs(Ifg), radtodeg(angle(Ifg))); 
fprintf('\n');

%% Answers
% Ia = 0
% Ib = 10408.1 Angle 130.9
% Ic = 10408.1 Angle 49.1
% If = 15746 Angle 90
% Va = 3.174 Kv
% Vb = Vc = 0
%

%% Conclusion
% Conclusion: Thus we conclude from this porblem statement of double line
% fault that the voltage of the line on which fault occurs reduces
% practically to zero and the current on the same lines increases heavily,
% whereas the voltage on the non faulty line isnt zero but the current is
% causing the system to enter in an Unbalanced load condition.