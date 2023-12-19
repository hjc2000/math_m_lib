function updated_equs = replace_and_remove_first_equation(equs, var)
    % 解出 u1    
    ret=solve(equs(1),var);

    % 获取方程组的长度
    len = size(equs, 1);

    % 遍历方程组并进行替换
    for i = 1:len
        equs(i) = subs(equs(i), var, ret);
    end

    % 删除第一个方程
    equs(1) = [];

    % 返回更新后的方程组
    updated_equs = simplify(equs);
end
