function informed = get_identity_informed(number,flag_prac,p_informed)
%GET_IDENTITY_INFORMED 
% flag_prac=0: simulated experiments
% flag_prac=1: real-world experiments

informed = zeros(number,1);
if ~flag_prac
    % For simulated experiments
    informed(randperm(number,ceil(number*p_informed))) = 1;
else
    % For real-world experiments
    ind = [7,10,13];
    ind(ind>number) = [];
    informed(ind) = 1;
end

end

