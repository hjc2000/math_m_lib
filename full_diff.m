% https://www.yuque.com/qiaodangyi/fg6g67/whgri148pei7k8du
%{
    求 f 的全微分。f 是一个函数，例如：f=y-sin(x+y)。
    原本含有符号变量 x,y，返回的 df 中会多出 dx,dy 这两个符号变量。
%}
function df = full_diff(f)
    % 取得 f 中的所有符号变量。
    fsym = symvar(f);

    % 将结果设为 0，然后在下面的循环中求 f 对各个变量的偏导数，累加到 df 上。
    df = sym(0);
    for s = fsym
        df = df + diff(f,s) * sym(['d',char(s)]);
    end

    % 结束。化简结果。
    df=simplify(df);
end