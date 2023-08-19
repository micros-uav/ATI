function ind = neighbor_topological_balanced(dis_to_neighbor,posid_to_neighbor,mu)
    [~,ind_sort] = sort(dis_to_neighbor);
    ind_1 = zeros(1,length(dis_to_neighbor));
    posid_to_neighbor = posid_to_neighbor(:,ind_sort);
    m = 0;
    no_ignored = true(size(ind_sort));
%     ind_all = 1:length(ind_sort);
    while true
            m = m+1;
            inds = find(no_ignored);
            indd = inds(1);
            no_ignored(indd) = false;
            ind_min = ind_sort(indd);
            ind_1(m) = ind_min;
            %ind_sort(1) = []; %exclude itself and theta<mu will get it
            posij_min = posid_to_neighbor(:,indd);
            posij_min = posij_min/norm(posij_min);
%             inds = find(no_ignored);
            pos_temp = posid_to_neighbor(:,inds);
            temp = sum(pos_temp.*repmat(posij_min,1,size(pos_temp,2)),1)./...
                sqrt(sum(pos_temp.^2,1));
%             temp(1) = 0.99999;
            temp(temp>1) = 1;
            temp(temp<-1) = -1;
            theta = acos(temp);
            ignores = theta<mu;
            if prod(ignores) == 1
                break
            else
%                 ind_sort(ignores) = [];
%                 posid_to_neighbor(:,ignores) = [];
                no_ignored(inds(ignores)) = false;
            end
    end
    ind = ind_1(1:m);
end