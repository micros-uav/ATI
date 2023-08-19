function ind = neighbor_topological_balanced(dis_to_neighbor,posid_to_neighbor,mu)
if coder.target('MATLAB')
    ind = neighbor_topological_balanced_matlab(dis_to_neighbor,posid_to_neighbor,mu);
else
    ind = neighbor_topological_balanced_simulink(dis_to_neighbor,posid_to_neighbor,mu);
end

end