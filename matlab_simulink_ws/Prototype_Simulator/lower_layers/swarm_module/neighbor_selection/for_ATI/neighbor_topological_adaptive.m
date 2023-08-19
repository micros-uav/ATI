function [ind,type_select,ind_pti,ind_sbti] = neighbor_topological_adaptive(dis_to_neighbor,posid_to_neighbor,k,mu,flag_k_clamp)

ind_pti = neighbor_topological_pure(dis_to_neighbor,k);
case2 = ~inside_convex_hull(posid_to_neighbor(:,ind_pti));
% if (k <4 || size(posid_to_neighbor,2) < 4) && size(posid_to_neighbor,1) == 3
%     % Three-dimension case
%     case2 = false;
% elseif (k <3  || size(posid_to_neighbor,2) < 3) && size(posid_to_neighbor,1) == 2
%     % Two-dimension case
%     case2 = false;
% else
%     case2 = ~inside_convex_hull(posid_to_neighbor(:,ind_pti));
% end

if case2
    ind_sbti = neighbor_topological_balanced(dis_to_neighbor,posid_to_neighbor,mu);
    
    %=========================================================
    case3 = inside_convex_hull(posid_to_neighbor(:,ind_sbti));

    if ~case3
        ind = ind_pti;
        type_select = 2;
    else
        ind = ind_sbti;
        type_select = 3;
    end
else
    % Not on convex hull, use purely topological
    ind = ind_pti;
    type_select = 1;
end

if flag_k_clamp
    if length(ind) > k
        ind(k+1:end) = [];
    end
end

    function in = inside_convex_hull(posid_to_neighbor)
        num = size(posid_to_neighbor,2);
        dim = size(posid_to_neighbor,1);
        if num >dim
            ktemp = convhull(posid_to_neighbor');
            points = posid_to_neighbor(:,ktemp);
            in = inpolygon(0,0,points(1,:),points(2,:));
        else
            in = false;
        end
    end

end