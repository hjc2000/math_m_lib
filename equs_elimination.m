function ret=equs_elimination(equs,known_syms)
    % 获取所有符号变量
    all_syms=symvar(equs);
    % 移除已知变量，得到未知变量的集合
    unknown_syms=remove_syms(all_syms,known_syms);

    % 在循环里消元，不断消除未知变量
    while true
        %{
            获取以下两个集合的交集：
            1. 未知变量集合
            2. 方程组中第一个方程含有的符号变量
        %}
        intersection=find_syms_intersection(unknown_syms,equs(1));
        if(size(intersection,2)==0)
            break;
        end
    
        equs=replace_and_remove_first_equation(equs,intersection(1));
    end
    ret=simplify(equs);
end