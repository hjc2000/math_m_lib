function updated_equs = solve_and_remove_equation(equs,index, var)
    % 解出指定的方程，然后移除
    solve_equ_result=solve(equs(index),var);
    equs(index)=[];

    % 获取方程组的长度
    len = size(equs, 1);

    % 遍历方程组并进行替换
    for i = 1:len
        equs(i) = subs(equs(i), var, solve_equ_result);
    end

    % 返回更新后的方程组
    updated_equs = simplify(equs);
end
