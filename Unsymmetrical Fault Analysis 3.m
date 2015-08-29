%% Unsymmetrical Fault Analysis
% Aim: A 30 MVA, 11kV Generator has Z1 = Z2 = j0.2 pu, Z0 = j0.05 pu
% a) A line to ground fault, occurs on the generator terminals, find the
% fault current and line to line voltages during fault conditions. Assume
% that the generator neutral is solidly grounded and the generator is
% operating at no load and at rated voltage condition at the occurence of
% the fault.
% b) Find the line current for a three phase fault.

%%
% 
% <<C:\Users\Kaustubh\Pictures\mlogo.jpg>>
%


%% Clearing Screen

clear all;
clc;
disp('Unsymmetrical Fault Analysis');

%% Load Inputs
% Mode provision is for the purposes of Publishing solely.
% Set it to 1 for Publishing
% Set it to 2 for Runtime Analysis


mode = 2;

if mode == 1
    mva = input('Generator MVA: ');
    kv = input('Generator kv: '); 
    z0 = complex(0,input('Generator Zero Sequence impedance: '));
    z1 = complex(0,input('Generator Positive Sequence impedance: '));
    z2 = complex(0,input('Generator Negative Sequence impedance: '));    
end    

if mode == 2

   mva = 30;
   kv = 11;
    z0 = complex(0,0.05);
    z1 = complex(0,0.2);
    z2 = complex(0,0.2);    
    
end
    


base_current = complex((mva * 1000000) / ( (kv * 1000) * sqrt(3)));
random = (pi / 180) * 120;
[temp1,temp2] = pol2cart(random,1);
a = complex(temp1,temp2);


ea1 = complex(pol2cart(0,1));

    
    
%% L - G Fault


%%
%
% $$I_{a1} = I_{a2} = I_{a0} = \frac{E}{Z_{1} + Z_{2} + Z_{0}}$$
%

ia1 = (ea1) / (z0 + z1 + z2);
ia2 = ia1;
ia0 = ia1;

%% Fault Current Analysis

ia = 3 * ia1;
ib = 0;
ic = 0;
[fault_current_angle,fault_current_mag] = cart2pol(real(ia * base_current),imag(ia * base_current));
fault_current_angle = fault_current_angle * 360 / (2 * pi);

fprintf('\nFault Current is %f Angle %f A\n',fault_current_mag,fault_current_angle);


%% Symmetrical Components Analysis

%%
% 
% $$V_{a1} = E - I_{a1}Z_{1}$$
%
% $$V_{a2} = -I_{a2}Z_{2}$$
%
% $$V_{a0} = -I_{a0}Z_{0}$$
%

va0 = -1 * ia0 * z0;
va1 = ea1 - (ia1 * z1);
va2 = -1 * ia2 * z2;


actual_voltages = [0 ; 0 ; 0];
manipulator = [1 1 1;
               1 a^2 a;
               1 a a^2];
           
seq_v = [ va0; va1; va2 ];           
actual_voltages = manipulator * seq_v;
pu_voltages = actual_voltages;
va = pu_voltages(1,1);
vb = pu_voltages(2,1);
vc = pu_voltages(3,1);

%% Per Unit Line to Line Voltages

vab = va - vb;
vbc = vb - vc;
vca = vc - va;

p = 11 / sqrt(3);

%% Getting Actual Line to Line voltages

a_vab = p * vab;
a_vbc = p * vbc;
a_vca = p * vca;

%% Converting to Polar
[actual_vab_angle,actual_vab_mag] = cart2pol(real(a_vab),imag(a_vab));
actual_vab_angle = actual_vab_angle * 360 / (2 * pi);
[actual_vbc_angle,actual_vbc_mag] = cart2pol(real(a_vbc),imag(a_vbc));
actual_vbc_angle = actual_vbc_angle * 360 / (2 * pi);
[actual_vca_angle,actual_vca_mag] = cart2pol(real(a_vca),imag(a_vca));
actual_vca_angle = actual_vca_angle * 360 / (2 * pi);

%% Line to Line Voltages for L - G Fault

fprintf('\nVab is %f Angle %f V\n',actual_vab_mag,actual_vab_angle);
fprintf('\nVbc is %f Angle %f V\n',actual_vbc_mag,actual_vbc_angle);
fprintf('\nVca is %f Angle %f V\n',actual_vca_mag,actual_vca_angle);



%% For a L - L - L Fault

line_current = ea1 / z1;
line_current = base_current * line_current;
[actual_line_current_angle,actual_line_current_mag] = cart2pol(real(line_current),imag(line_current));
actual_line_current_angle = actual_line_current_angle * 360 / (2 * pi);

fprintf('\nActual Line Current is %f Angle %f A\n',actual_line_current_mag,actual_line_current_angle);





%% Conclusion
% Conclusion: A conclusion that can be drawn comparing the values of LG 
% fault and LLL fault one can say that the 3 phase fault line current is
% much smaller than line to ground fault current.

%%
% <http://www.kaustubh.us www.kaustubh.us> 