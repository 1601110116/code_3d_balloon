function spi(f,fi)
    global api  pii  cphi jpara vii source bdelvi

    para = pii .* bdelvi;
    
    fxy = convect(pii);
    % fxy=convect2(pii);%flux
    dif2t = dif3(api);
    
    fxy = fxy + (para + pii .* cphi) * (0.6667+1) - source - dif2t;
    work=api*f+pii*fi-fxy;

    if(f<0.6)
        api=pii;
        pii=work;
    else
        pii=work;
    end
end
