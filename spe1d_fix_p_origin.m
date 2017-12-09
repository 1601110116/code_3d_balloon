global nz ny nx Ax ...
       wi   tei pei phi deni...
       ak2  aky Dx  vii phi2  both bc_left bc_right %petilde %pii c X3


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

tei=pei./deni;
nx0=nx-2;%fix
ny0=ny-2;
cr=zeros(nx0,ny0);%fix

%nx1=nx-1;cr=zeros(nx1,ny0);%free

for k=2:nz-1
   % cr(1:nx1,1:ny0)= -wi(1:nx1,2:ny0+1,k);%free-fix
     
   cr(1:nx0,1:ny0)= -wi(2:nx0+1,2:ny0+1,k);% fix-fix
   cr(1,1:ny0)= -wi(2,2:ny0+1,k)+bc_left; %p_left/dx^2;
   cr(nx0,1:ny0)= -wi(nx0+1,2:ny0+1,k)+bc_right; %p_right/dx^2;

	cr = fft(cr,[],2);

	for j=1:ny0
        
	    %A=Ax+ak2(j,k)*speye(nx1)+Dx*c*aky(j,k);%free-fix
	    A=Ax+ak2(j,k)*speye(nx0)+Dx*aky(j,k);%fix-fix
	    A=Ax+ak2(j,k)*speye(nx0);%+Dx*aky(j,k);  % 2d
        cr(:,j)=A\cr(:,j);
	end

	cr = ifft(cr,[],2);

	phi2(2:nx0+1,2:ny0+1,k)=real(cr(1:nx0,1:ny0));%fix-fix

    %phi2(1:nx1,2:ny0+1,k)=real(cr(1:nx1,1:ny0));%free-fix

end

phi=phi2-pei;


if (both<1)
	phi=sbcz(phi);		%close
else
	phi=sbcz2(phi);		%both
end

phi=sbcy(phi);
