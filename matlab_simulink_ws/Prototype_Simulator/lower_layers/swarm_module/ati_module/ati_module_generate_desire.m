function [command_upper_s,control_mode_s] =ati_module_generate_desire(t, states, sample_time, sensor_data_s)
%ATI_MODULE_GENERATE_DESIRE Generate the desired position and velocity
% Automatically generated once by read_parameter_xml.m
% This function will be called by swarms_module_generate_desire.m
%   point-mass: state = [x; y; z; vx; vy; vz; ax; ay; az]
%   quadcopter: state = [x; y; z; vx; vy; vz; ax; ay; az; yaw; roll; Pitch];
% control_mode:
% TAKEOFF_TYPE = 2;
% HOVER_TYPE = 3;
% LAND_TYPE = 4;
% POSITION_CONTROL_TYPE = 5;
% VELOCITY_CONTROL_TYPE = 6;
% VELOCITY_HORIZONTAL_CONTROL_TYPE = 7;


% Parameters only be generated once by read_parameter_xml.m.
% If you change the parameters of your swarm submodule, you need to
% get parameters by ati_module_parameters()

% The following operations are for multi-core parallel computing.
file_name_param = 'ati_module_parameters';
[~,str_core] = get_multi_core_value();
fun_params = str2func([file_name_param,str_core]);

[r_com,...
v_flock,...
r_rep_0,...
p_rep,...
r_frict_0,...
c_frict,...
v_frict,...
p_frict,...
a_frict,...
r_shill_0,...
v_shill,...
p_shill,...
a_shill,...
v_max,...
dim,...
height,...
dr_shill,...
pos_shill,...
vel_shill,...
v_t,...
informed,...
int_type,...
k,...
mu,...
r_m,...
y_finish,...
y_stop] = fun_params();

number = length(informed);
%================Terminal determine=================%
persistent stop_s_save
if isempty(stop_s_save) || t==0
    stop_s_save = false(1,number);
end
y_stop_now = y_stop - sum(stop_s_save)/number * (y_stop-y_finish);
stop_s = false(1,number);
stop_s(1:number) = states(2,:) > y_stop_now;
stop_s_save = stop_s;
% finished_s = states(2,:) > y_finish;
%===================================================%

%
number = size(states,2);
command_upper_s = zeros(12,number);
command_upper_s(1:3,:) = states(1:3,:);
control_mode_s = uint8(zeros(1,number))+7;

% Traverse every agent
for id  = 1:number
    state_i = states(:,id);
    %%%%%Find neighbors%%%%%
    posId = state_i(1:2); 
    posijArray = repmat(posId,1,number) - states(1:2,:);
    disij = sqrt(sum(posijArray.^2,1));
    disij(id) = inf;
    %%% Metric
    ind_s_metric = Metric_selection(disij,r_com);
    if ~isempty(ind_s_metric)
        [ind_s_topo,~] = neighbours_select(disij(ind_s_metric), posijArray(:,ind_s_metric), int_type, k, mu, false,r_m);
    else
        ind_s_topo = [];
    end
    ind_s = ind_s_metric(ind_s_topo);

    posid_to_neighbor = posijArray(:,ind_s);
    dis_to_neighbor = disij(ind_s);
    states_neighbor = states(:,ind_s);
    %%%%%Distributed control%%%%%
    [pos_desired_id,vel_desired_id,acc_desired_id,control_mode_id] =...
            ati_module_generate_desire_i(id,state_i,states_neighbor,...
            dis_to_neighbor,posid_to_neighbor,stop_s(id));
    %%%%%Transfer to commands%%%%%
% 	pos_desired_id = [states(1:3,id);0];
% 	pos_desired_id(3) = 1;
% 	vel_desired_id = [mean(states(4:5,:), 2);0;0];
% 	vel_desired_id(1:2) = 0.1*vel_desired_id(1:2)/norm(vel_desired_id(1:2));
% 	acc_desired_id = [0;0;0;0];
	command_upper_s(:,id) = [pos_desired_id;vel_desired_id;acc_desired_id];
    control_mode_s(id) = control_mode_id;
end

end