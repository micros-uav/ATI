function output = get_model_s_p(flag_prac, flag_model, flag_s_p)
%GET_MODEL_S_P
% First input:
% flag_prac=0: simulated experiments
% flag_prac=1: real-world experiments
% Second input:
% flag_model=0: retangular obstacles
% flag_model=1: cylindrical obstacles
% Third input:
% flag_s_p=0: scale
% flag_s_p=1: position

if ~flag_prac
    % For simulated experiments
    if ~flag_model
        % retangular obstacles
        scale = [8;5;2];
        position = [[2;25;1],[-2;35;1]];
    else
        % cylindrical obstacles
        scale = [0.4;0.4;2];
        position = [-11.4000000000000	-10.2000000000000	-9.00000000000000	-7.80000000000000	-6.60000000000000	-5.40000000000000	-4.20000000000000	-3.00000000000000	-1.80000000000000	-0.600000000000000	0.600000000000001	1.80000000000000	3	4.20000000000000	5.40000000000000	6.60000000000000	7.80000000000000	9	10.2000000000000	11.4000000000000	-10.8000000000000	-9.60000000000000	-8.40000000000000	-7.20000000000000	-6.00000000000000	-4.80000000000000	-3.60000000000000	-2.40000000000000	-1.20000000000000	0	1.20000000000000	2.40000000000000	3.60000000000000	4.80000000000000	6.00000000000000	7.20000000000000	8.40000000000000	9.60000000000000	10.8000000000000	-11.4000000000000	-10.2000000000000	-9.00000000000000	-7.80000000000000	-6.60000000000000	-5.40000000000000	-4.20000000000000	-3.00000000000000	-1.80000000000000	-0.600000000000000	0.600000000000001	1.80000000000000	3	4.20000000000000	5.40000000000000	6.60000000000000	7.80000000000000	9	10.2000000000000	11.4000000000000	-10.8000000000000	-9.60000000000000	-8.40000000000000	-7.20000000000000	-6.00000000000000	-4.80000000000000	-3.60000000000000	-2.40000000000000	-1.20000000000000	0	1.20000000000000	2.40000000000000	3.60000000000000	4.80000000000000	6.00000000000000	7.20000000000000	8.40000000000000	9.60000000000000	10.8000000000000	-11.4000000000000	-10.2000000000000	-9.00000000000000	-7.80000000000000	-6.60000000000000	-5.40000000000000	-4.20000000000000	-3.00000000000000	-1.80000000000000	-0.600000000000000	0.600000000000001	1.80000000000000	3	4.20000000000000	5.40000000000000	6.60000000000000	7.80000000000000	9	10.2000000000000	11.4000000000000	-10.8000000000000	-9.60000000000000	-8.40000000000000	-7.20000000000000	-6.00000000000000	-4.80000000000000	-3.60000000000000	-2.40000000000000	-1.20000000000000	0	1.20000000000000	2.40000000000000	3.60000000000000	4.80000000000000	6.00000000000000	7.20000000000000	8.40000000000000	9.60000000000000	10.8000000000000	-11.4000000000000	-10.2000000000000	-9.00000000000000	-7.80000000000000	-6.60000000000000	-5.40000000000000	-4.20000000000000	-3.00000000000000	-1.80000000000000	-0.600000000000000	0.600000000000001	1.80000000000000	3	4.20000000000000	5.40000000000000	6.60000000000000	7.80000000000000	9	10.2000000000000	11.4000000000000
            51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	51.4000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	52.6000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	53.8000000000000	55	55	55	55	55	55	55	55	55	55	55	55	55	55	55	55	55	55	55	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	56.2000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	57.4000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000	58.6000000000000];
        position = [position;position(1,:)*0+1];
    end
else
    % For real-world experiments
    if ~flag_model
        % retangular obstacles
        scale = [4;1.2;2];
        position = [[1;0.2125;1],[-1;4.2125;1]];
    else
        % cylindrical obstacles
        scale = [0.4;0.4;2];
        position = [-2.7, -1.8, -0.9, 0, 0.9, 1.8, 2.7, -2.25, -1.35, -0.45, 0.45, 1.35, 2.25, -2.25, -1.35, -0.45, 0.45, 1.35, 2.25
            0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0];
        position = [position;position(1,:)*0+1];
        position(2,:) = position(2,:)+7.8;
    end
end

if ~flag_s_p
    output = scale;
else
    output = position;
end

end

