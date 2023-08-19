function values =eva_ati_module_average(time_series, values_series)
%EVA_ATI_MODULE_AVERAGE 
% Automatically generated once by read_parameter_xml.m
% This function will be called by evaluation_module_average.m

% Parameters only be generated once by read_parameter_xml.m.
% If you change the parameters of your evaluation submodule, you need to
% get parameters by eva_ati_module_parameters()

% The following operations are for multi-core parallel computing.
file_name_param = "eva_ati_module_parameters";
[~,str_core] = get_multi_core_value();
fun_params = str2func(strcat(file_name_param,str_core));
[v_flock,...
T_end,...
t_0,...
y_NA,...
r_com,...
y_finish] = fun_params();

%%% Consistency %%%
ind_s = find(time_series>t_0,1);
ind_e = find(values_series(1,:)==0,1);
phi_cv_mean = mean(values_series(1,ind_s:ind_e));
phi_cv_std = std(values_series(1,ind_s:ind_e));
phi_con = phi_cv_mean * (1-phi_cv_std)^10;

%%% Cohesion %%%
phi_coh = min(values_series(2,:));

%%% Finish performance %%%
phi_finish = values_series(3,end);

F = phi_con*phi_coh*phi_finish;
values = [F;phi_con;phi_coh;phi_finish];


end