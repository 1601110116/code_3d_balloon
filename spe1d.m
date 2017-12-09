global nz ny nx Ax ...
       wi   tei pei phi deni balloon...
       ak2  aky Dx  vii phi2  both A3...
        bc_left bc_right p_right p_right_fix...
        z_periodic%petilde %pii c X3

if (both<1)
    if (balloon == 1 && z_periodic == 0)
        wi=sbcz_phase(wi);
        pei=sbcz_phase(pei);
        pii=sbcz_phase(pii);
        vii=sbcz_phase(vii);
        deni=sbcz_phase(deni);
    else
        wi=sbcz(wi);
        pei=sbcz(pei);
        pii=sbcz(pii);
        vii=sbcz(vii);
        deni=sbcz(deni);
    end
else
    if (balloon == 1 && z_periodic == 0)
        wi=sbcz2_phase(wi);
        pei=sbcz2_phase(pei);
        pii=sbcz2_phase(pii);
        vii=sbcz3_phase(vii);
        deni=sbcz2_phase(deni);
    else
        wi=sbcz2(wi);
        pei=sbcz2(pei);
        pii=sbcz2(pii);
        vii=sbcz3(vii);
        deni=sbcz2(deni);
    end
end

wi=sbcy(wi);
pei=sbcy(pei);
pii=sbcy(pii);
vii=sbcy(vii);
deni=sbcy(deni);

if p_right_fix == 0
  % free right boundary of p
  pei=sbcxnn4(pei);
  pii=sbcxnn4(pii);
else
  % fix right boundary of p
  pei=sbcxnn2(pei);
  pii=sbcxnn2(pii);
end

deni=sbcxnn3(deni);
vii=sbcxnn(vii);%free-free

phi2 = phi + pii;

tei=pei./deni;

cr=zeros(nx0,ny0);%free

for k=2:nz-1
   cr(1:nx0,1:ny0)= -wi(1:nx0,2:ny0+1,k);
   cr(1,1:ny0)= -wi(2,2:ny0+1,k)+bc_left; %p_left/dx^2;
   if p_right_fix == 0
      % free right boundary of p
      cr(nx0,1:ny0)= -wi(nx0+1,2:ny0+1,k)+pii(nx0+1,2:ny0+1,k)/dx^2;
    else
      % fix right boundary of p
      cr(nx0,1:ny0)= -wi(nx0+1,2:ny0+1,k)+bc_right; %p_right/dx^2;
    end
   

    cr = fft(cr,[],2);

    cr=reshape(cr,[nx0*ny0,1]);
    cr=A3{k-1}\cr;
    cr=reshape(cr,[nx0,ny0]);

    cr = ifft(cr,[],2);

    phi2(2:nx0+1,2:ny0+1,k)=real(cr(1:nx0,1:ny0));

end

phi=phi2-pii;


if (both<1)
    if (balloon == 1 && z_periodic == 0)
      phi = sbcz_phase(phi);
    else
      phi=sbcz(phi);      %close
    end
else
    if (balloon == 1 && z_periodic == 0)
      phi = sbcz2_phase(phi);
    else
      phi=sbcz2(phi);     %both
    end
end

phi=sbcy(phi);
