%{
    函数名: sym2tf
    功能: 将符号变量的分式表示的传递函数转化为 tf 模型表示的传递函数。
    参数:
        - sym_exp: 符号变量的分式。
    返回值:
        - ret: tf 模型。
%}
function ret=sym2tf(sym_exp)
	[num,den]=numden(sym_exp);
	num=sym2poly(num);
	den=sym2poly(den);
	ret=tf(num,den);
end