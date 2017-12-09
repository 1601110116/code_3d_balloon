
alx=75;nx0=192;
aly=200;ny0=512;
nx=nx0+2;
ny=ny0+2;
dx=alx/(nx-1);
dx1p5=1./(2.*dx);
for i=1:nx 
   x(i)=dx*(i-1); 
end 
iz=2;

  st=280;
  nts=300;
for nt=st:nts
   load(['dat',sprintf('%4.4d',nt)])
   pe0save(:,nt)=mean(pei(:,:,iz),2);
   % gradp(:,nt)=dx1p5*(pe0(3:nx)-pe0(1:nx-2));
   % lp(:,nt)=-pe0(2:nx-1)./gradp(:,nt);
end
% time2=1./mean(lp(:,st:nts),2);
% time2=333*time2;
time2=mean(pe0save(:,st:nts),2);
figure;  
   set(gca,'FontSize',14);
   plot(x,time2,'b--','Linewidth',1)

fid=['Lp_L'];
save(fid,'x','time2')
hold on;
st=530;
nts=550;
for nt=st:nts
   load(['dat',sprintf('%4.4d',nt)])
   pe0save(:,nt)=mean(pei(:,:,iz),2);
   % gradp(:,nt)=dx1p5*(pe0(3:nx)-pe0(1:nx-2));
   % lp(:,nt)=-pe0(2:nx-1)./gradp(:,nt);
end
% time2=1./mean(lp(:,st:nts),2);
% time2=mean(lp(:,st:nts),2);
% time2=333*time2; 
time2=mean(pe0save(:,st:nts),2);
plot(x,time2,'r-','Linewidth',1)
fid=['Lp_H'];
save(fid,'x','time2')
   % xsep=40;
   % lx=[xsep,xsep];ly=[0.1,1.2];
   % plot(lx,ly,'k');
   % text(xsep+1,1,'LCFS','fontsize',10);
hold off; 
  % axis([2 40 -1*10^3 1*10^3]);
   xlabel('x/\rho_s');
   % ylabel('R/L_p');
   legend('First','Second');
   print(gcf,'-depsc','prof_Lp')












   
   
