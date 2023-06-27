clear firMinimumOrder;
clear fir20Order;
clear fir30Order;

% Those methods below are deprecated
% firMinimumOrder = designfilt('lowpassfir','PassbandFrequency',8e3,'StopbandFrequency',9.6e3,'PassbandRipple',1,'StopbandAttenuation',60,'SampleRate',46000);
% fir20Order = designfilt('lowpassfir','FilterOrder',20,'PassbandFrequency',8e+3,'StopbandFrequency',9.6e+3,'SampleRate',46000);
% fir30Order = designfilt('lowpassfir','FilterOrder',30,'PassbandFrequency',8e+3,'StopbandFrequency',9.6e+3,'SampleRate',46000);

%% Calculate filter specs
spec_firMinimumOrder = fdesign.lowpass('Fp,Fst,Ap,Ast', 8e+3, 9600, 1, 60, 46e+3);
spec_fir20Order = fdesign.lowpass('N,Fp,Fst,Ap', 20, 8e+3, 9600, 60, 46e+3);
spec_fir30Order = fdesign.lowpass('N,Fp,Fst,Ap', 30, 8e+3, 9600, 60, 46e+3);

%% Create filters
firMinimumOrder = design(spec_firMinimumOrder, 'equiripple', 'SystemObject', true);
fir20Order = design(spec_fir20Order, 'equiripple', 'SystemObject', true);
fir30Order = design(spec_fir30Order, 'equiripple', 'SystemObject', true);

%% Create HDL filters
% ---------------------------- START FIR Minimum Order ---------------------------- 
fprintf("firMinimumOrder: \n");
fprintf("Architecture: Fully Parallel\n");
fprintf("Coefficient multipliers: Multiplier\n");
fprintf("Multiplier input pipeline: 1\n");
fprintf("Multiplier output pipeline: 1\n");
fprintf("Add pipeline registers: True\n");
fprintf("Optimize for HDL: True\n");
fprintf("Arrithmetic: 32-bit floating point\n");
fdhdltool(firMinimumOrder, numerictype(1,32,0));
pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,8,0));
% pause;
% fprintf("\n\n");

fprintf("firMinimumOrder: \n");
fprintf("Architecture: Fully Parallel\n");
fprintf("Coefficient multipliers: Multiplier\n");
fprintf("Multiplier input pipeline: 2\n");
fprintf("Multiplier output pipeline: 2\n");
fprintf("Add pipeline registers: True\n");
fprintf("Optimize for HDL: True\n");
fprintf("Arrithmetic: 32-bit floating point\n");
fdhdltool(firMinimumOrder, numerictype(1,32,0));
pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,8,0));
% pause;
% fprintf("\n\n");

fprintf("firMinimumOrder: \n");
fprintf("Architecture: Fully Parallel\n");
fprintf("Coefficient multipliers: Factored-CSD\n");
fprintf("Add pipeline registers: True\n");
fprintf("Optimize for HDL: True\n");
fprintf("Arrithmetic: 32-bit floating point\n");
fdhdltool(firMinimumOrder, numerictype(1,32,0));
pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,8,0));
% fprintf("\n\n");

fprintf("firMinimumOrder: \n");
fprintf("Architecture: Distributed Arithmetic\n");
fprintf("Specify folding: Folding factor: 24\n");
fprintf("Specify LUT: Address Width: 6\n");
fprintf("Multiplier input pipeline: 1\n");
fprintf("Multiplier output pipeline: 1\n");
fprintf("Optimize for HDL: True\n");
fprintf("Arrithmetic: 32-bit floating point\n");
fdhdltool(firMinimumOrder, numerictype(1,32,0));
pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(firMinimumOrder, numerictype(1,8,0));
% fprintf("\n\n");

