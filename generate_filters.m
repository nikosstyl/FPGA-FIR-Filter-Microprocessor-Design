clear firMinimumOrder;
clear fir20Order;
clear fir30Order;

% firMinimumOrder = designfilt('lowpassfir','PassbandFrequency',8e3,'StopbandFrequency',9.6e3,'PassbandRipple',1,'StopbandAttenuation',60,'SampleRate',46000);
% fir20Order = designfilt('lowpassfir','FilterOrder',20,'PassbandFrequency',8e+3,'StopbandFrequency',9.6e+3,'SampleRate',46000);
% fir30Order = designfilt('lowpassfir','FilterOrder',30,'PassbandFrequency',8e+3,'StopbandFrequency',9.6e+3,'SampleRate',46000);

% Calculate filter specs
spec_firMinimumOrder = fdesign.lowpass('Fp,Fst,Ap,Ast', 8e+3, 9600, 1, 60, 46e+3);
spec_fir20Order = fdesign.lowpass('N,Fp,Fst,Ap', 20, 8e+3, 9600, 60, 46e+3);
spec_fir30Order = fdesign.lowpass('N,Fp,Fst,Ap', 30, 8e+3, 9600, 60, 46e+3);

% Create filters
firMinimumOrder = design(spec_firMinimumOrder, 'equiripple', 'SystemObject', true);
fir20Order = design(spec_fir20Order, 'equiripple', 'SystemObject', true);
fir30Order = design(spec_fir30Order, 'equiripple', 'SystemObject', true);

% Create HDL filters

% firMinimumOrder: Different arithmetics
% Architecture: Fully Parallel
% Coefficient multipliers: Multiplier
% Multiplier input pipeline: 1
% Multiplier output pipeline: 1
% Add pipeline registers: True
% Optimize for HDL: True
% fdhdltool(firMinimumOrder, numerictype(1,32,0));
% pause;
% fdhdltool(firMinimumOrder, numerictype(1,24,0));
% pause;
% fdhdltool(firMinimumOrder, numerictype(1,8,0));
% pause;

% firMinimumOrder: Different arithmetics
% Architecture: Fully Parallel
% Coefficient multipliers: Multiplier
% Multiplier input pipeline: 2
% Multiplier output pipeline: 2
% Add pipeline registers: True
% Optimize for HDL: True
% fdhdltool(firMinimumOrder, numerictype(1,32,0));
% pause;
fdhdltool(firMinimumOrder, numerictype(1,24,0));
pause;
fdhdltool(firMinimumOrder, numerictype(1,8,0));