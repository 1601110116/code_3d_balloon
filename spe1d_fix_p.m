global nz ny nx Ax ...
       wi   tei pei phi deni...
       ak2  aky Dx  vii phi2  both A3 bc_left bc_right p_right%petilde %pii c X3

if (both<1)
    wi=sbcz(wi);
    pei=sbcz(pei);
    pii=sbcz(pii);
    vii=sbcz(vii);
    deni=sbcz(deni);
else
    wi=sbcz2(wi);
    pei=sbcz2(pei);
    pii=sbcz2(pii);
    vii=sbcz3(vii);
    deni=sbcz2(deni);
end

wi=sbcy(wi);
pei=sbcy(pei);
pii=sbcy(pii);
vii=sbcy(vii);
deni=sbcy(deni);

pei=sbcxnn2(pei);%pi=0, free-fix
pii=sbcxnn2(pii);
deni=sbcxnn3(deni);
vii=sbcxnn(vii);%free-free

phi2 = phi + pii;

tei=pei./deni;
nx0=nx-2;%fix
ny0=ny-2;
cr=zeros(nx0,ny0);%fix

for k=2:nz-1
   cr(1:nx0,1:ny0)= -wi(2:nx0+1,2:ny0+1,k);% fix-fix
   cr(1,1:ny0)= -wi(2,2:ny0+1,k)+bc_left; %p_left/dx^2;
   cr(nx0,1:ny0)= -wi(nx0+1,2:ny0+1,k)+bc_right; %p_right/dx^2;

    cr = fft(cr,[],2);

    cr=reshape(cr,[nx0*ny0,1]);
    cr=A3{k-1}\cr;
    cr=reshape(cr,[nx0,ny0]);

    cr = ifft(cr,[],2);

    phi2(2:nx0+1,2:ny0+1,k)=real(cr(1:nx0,1:ny0));%fix-fix

end

phi=phi2-pii;


if (both<1)
    phi=sbcz(phi);      %close
else
    phi=sbcz2(phi);     %both
end

phi=sbcy(phi);

% % p_left = mean(mean(pii(2,:,:),2),3);
% p_right = mean(mean(mean(pii(nx-5:nx-1,:,:),2),3),1);

% % bc_left = p_left/dx^2;
% bc_right = p_right/dx^2;
