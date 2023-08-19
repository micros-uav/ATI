function xy_range = get_map_range(flag_prac, flag_xy)
%GET_MAP_RANGE 
% First input:
% flag_prac=0: simulated experiments
% flag_prac=1: real-world experiments
% Sencond input:
% flag_xy=0: output the range of x axis in map
% flag_xy=1: output the range of y axis in map

if ~flag_prac
    % For simulated experiments
    x_range = [-6.0;6.0];
    y_range = [-9.0;100.0];
else
    % For real-world experiments
    x_range = [-3;3];
    y_range = [-8.2;12.0];
end

if ~flag_xy
    xy_range = x_range;
else
    xy_range = y_range;
end

end

