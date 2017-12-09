global A3

A4=kron(ak2(1:ny0,2:nz-1),eye(nx0))+kron(ones(ny0,nz-2),Ax)+kron(aky(1:ny0,2:nz-1),Dx);

A4=sparse(A4);
A3=cell(nz-2,1);
[A3{:}]=deal(sparse(nx0*ny0,nx0*ny0));

for k=1:nz-2
  for i=1:ny0
  v1=sparse(i,i,1,ny0,ny0);
  E=kron(v1,eye(nx0));
  u=kron([zeros(1,i-1),1,zeros(1,ny0-i)],eye(nx0));
  u=sparse(u);
  incr=E*A4(:,(k-1)*nx0+1:k*nx0)*u;
  incr=sparse(incr);
  A3{k}=A3{k}+incr;
  end
end

save('A3.mat','A3');
clear A4;