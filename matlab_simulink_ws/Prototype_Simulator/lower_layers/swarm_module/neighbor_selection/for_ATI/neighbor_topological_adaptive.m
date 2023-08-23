function [ind,type_select,ind_kti,ind_sbti] = neighbor_topological_adaptive(dis_to_neighbour,posid_to_neighbour,k,mu,flag_k_clamp)

% Lines of sight pointing towards neighbors
angle_to_neighbour = atan2(posid_to_neighbour(2,:),posid_to_neighbour(1,:));

% Select neighbours using KTI according to relative distances
ind_kti = neighbor_topological_pure(dis_to_neighbour,k);

% Examine whether the minimum visual angle
% that covers all lines of sight 
% pointing towards all KTI neighbours is smaller than 180°.
case2 = ~inside_convex_hull_angle(angle_to_neighbour(ind_kti));

% If the minimum visual angle is greater than 180°, use KTI.
% Otherwise, further decision will be made.
if case2
    
    % Select neighbours using SBTI according to relative positions
    ind_sbti = neighbor_topological_balanced(dis_to_neighbour,posid_to_neighbour,mu);
    
    % Examine whether the visual distribution of the KTI neighbours 
    % dose not covers the SBTI neighbours 
    case3 = kti_not_cover_sbti(angle_to_neighbour(ind_kti), angle_to_neighbour(ind_sbti));
    
    % If the visual distribution of the KTI neighbours does not cover the
    % SBTI neighbours, using SBTI.
    if ~case3
        ind = ind_kti;
        type_select = 2;
    else
        ind = ind_sbti;
        type_select = 3;
    end

else
    % Not on convex hull, use purely topological
    ind = ind_kti;
    type_select = 1;
end

% Not use
if flag_k_clamp
    if length(ind) > k
        ind(k+1:end) = [];
    end
end
    
    function in = inside_convex_hull_angle(angle_to_neighbor)
        pos_s = [cos(angle_to_neighbor);sin(angle_to_neighbor)];
        num = size(pos_s,2);
        dim = size(pos_s,1);
        if num >dim
            ktemp = convhull(pos_s');
            points = pos_s(:,ktemp);
            in = inpolygon(0,0,points(1,:),points(2,:));
        else
            in = true;
        end
    end

    function case3 = kti_not_cover_sbti(angles_kti, angles_sbti)

        angle_kti_pro = wrapToPi(angles_kti - angles_kti(1))';
        angle_sbti_pro = wrapToPi(angles_sbti - angles_kti(1));

        case3 = sum(sum(angle_sbti_pro>angle_kti_pro,1)==length(angles_kti) |...
            sum(angle_sbti_pro<angle_kti_pro,1)==length(angles_kti)) > 0;
    end
end