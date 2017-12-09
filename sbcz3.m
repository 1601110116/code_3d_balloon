function a=sbcz3(a)
	global nz nx2 %ny nx phase c 
    
      a(2:nx2,:,1) =a(2:nx2,:,nz-1);
      a(2:nx2,:,nz)=a(2:nx2,:,2);
    
    
end
