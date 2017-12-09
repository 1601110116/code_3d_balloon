function spe(f,fi)
    global pe pei cphi jpara source bdelvi vii%deni nve

    % with density evolution
    % ve=nve./deni;
    % bdelvz=sbdel(ve);
    % para=pei.*bdelvz;

    % no density evolution
    bdelvi = sbdel(vii);
    para = pei.* (bdelvi - jpara);

    fxy=convect(pei);
    % fxy=convect2(pei);%flux
    dif2t=dif3(pe);
    
    fxy = fxy + (para + pei .* cphi) * (0.6667+1) - source - dif2t;
    work=pe*f+pei*fi-fxy;

    if(f<0.6)
        pe=pei;
        pei=work;
    else
        pei=work;
    end
end
