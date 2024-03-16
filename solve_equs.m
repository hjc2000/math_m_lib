%{
    利用高斯消元法解方程组
    
    参数：
        - equs 方程组
        - unknown_syms 未知变量的集合，要被消元消掉的。
%}
function ret = solve_equs(equs, unknown_syms)
	% 在循环里消元，不断消除未知变量
	index = 1;
	while true
		if(index > length(equs))
			break;
		end
		
		intersection = find_syms_intersection(unknown_syms, equs(index));
		if(isempty(intersection))
			% 如果此方程没有未知变量，前往下一个方程
			index = index + 1;
			continue;
		end
		
		% 对 intersection 中的第一个变量进行消元
		equs = solve_and_remove_equation(equs, index, intersection(1));
	end
	
	ret = simplify(equs);
end