function a=sbcz2(a)
	global nz ny nx  nx2

    
      a(2:nx2,:,1) =a(2:nx2,:,nz-1);
      a(2:nx2,:,nz)=a(2:nx2,:,2);
    
    %a(nx2+1:nx,1:ny,1) =a(nx2+1:nx,1:ny,2);
	%a(nx2+1:nx,1:ny,nz)=a(nx2+1:nx,1:ny,nz-1);
    
    
	a(nx2+1:nx-1,2:ny-1,1) =a(nx2+1:nx-1,2:ny-1,2);
	a(nx2+1:nx-1,2:ny-1,nz)=a(nx2+1:nx-1,2:ny-1,nz-1);
end
