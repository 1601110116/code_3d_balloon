function sbcz_open
	global nz ny nx deni tei  phi jz vii nx2 vb

	cs=zeros(nx,ny,nz);
    
	cs(nx2+1:nx-1,2:ny-1,1)=-sqrt(tei(nx2+1:nx-1,2:ny-1,1));
	vii(nx2+1:nx-1,2:ny-1,1) =2*cs(nx2+1:nx-1,2:ny-1,1)-vii(nx2+1:nx-1,2:ny-1,2);

	vbphi(nx2+1:nx-1,2:ny-1,1) =(3+phi(nx2+1:nx-1,2:ny-1,1)-vb(nx2+1:nx-1,2:ny-1,1))./tei(nx2+1:nx-1,2:ny-1,1);%bias
    
	j2=zeros(nx,ny,nz);
	j2(nx2+1:nx-1,2:ny-1,1)=deni(nx2+1:nx-1,2:ny-1,1).*cs(nx2+1:nx-1,2:ny-1,1).*(1.-exp(3-vbphi(nx2+1:nx-1,2:ny-1,1)));
	jz(nx2+1:nx-1,2:ny-1,1) =2*j2(nx2+1:nx-1,2:ny-1,1)-jz(nx2+1:nx-1,2:ny-1,2);

    %%
	cs(nx2+1:nx-1,2:ny-1,nz)=sqrt(tei(nx2+1:nx-1,2:ny-1,nz));
	vii(nx2+1:nx-1,2:ny-1,nz) =2*cs(nx2+1:nx-1,2:ny-1,nz)-vii(nx2+1:nx-1,2:ny-1,nz-1);

    vbphi(nx2+1:nx-1,2:ny-1,nz)=(3+phi(nx2+1:nx-1,2:ny-1,nz)-vb(nx2+1:nx-1,2:ny-1,nz))./tei(nx2+1:nx-1,2:ny-1,nz);%bias
  
	j2(nx2+1:nx-1,2:ny-1,nz)=deni(nx2+1:nx-1,2:ny-1,nz).*cs(nx2+1:nx-1,2:ny-1,nz).*(1.-exp(3-vbphi(nx2+1:nx-1,2:ny-1,nz)));
	jz(nx2+1:nx-1,2:ny-1,nz)=2*j2(nx2+1:nx-1,2:ny-1,nz)-jz(nx2+1:nx-1,2:ny-1,nz-1);
end