% % ---------------------------- START FIR Order 20 ---------------------------- 
% fprintf("fir20Order: \n");
% fprintf("Architecture: Fully Parallel\n");
% fprintf("Coefficient multipliers: Multiplier\n");
% fprintf("Multiplier input pipeline: 1\n");
% fprintf("Multiplier output pipeline: 1\n");
% fprintf("Add pipeline registers: True\n");
% fprintf("Optimize for HDL: True\n");
% fprintf("Arrithmetic: 32-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,32,0));
% pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,8,0));
% pause;
% fprintf("\n\n");
% 
% fprintf("fir20Order: \n");
% fprintf("Architecture: Fully Parallel\n");
% fprintf("Coefficient multipliers: Multiplier\n");
% fprintf("Multiplier input pipeline: 2\n");
% fprintf("Multiplier output pipeline: 2\n");
% fprintf("Add pipeline registers: True\n");
% fprintf("Optimize for HDL: True\n");
% fprintf("Arrithmetic: 32-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,32,0));
% pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,8,0));
% fprintf("\n\n");
% 
% fprintf("fir20Order: \n");
% fprintf("Architecture: Fully Parallel\n");
% fprintf("Coefficient multipliers: Factored-CSD\n");
% fprintf("Add pipeline registers: True\n");
% fprintf("Optimize for HDL: True\n");
% fprintf("Arrithmetic: 32-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,32,0));
% pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,8,0));
% fprintf("\n\n");

% fprintf("fir20Order: \n");
% fprintf("Architecture: Distributed Arithmetic\n");
% fprintf("Specify folding: Folding factor: 24\n");
% fprintf("Specify LUT: Address Width: 6\n");
% fprintf("Multiplier input pipeline: 1\n");
% fprintf("Multiplier output pipeline: 1\n");
% fprintf("Optimize for HDL: True\n");
% fprintf("Arrithmetic: 32-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,32,0));
% pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(fir20Order, numerictype(1,8,0));
% fprintf("\n\n");

% 
% % ---------------------------- START FIR Order 30 ---------------------------- 
% fprintf("fir30Order: \n");
% fprintf("Architecture: Fully Parallel\n");
% fprintf("Coefficient multipliers: Multiplier\n");
% fprintf("Multiplier input pipeline: 1\n");
% fprintf("Multiplier output pipeline: 1\n");
% fprintf("Add pipeline registers: True\n");
% fprintf("Optimize for HDL: True\n");
% fprintf("Arrithmetic: 32-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,32,0));
% pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,8,0));
% pause;
% fprintf("\n\n");
% 
% fprintf("fir30Order: \n");
% fprintf("Architecture: Fully Parallel\n");
% fprintf("Coefficient multipliers: Multiplier\n");
% fprintf("Multiplier input pipeline: 2\n");
% fprintf("Multiplier output pipeline: 2\n");
% fprintf("Add pipeline registers: True\n");
% fprintf("Optimize for HDL: True\n");
% fprintf("Arrithmetic: 32-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,32,0));
% pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,8,0));
% fprintf("\n\n");

% fprintf("fir30Order: \n");
% fprintf("Architecture: Fully Parallel\n");
% fprintf("Coefficient multipliers: Factored-CSD\n");
% fprintf("Add pipeline registers: True\n");
% fprintf("Optimize for HDL: True\n");
% fprintf("Arrithmetic: 32-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,32,0));
% pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,8,0));
% fprintf("\n\n");

% fprintf("fir30Order: \n");
% fprintf("Architecture: Distributed Arithmetic\n");
% fprintf("Specify folding: Folding factor: 24\n");
% fprintf("Specify LUT: Address Width: 6\n");
% fprintf("Multiplier input pipeline: 1\n");
% fprintf("Multiplier output pipeline: 1\n");
% fprintf("Optimize for HDL: True\n");
% fprintf("Arrithmetic: 32-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,32,0));
% pause;
% fprintf("Arrithmetic: 24-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,24,0));
% pause;
% fprintf("Arrithmetic: 16-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,16,0));
% pause;
% fprintf("Arrithmetic: 8-bit floating point\n");
% fdhdltool(fir30Order, numerictype(1,8,0));
% fprintf("\n\n");
