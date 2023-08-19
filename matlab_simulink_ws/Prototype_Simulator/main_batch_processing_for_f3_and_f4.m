clc;close all;clear;
%% Settings of batch processing
flag_use_parallel   = false;
type_parallel         = 2;      % 1: Parallel computation along parameter combinations 2: Parallel computation along repeated simulations
repeat_times         = 32;    %Times of experimental repetitions used to average multiple simulations
%%%  Get the value combinations of parameters for batch processing.
parameters_bp_s = get_value_combinations();
%% Run batch processing
results = run_batch_processing(flag_use_parallel, type_parallel, repeat_times, parameters_bp_s);

%% Get the value combinations of parameters for batch processing
function parameters_bp_s = get_value_combinations()
% module_order = [6, 1]; %Noise module and motion module
% param_order  = [1, 5];
param_name = ["CoFlyers.swarm.ati.int_type",...
    "CoFlyers.swarm.ati.k",...
    "CoFlyers.swarm.ati.mu",...
    "CoFlyers.swarm.ati.r_m"];

KTI = 0;
SBTI = 1;
HTI = 2;
ATI = 3;
DMI = 4;

type_inter_s = [
    2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,...
    3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,...
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,...
    4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4];
params = {
    [3,80],[3,60],[3,50],[3,40],...
    [4,120],[4,80],[4,60],[4,50],[4,40],...
    [5,120],[5,80],[5,60],[5,50],[5,40],[5,20],...
    [6,120],[6,80],[6,60],[6,50],[6,40],[6,20],...
    [8,120],[8,80],[8,60],[8,50],[8,40],[8,20],...
    [12,120],[12,80],[12,60],[12,50],[12,40],[12,20],...
    [3,80],[3,60],[3,50],[3,40],...
    [4,120],[4,80],[4,60],[4,50],[4,40],...
    [5,120],[5,80],[5,60],[5,50],[5,40],[5,20],...
    [6,120],[6,80],[6,60],[6,50],[6,40],[6,20],...
    [8,120],[8,80],[8,60],[8,50],[8,40],[8,20],...
    [12,120],[12,80],[12,60],[12,50],[12,40],[12,20],...
    1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,...
    160,150,140,130,120,110,100,90,80,70,60,50,40,30,20,10,...
    0.8,0.83,0.85,0.88,0.9,0.93,0.95,0.98,1,1.03,1.05,1.08,1.1,1.13,1.15,1.18,1.2,1.23,1.25,1.28,1.3
    };
params_temp = params;
k_temp = 4;  % Placeholder 
mu_temp = 40;
r_m_temp = 1.1;
for i = 1:length(params)
    type_inter = type_inter_s(i);
    param = params{i};
    switch type_inter
        case KTI
            param_temp = [KTI,param,mu_temp,r_m_temp];
        case SBTI
            param_temp = [SBTI,k_temp,param,r_m_temp];
        case HTI
            param_temp = [HTI,param,r_m_temp];
        case ATI
            param_temp = [ATI,param,r_m_temp];
        case DMI
            param_temp = [DMI,k_temp,mu_temp,param];
    end
    param_temp(3) = param_temp(3)/180*pi;
    params_temp{i} = param_temp;
end
% 
parameters_bp_s = [];
for i = 1:length(params_temp)
    parameters_bp = struct();
    parameters_bp.param_name_s = param_name;
    parameters_bp.param_value_s = arrayfun(@(x)string(x),params_temp{i});
    parameters_bp_s = [parameters_bp_s,parameters_bp];
end
end