%{
    函数名: find_syms_intersection
    功能: 找到两个包含符号变量的数组的交集。
    参数:
        - array1: 第一个符号变量数组，可以包含符号变量、方程或方程组。
        - array2: 第二个符号变量数组，同样可以包含符号变量、方程或方程组。
    返回值:
        - common_syms_array: 一个包含两个输入数组共有符号变量的数组。

    该函数首先使用 symvar 函数从每个输入数组中提取符号变量。
    然后，使用 intersect 函数找到这些符号变量的交集。
    最后，将交集的符号变量转换回数组形式并返回。

    使用示例:
        syms a b c d e
        array1 = [a, b, c]; % 第一个符号变量数组
        array2 = [b, c, d, e]; % 第二个符号变量数组
        result = find_syms_intersection(array1, array2); 
        % result 将包含 [b, c]
%}
function common_syms_array = find_syms_intersection(array1, array2)
    % 提取第一个数组中的符号变量
    syms1 = symvar(array1);

    % 提取第二个数组中的符号变量
    syms2 = symvar(array2);

    % 找到两个数组的交集
    common_syms = intersect(syms1, syms2);

    % 将交集转换回符号变量数组
    common_syms_array = sym(common_syms);
end
