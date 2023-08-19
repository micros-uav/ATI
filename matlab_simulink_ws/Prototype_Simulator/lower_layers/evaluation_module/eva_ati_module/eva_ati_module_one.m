function values = eva_ati_module_one(t, states, map3d_faces, map3d_struct)
%EVA_ATI_MODULE_ONE 
% Automatically generated once by read_parameter_xml.m
% This function will be called by evaluation_module_one.m

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


number = size(states,2);
dimension = 2;
position = states(1:dimension,:);
velocity = states(4:3+dimension,:);
velocity = velocity + rand(size(velocity))*1e-20; % Exclude dividing by 0
speed = sqrt(sum(velocity.^2,1));
vel_unit = velocity./speed;

%%% Get subgroups %%%
dis_array = pdist(position');
dis_Mat_s = squareform(dis_array);
subgroups = conncomp(graph(dis_Mat_s< r_com),'OutputForm','cell');
num_sub = length(subgroups);

%%% Consistency of velocity magnitude %%%
phi_vel = mean(speed)/v_flock;

%%% Consistency of velocity direction %%%
% phi_corr = norm(mean(velocity./speed,2));
phi_corr = 0;
for i = 1:num_sub
    vel_unit_sub = vel_unit(:,subgroups{i});
    vel_unit_mat = vel_unit_sub'*vel_unit_sub;
    vel_unit_mat(1:number+1:end) = 0;
    phi_corr = phi_corr+sum(vel_unit_mat,'all');
    phi_corr = phi_corr/(length(subgroups{i}) - 1);
end
phi_corr = phi_corr/number;

%%% Consistency %%%
phi_cv = phi_corr*phi_vel;
if sum(position(2,:) > y_NA) > 0
    phi_cv = 0;
end

%%% Cohesion  %%%
phi_coh = 1/num_sub;

%%% task finish performance%%%
persistent finish_s_pre T_finish_s
if isempty(finish_s_pre)
    finish_s_pre = false(1,number);
    T_finish_s = zeros(1,number)+T_end;
end
finish_s_new = position(2,:) > y_finish;
finish_s = finish_s_new | finish_s_pre;
finish_s_new(finish_s_pre) = false;
finish_s_pre = finish_s;
T_finish_s(finish_s_new) = t;
N_finish = sum(finish_s > 0);
if N_finish > 0
    phi_finish = N_finish/number*(1-mean(T_finish_s(finish_s))/T_end);
else
    phi_finish = 0;
end

values = [phi_cv;phi_coh;phi_finish];


end