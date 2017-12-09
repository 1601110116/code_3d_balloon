function h=curv(g)
	global nx ny nz  cxk cyk dyt1p balloon %ns nxb  dxt1p
	h=zeros(nx,ny,nz);
%for k=2:nz-1
        
%	h(2:nx-1,2:ny-1,k)=(g(2:nx-1,3:ny,k)-g(2:nx-1,1:ny-2,k)).*cy(k)...
%	                +(g(3:nx,2:ny-1,k)-g(1:nx-2,2:ny-1,k)).*cx(k);

%h(2:nx-1,2:ny-1,k)=(g(2:nx-1,3:ny,k)-g(2:nx-1,1:ny-2,k)).*cy(k)*dyt1p...
	 %               +(g(3:nx,2:ny-1,k)-g(1:nx-2,2:ny-1,k)).*cx(k)*dxt1p;
     
     %ns=15; 
     %h(ns:nxb,2:ny-1,k)=(g(ns:nxb,3:ny,k)-g(ns:nxb,1:ny-2,k)).*cy(k)*dyt1p...
	  %              +(g(ns+1:nxb+1,2:ny-1,k)-g(ns-1:nxb-1,2:ny-1,k)).*cx(k)*dxt1p;
%end
if (balloon<1) %interchange,2d
    h(2:nx-1,2:ny-1,2:nz-1)=(g(2:nx-1,3:ny,2:nz-1)-g(2:nx-1,1:ny-2,2:nz-1))*dyt1p;
	
else
h(2:nx-1,2:ny-1,2:nz-1)=(g(2:nx-1,3:ny,2:nz-1)-g(2:nx-1,1:ny-2,2:nz-1)).*cyk(2:nx-1,2:ny-1,2:nz-1)...
	                +(g(3:nx,2:ny-1,2:nz-1)-g(1:nx-2,2:ny-1,2:nz-1)).*cxk(2:nx-1,2:ny-1,2:nz-1);
end
	