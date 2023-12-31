%{
    利用高斯消元法解方程
    
    参数：
        - equs: 方程组
        - known_syms：已知变量。在解方程的角度，像系统的输入变量、输出变量、已知的常数等都是已知变量。因为这些是不被消元的。
%}
function ret = solve_equs(equs, known_syms)
    % 获取所有符号变量
    all_syms = symvar(equs);
    % 移除已知变量，得到未知变量的集合
    unknown_syms = remove_syms(all_syms, known_syms);

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