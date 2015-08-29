% Per Unit Example
clc;
clear all;

disp('MATLAB Experiment for solving PER UNIT Problems');
fprintf('\n');

total_generators = input('How many Generators do you have? ');
total_transformers = input('How many Transformers do you have? ');
total_transmission_lines = input('How many Transmission lines do you have? ');
total_motors = input('How many Motors do you have? ');
total_loads = input('How many Loads do you have? ');

ask_base = 1;



%mode = input('What do you want as your BASE 1=Gen 2= Transformer 3=Mot 4=Tx Line 5= Load');
   fprintf('\n\n\n');
   


counter = 0;
while (total_generators ~= counter )
    
   fprintf('Input Data for Generator No: %d\n\n\n\n',counter + 1);

   gen_mva(counter + 1) = input('Generator MVA: ');
   gen_kv(counter + 1) = input('Generator KV: ');
   gen_r(counter + 1) = input('Generator Reactance: ');
   
   if ask_base
      ask_base = input ('Do you want to consider this your BASE? 1 = YES   2 = NO :   ');
      if (ask_base == 1)
          base_mva = gen_mva(counter + 1);
          base_kv = gen_kv(counter + 1);
          ask_base = 0;
      end
   end
   counter = counter + 1;
   fprintf('\n\n\n');
   
    
    
end

counter = 0;
while (total_transformers ~= counter )
    
   fprintf('Input Data for Transformer No: %d\n\n\n\n',counter + 1);
   if ask_base
      ask_base = input ('Do you want to consider this your BASE? 1 = YES   2 = NO :   ');
      if (ask_base == 1)
          ask_base = 0;
      end
   end
   trans_mva(counter + 1) = input('Transformer MVA: ');
   trans_lv(counter + 1) = input('Transformer LV: ');
   trans_hv(counter + 1) = input('Transformer HV: ');
   trans_percent(counter + 1) = input('Percent Reactance: ');
   counter = counter + 1;
   fprintf('\n\n\n');
    
    
end

counter = 0;
while (total_transmission_lines ~= counter )
    
   fprintf('Input Data for Transmission Line No: %d\n\n\n\n',counter + 1);
   if ask_base
      ask_base = input ('Do you want to consider this your BASE? 1 = YES   2 = NO :   ');
      if (ask_base == 1)
          ask_base = 0;
      end
   end
   tx_ohm_per_km(counter + 1) = input('Transmission Line Reactance per KM: ');
   tx_length(counter + 1) = input('Length of Transmission Line in KM: ');
   counter = counter + 1;
   fprintf('\n\n\n');
   
    
    
end

counter = 0;
while (total_motors ~= counter )
    
   fprintf('Input Data for Motor No: %d\n\n\n\n',counter + 1);
   if ask_base
      ask_base = input ('Do you want to consider this your BASE? 1 = YES   2 = NO :   ');
      if (ask_base == 1)
          ask_base = 0;
      end
   end
   mot_mva(counter + 1) = input('Motor MVA: ');
   mot_kv(counter + 1) = input('Motor KV: ');
   mot_r_percent(counter + 1) = input('Motor Reactance %: ');
   counter = counter + 1;
   fprintf('\n\n\n');
    
    
end


counter = 0;
while (total_loads ~= counter)
    fprintf('Input Data for Load No: %d\n\n\n\n' , counter + 1);
    if ask_base
      ask_base = input ('Do you want to consider this your BASE? 1 = YES   2 = NO :   ');
      if (ask_base == 1)
          ask_base = 0;
      end
    end
    load_mw(counter + 1) = input('Enter the load MW rating: ');
    load_kv(counter + 1) = input('Enter the load KV rating: ');
    load_lead_lag(counter + 1) = input('Is the LOAD Leading or Lagging? 1=Lead 2=Lag ');
    load_pf(counter + 1) = input('What is the Load Power Factor? ');
    counter = counter + 1;
    fprintf('\n\n\n');
   
end





% Calculating 


counter = 0;
while (total_generators ~= counter )
    
%   fprintf('Input Data for Generator No: %d\n\n\n\n',counter + 1);

   base_mva(counter + 1) = gen_mva(counter + 1);
   base_kv(counter + 1) = gren_kv(counter + 1);
   gen_r(counter + 1) = input('Generator Reactance: ');
   
   if ask_base
      ask_base = input ('Do you want to consider this your BASE? 1 = YES   2 = NO :   ');
      if (ask_base == 1)
          base_mva = gen_mva(counter + 1);
          base_kv = gen_kv(counter + 1);
          ask_base = 0;
      end
   end
   counter = counter + 1;
   fprintf('\n\n\n');
   
    
    
end

counter = 0;
while (total_transformers ~= counter )
    
   fprintf('Input Data for Transformer No: %d\n\n\n\n',counter + 1);
   if ask_base
      ask_base = input ('Do you want to consider this your BASE? 1 = YES   2 = NO :   ');
      if (ask_base == 1)
          ask_base = 0;
      end
   end
   trans_mva(counter + 1) = input('Transformer MVA: ');
   trans_lv(counter + 1) = input('Transformer LV: ');
   trans_hv(counter + 1) = input('Transformer HV: ');
   trans_percent(counter + 1) = input('Percent Reactance: ');
   counter = counter + 1;
   fprintf('\n\n\n');
    
    
end

counter = 0;
while (total_transmission_lines ~= counter )
    
   fprintf('Input Data for Transmission Line No: %d\n\n\n\n',counter + 1);
   if ask_base
      ask_base = input ('Do you want to consider this your BASE? 1 = YES   2 = NO :   ');
      if (ask_base == 1)
          ask_base = 0;
      end
   end
   tx_ohm_per_km(counter + 1) = input('Transmission Line Reactance per KM: ');
   tx_length(counter + 1) = input('Length of Transmission Line in KM: ');
   counter = counter + 1;
   fprintf('\n\n\n');
   
    
    
end

counter = 0;
while (total_motors ~= counter )
    
   fprintf('Input Data for Motor No: %d\n\n\n\n',counter + 1);
   if ask_base
      ask_base = input ('Do you want to consider this your BASE? 1 = YES   2 = NO :   ');
      if (ask_base == 1)
          ask_base = 0;
      end
   end
   mot_mva(counter + 1) = input('Motor MVA: ');
   mot_kv(counter + 1) = input('Motor KV: ');
   mot_r_percent(counter + 1) = input('Motor Reactance %: ');
   counter = counter + 1;
   fprintf('\n\n\n');
    
    
end


counter = 0;
while (total_loads ~= counter)
    fprintf('Input Data for Load No: %d\n\n\n\n' , counter + 1);
    if ask_base
      ask_base = input ('Do you want to consider this your BASE? 1 = YES   2 = NO :   ');
      if (ask_base == 1)
          ask_base = 0;
      end
    end
    load_mw(counter + 1) = input('Enter the load MW rating: ');
    load_kv(counter + 1) = input('Enter the load KV rating: ');
    load_lead_lag(counter + 1) = input('Is the LOAD Leading or Lagging? 1=Lead 2=Lag ');
    load_pf(counter + 1) = input('What is the Load Power Factor? ');
    counter = counter + 1;
    fprintf('\n\n\n');
   
end

