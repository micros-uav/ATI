function values = evaluation_module_average(time_series, values_series, evaluation_metric_type)
%EVALUATION_MODEL_AVERAGE 
% Automatically generated by read_parameter_xml.m
% Every time read_parameter_xml.m is run, this function will be generated
switch evaluation_metric_type
	case 'evaluation_0'
		values = evaluation_0_module_average(time_series, values_series);
	case 'eva_ati'
		values = eva_ati_module_average(time_series, values_series);
	case 'user_evaluation'
		values = user_evaluation_module_average(time_series, values_series);
	otherwise
		values = [];
end

end