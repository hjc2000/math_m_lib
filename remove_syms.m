%{
    函数名: remove_syms
    功能: 从一个符号变量数组中移除指定的符号变量。
    参数:
        - original_syms: 一个包含符号变量的数组。
        - syms_to_remove: 一个包含要从 original_syms 中移除的符号变量的数组。
    返回值:
        - result: 一个数组，包含移除了指定符号变量后的原始数组。

    使用示例:
        syms a b c d e
        original_syms = [a, b, c, d, e];
        syms_to_remove = [b, d];
        remaining_syms = remove_syms(original_syms, syms_to_remove);
        % remaining_syms 现在是 [a, c, e]
%}
function result = remove_syms(original_syms, syms_to_remove)
    % 将原始符号变量数组转换为集合
    original_set = symvar(original_syms);

    % 将要移除的符号变量转换为集合
    remove_set = symvar(syms_to_remove);

    % 计算差集，即移除指定的符号变量
    result_set = setdiff(original_set, remove_set);

    % 将结果集合转换回符号变量数组
    result = sym(result_set);
end
