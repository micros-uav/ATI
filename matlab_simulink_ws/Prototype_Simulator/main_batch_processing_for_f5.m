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
    "CoFlyers.swarm.ati.r_m",...
    "CoFlyers.swarm.ati.p_informed__"];
% Proportion of informed agents
p_informed = [0,0.05,0.1,0.15,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0];
% Each element: [interaction, k, mu, r_m]
KTI = 0; SBTI = 1; HTI = 2; ATI = 3; DMI = 4;
params = {[KTI,1,40/180*pi,1.1],[SBTI,1,40/180*pi,1.1],...
    [ATI,4,40/180*pi,1.1],[DMI,1,40/180*pi,1.1]};
params_temp = {};
for i = 1:length(params)
    for j = 1:length(p_informed)
        params_temp = [params_temp,[params{i},p_informed(j)]];
    end
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