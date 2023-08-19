function ind = neighbor_k_angles(dis_to_neighbor,posid_to_neighbor,k)
    mu = pi/k;    
    [~,ind_sort] = sort(dis_to_neighbor);
    dis_to_neighbor = dis_to_neighbor(ind_sort);
    posid_to_neighbor = posid_to_neighbor(:, ind_sort);

    [~, ind_min] = min(dis_to_neighbor);
    yaw_s = atan2(-posid_to_neighbor(2,:),-posid_to_neighbor(1,:));
    yaw_min = yaw_s(ind_min);
    
    yaw_s_shift = wrapToPi(yaw_s - yaw_min - mu);
    yaw_s_shift_int = floor(yaw_s_shift/(mu*2));
    [~,ind_ind_selected] = unique(yaw_s_shift_int);
    ind = ind_sort(ind_ind_selected);
end