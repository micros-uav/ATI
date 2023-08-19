function [ind,other_data] = neighbours_select(dis_to_neighbor,posid_to_neighbor,interaction_type,k,mu,k_clamp,r_metric)
%NEIGHBOURS_SELECT Summary of this function goes here
%   Detailed explanation goes here
other_data = -1;
% [~, ~, ~, ~, k, ~, ~, ~, ~,...
%     ~,~,~,~,~,~,interaction_type,mu] = flocking_model_parameters_deal(parameters_flocking);
% flag_escape =false;


Topological_pure            = 0;
Topological_balenced     = 1; 
Topological_hybrid          = 2;
Topological_adaptive      = 3; %
Metric                              = 4;
Delaunay                         = 5;

switch interaction_type
    case Topological_pure
        ind = neighbor_topological_pure(dis_to_neighbor,k);
    case Topological_balenced
        ind = neighbor_topological_balanced(dis_to_neighbor,posid_to_neighbor,mu);
%         ind = neighbor_k_angles(dis_to_neighbor,posid_to_neighbor,k);
    case Topological_hybrid
        ind_kti = neighbor_topological_pure(dis_to_neighbor,k);
        ind_sbti = neighbor_topological_balanced(dis_to_neighbor,posid_to_neighbor,mu);
        ind = unique([ind_kti,ind_sbti]);
    case Topological_adaptive
        [ind,type_select] = neighbor_topological_adaptive(dis_to_neighbor,posid_to_neighbor,k,mu,k_clamp);
        other_data(1) = type_select;
    case Metric
        ind = Metric_selection(dis_to_neighbor, r_metric);
    case Delaunay
        ind = neighbor_delaunay(dis_to_neighbor,posid_to_neighbor);
    otherwise
        ind = [];
end

% disp(length(ind));

function ind = neighbor_delaunay(dis_to_neighbor,posid_to_neighbor)
ind = [];
%     aa = [0,0,0;posid_to_neighbor'];
%     dt = delaunayTriangulation(aa);
%     V = vertexAttachments(dt,1);
%     ind_ = unique(dt(V{:},:)) - 1;
%     ind = ind_(2:end);
end

end