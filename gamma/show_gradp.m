
alx=75;nx0=192;
aly=100;ny0=256;
nx=nx0+2;
ny=ny0+2;
dx=alx/(nx-1);
dx1p5=1./(2.*dx);
for i=1:nx 
   x(i)=dx*(i-1); 
end 
iz=2;

  st=80;
  nts=100;
for nt=st:nts
   load(['dat',sprintf('%4.4d',nt)])
   gradp(:,:,nt)=dx1p5*(pei(3:nx,2:ny-1,iz)-pei(1:nx-2,2:ny-1,iz));
end
time2=mean(mean(gradp(:,:,st:nts),2),3);
figure;  
   set(gca,'FontSize',14);
   plot(x(2:nx-1),time2,'b--','Linewidth',1)

fid=['gradp_Linear'];
save(fid,'x','time2')
   axis([20 60 -0.1 0.05]);
   xlabel('x/\rho_s');
   ylabel('gradp');
   print(gcf,'-dpng','prof_grad_p')












   
   
