function df = full_diff(f)
    fsym = symvar(f);
    df = sym(0);
    for s = fsym
        df = df + diff(f,s) * sym(['d',char(s)]);
    end
    df=simplify(df);
end