function ind = neighbor_topological_pure(dis_to_neighbor,k)
    [~,ind]  = mink(dis_to_neighbor,k);
end