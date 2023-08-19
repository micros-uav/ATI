function [posDesired_id,velDesired_id,accDesired_id,control_mode_id] = ati_module_generate_desire_i(id,state_i,states_neighbor,...
        dis_to_neighbor,posid_to_neighbor, stop_id)
%ATI_MODULE_GENERATE_DESIRE_I Summary of this function goes here
%   Detailed explanation goes here

% The following operations are for multi-core parallel computing.
persistent fun_params
if isempty(fun_params)
    file_name_param = 'ati_module_parameters';
    [~,str_core] = get_multi_core_value();
    fun_params = str2func([file_name_param,str_core]);
end
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
dim_alg,...
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


flag_crossing = true;
omega = 1;
% If the collision consequences in physical experiments are severe, 
% this can be used to enhance exclusion
rsafe = 0.0;  % 0.5
rdrone = 0.0; % 0.05
% rsafe = 0.5;  % 0.5
% rdrone = 0.05; % 0.05

VELOCITY_CONTROL_TYPE = 6;
VELOCITY_HORIZONTAL_CONTROL_TYPE = 7;

posDesired_id = [state_i(1:2);height;0];
velDesired_id = zeros(4,1);
accDesired_id = zeros(4,1);
if dim_alg ==2
    control_mode_id = VELOCITY_HORIZONTAL_CONTROL_TYPE;
else
    control_mode_id = VELOCITY_CONTROL_TYPE;
end

pos2DId = state_i(1:2);
vel2DId = state_i(4:5);
vel2D_neighbor = states_neighbor(4:5,:);
%%%% Vist term %%%% 
vFlockId = mean([vel2DId,vel2D_neighbor],2);
vFlockId = vFlockId/norm(vFlockId)*v_flock;

vRepId = zeros(dim_alg,1);
vFrictId = zeros(dim_alg,1);
vAttId = zeros(dim_alg,1);
v_rep_2_id = zeros(dim_alg,1);
v_rep_error_id = zeros(dim_alg,1);
if ~isempty(dis_to_neighbor)
    %%%%%Repulsion term%%%%%
    inRepInCom = find(dis_to_neighbor<r_rep_0 & dis_to_neighbor>rsafe);
    if ~isempty(inRepInCom)
        disijInRep = repmat(dis_to_neighbor(inRepInCom),dim_alg,1);
        vRepId = p_rep * sum((r_rep_0 - disijInRep) .* posid_to_neighbor(:,inRepInCom)./disijInRep,2);
    end
    
    %%%%%Repulsion 2 term%%%%%
    in_rep_2 = find(dis_to_neighbor>rdrone & dis_to_neighbor<=rsafe);
    if ~isempty(in_rep_2)
        p_rep_2 = p_rep*(rsafe - rdrone)^2;
        disij_in_rep_2 = repmat(dis_to_neighbor(in_rep_2),dim_alg,1);
        v_rep_2_id = sum(p_rep_2 ./ (disij_in_rep_2 - rdrone) .* posid_to_neighbor(:,in_rep_2)./disij_in_rep_2,2) ;
    end
    
    in_rep_error = find(dis_to_neighbor<rdrone);
    if ~isempty(in_rep_error)
        p_rep_2 = p_rep*(rsafe - rdrone)^2;
        disij_in_rep_2 = repmat(dis_to_neighbor(in_rep_error),dim_alg,1);
        v_rep_error_id = sum(p_rep_2 / 0.0001 .* posid_to_neighbor(:,in_rep_2)./disij_in_rep_2, 2) ;
    end

    %%%%%Attraction term%%%%%
    inAttInCom = find(dis_to_neighbor>r_rep_0);
    if ~isempty(inAttInCom)
        disijInAtt = repmat(dis_to_neighbor(inAttInCom),dim_alg,1);
        vAttId = p_rep * sum((r_rep_0 - disijInAtt) .* posid_to_neighbor(:,inAttInCom)./disijInAtt,2);
    end
    
    %%%%%Velocity alignment term%%%%%
    vijFrictMax = max(v_frict,Dfunction(dis_to_neighbor - r_frict_0,a_frict,p_frict));
    velijInCom = repmat(vel2DId,1,length(dis_to_neighbor)) - vel2D_neighbor;
    vijInCom = sqrt(sum(velijInCom.^2,1));
    
    inFrictInCom = find(vijInCom > vijFrictMax);
    if ~isempty(inFrictInCom)
        vijInFrict = repmat(vijInCom(inFrictInCom),dim_alg,1);
        vijFrictMaxInFrict = repmat(vijFrictMax(inFrictInCom),dim_alg,1);
        vFrictId = -c_frict * sum((vijInFrict - vijFrictMaxInFrict).*velijInCom(:,inFrictInCom)./vijInFrict,2);
    end
end
%%%%%Avoidance obstacles term%%%%%
vShillId = zeros(dim_alg,1);
posisArray = repmat(pos2DId,1,size(pos_shill,2)) - pos_shill; disis = sqrt(sum(posisArray.^2,1));
inComS = find(disis < r_com); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disisInCom = disis(inComS);

visFrictMax = Dfunction(disisInCom - r_shill_0,a_shill,p_shill);
velisInCom = repmat(vel2DId,1,length(disisInCom)) - v_shill * vel_shill(:,inComS);
visInCom = sqrt(sum(velisInCom.^2,1));

inFrictInComS = find(visInCom > visFrictMax);

if ~isempty(inFrictInComS)
    visInFrict = repmat(visInCom(inFrictInComS),dim_alg,1);
    visFrictMaxInFrict = repmat(visFrictMax(inFrictInComS),dim_alg,1);
    vShillId = - sum((visInFrict - visFrictMaxInFrict).*velisInCom(:,inFrictInComS)./visInFrict,2);
end

%%%%% Crossing term%%%%%
if flag_crossing
%     informed(id) = rand < 0.1;
    omega_id = omega*informed(id);
    vFlockId(1:dim_alg) =...
        ((1-omega_id)*vFlockId(1:dim_alg) + omega_id*v_flock*v_t) * (1-stop_id);
    vFrictId = vFrictId*(1-stop_id);
end

%%%% Noise term %%%%
% v_noise_id = normrnd(0,0.05,[dim_alg,1]);
v_noise_id = zeros([dim_alg,1]);

%%%%%Final equation of desired velocity%%%%%
velDesired_id_2D = vFlockId + vRepId + vFrictId + vShillId + vAttId + v_rep_2_id + v_rep_error_id + v_noise_id;

% Clamp
vel_norm = norm(velDesired_id_2D);
if vel_norm > v_max
    velDesired_id_2D = velDesired_id_2D./vel_norm* v_max;
end
velDesired_id(1:2) = velDesired_id_2D;

end

