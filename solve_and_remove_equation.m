%{
    工作流程：
        1. 在方程组 equs 中，指定 index 索引位置的方程，将此方程变成 var == fun 的形式，即将 var 提取到等号左边，
           fun 中不含 var。
        2. 从 equs 中删除 index 位置的方程。
        3. 将 var == fun 带入到 equs 的所有方程中，进行消元。
%}
function updated_equs = solve_and_remove_equation(equs, index, var)
    % 解出指定的方程，然后移除
    solve_equ_result=solve(equs(index), var);
    equs(index)=[];

    % 遍历方程组并进行替换
    for i = 1:length(equs)
        equs(i) = subs(equs(i), var, solve_equ_result);
    end

    % 返回更新后的方程组
    updated_equs = simplify(equs);
end
