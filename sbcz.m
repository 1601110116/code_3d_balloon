
function a=sbcz(a)
global nz %ny nx

     % for j=1:ny
      %for i=1:nx
      %a(i,j,1) =a(i,j,nz-1);a(i,j,nz)=a(i,j,2);
      %end
      %end

      a(:,:,1) =a(:,:,nz-1);
      a(:,:,nz)=a(:,:,2);