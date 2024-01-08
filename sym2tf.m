function ret=sym2tf(sym_equ)
	[num,den]=numden(sym_equ);
	num=sym2poly(num);
	den=sym2poly(den);
	ret=tf(num,den);
end