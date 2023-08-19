function ind = neighbor_topological_balanced(dis_to_neighbor,posid_to_neighbor,mu)
    [~,ind_sort] = sort(dis_to_neighbor);
    ind_1 = zeros(1,length(dis_to_neighbor));
    posid_to_neighbor = posid_to_neighbor(:,ind_sort);

    m = 0;
    while true
            m = m+1;
            ind_min = ind_sort(1);
            ind_1(m) = ind_min;
            %ind_sort(1) = []; %exclude itself and theta<mu will get it
            posij_min = posid_to_neighbor(:,1);
            posij_min = posij_min/norm(posij_min);
            temp = sum(posid_to_neighbor.*repmat(posij_min,1,size(posid_to_neighbor,2)),1)./...
                sqrt(sum(posid_to_neighbor.^2,1));
%             temp(1) = 0.99999;
            temp(temp>1) = 1;
            temp(temp<-1) = -1;
            theta = acos(temp);
            ignores = theta<mu;
            if prod(ignores) == 1
                break
            else
                ind_sort(ignores) = [];
                posid_to_neighbor(:,ignores) = [];
            end
    end
    ind = ind_1(1:m);
end