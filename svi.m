function svi(f,fi)
    global   vi vii  dpdz pei pii

    ptot=pei+pii;
    tpe=sbdel(ptot);
    
    fxy=convect(vii);
    dif2t=dif3(vi);

    fxy=fxy+tpe-dif2t;

    work=vi*f+vii*fi-fxy;
    
    if(f<0.6)
        vi=vii;
        vii=work;
    else
        vii=work;
    end
end
