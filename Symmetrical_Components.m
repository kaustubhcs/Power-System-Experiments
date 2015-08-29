%										Experiment
%
%   Aim: Determine the Symmetrical Components of 3 voltages
%		Va = 200 Angle 0
%		Vb = 200 Angle 245
%		Vc = 200 Angle 105
%	
%
%	Program:

clc;
clear all;
welcome_string = 'Welcome to POWERKTB Software';
disp(welcome_string);

curr_vals = input('How many current values do you have ? ');

switch curr_vals
    case 1
        op1 = 'Cannot Solve the sum, need 1 more current value';
        disp(op1);
        jump_activated = 1;
        
    case 2
        iam = input('First Current Value Magnitude Part: ');
        iaa = input('First Current Value Angle Part: ');
        ibm = input('Second Current Value Magnitude Part: ');
        iba = input('Second Current Value Angle Part: ');
        za = need_for_speed(iam,iaa);
        zb = need_for_speed(ibm,iba);
        zc = -1 * (za + zb);
        a = need_for_speed(1,120);
        a2 = a*a;
        jump_activated = 0;
        
        
    case 3
        iam = input('First Current Value Magnitude Part: ');
        iaa = input('First Current Value Angle Part: ');
        ibm = input('Second Current Value Magnitude Part: ');
        iba = input('Second Current Value Angle Part: ');
        icm = input('Third Current Value Magnitude Part: ');
        ica = input('Third Current Value Angle Part: ');  
        za = need_for_speed(iam,iaa);
        zb = need_for_speed(ibm,iba);
        zc = need_for_speed(icm,ica);
        a = need_for_speed(1,120);
        a2 = a*a;
        jump_activated = 0;

        
end


if jump_activated == 0

        curr_mat = [za;
                    zb;
                    zc;]
                
        aux_za = cart2pol_ktb(za);
        aux_zb = cart2pol_ktb(zb);
        aux_zc = cart2pol_ktb(zc);


        Ans_in_polar = [aux_za(1) aux_za(2);
                        aux_zb(1) aux_zb(2);
                        aux_zc(1) aux_zc(2);];



        manipulator = [ 1 1 1;
                        1 a a2;
                        1 a2 a;];
        manipulator


        solution_a = (1/3) * manipulator * curr_mat;
        Answer_in_cartesian = solution_a;
        Answer_in_cartesian
        Ans_in_polar

        
end

end_string = 'Thank You:::::: Program Exit Code ';
disp(end_string);
disp(jump_activated);

%OUTPUT: As follows

