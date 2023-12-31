function [number,...
time_max,...
sample_time_motion,...
sample_time_control_upper,...
sample_time_control_bottom,...
activate_save_states,...
time_interval_save,...
motion_model_type,...
swarm_algorithm_type,...
evaluation_metric_type] = setting_parameters()
%SETTING_PARAMETERS 
% Automatically generated by read_parameter_xml.m
% Every time read_parameter_xml.m is run, this function will be generated
number = 100.000000000000;
time_max = 2000.000000000000;
sample_time_motion = 0.002500000000;
sample_time_control_upper = 0.100000000000;
sample_time_control_bottom = 0.002500000000;
activate_save_states = 0.000000000000;
time_interval_save = 1.000000000000;
motion_model_type = 1.000000000000;
swarm_algorithm_type = ['a', 't', 'i'];
evaluation_metric_type = ['e', 'v', 'a', '_', 'a', 't', 'i'];


end