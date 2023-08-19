function positions_0 = get_initial_positions(flag_prac,number,y_range)
%GET_INITIAL_STATES 
% flag_prac=0: simulated experiments
% flag_prac=1: real-world experiments

if ~flag_prac && number < 17
    % For simulated experiments
    positions_0 = [-1.2,-0.4,0.4,1.2,-1.2,-0.4,0.4,1.2,-1.2,-0.4,0.4,1.2,-1.2,-0.4,0.4,1.2
        -5.45,-5.45,-5.45,-5.45,-6.25,-6.25,-6.25,-6.25,-7.05,-7.05,-7.05,-7.05,-7.85,-7.85,-7.85,-7.85
        0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6];
    positions_0 = positions_0(:,1:number);
else
    % For real-world experiments
    r_rep0 =  0.8376;
    delta_r = r_rep0;
    NSqrt = ceil(sqrt(number));
    positions_0 = [(mod(0:number-1,NSqrt) - mod(number-1,NSqrt)/2)*delta_r;
            (floor((0:number-1)/NSqrt))*delta_r + y_range(1) + delta_r;
            zeros(1,number)];
end

end

