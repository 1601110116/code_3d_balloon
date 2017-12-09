close all
iz=2;%2d
%iz=6;%balloon

dx=alx/(nx-1);
dy=aly/(ny-1);
xx=0:dx:alx;
yy=0:dy:aly;    


figure;plot(squeeze(wi(:,20,2)),'-o');
figure;plot(squeeze(phi(:,20,2)),'-o');

figure;plot(squeeze(phi2(:,20,2)),'-o')
print(gcf,'-dpng','aphi2') 

figure;plot(squeeze(phi(:,20,2)),'-o')
print(gcf,'-dpng','aphi') 
figure;plot(squeeze(pei(:,20,2)),'-o')
print(gcf,'-dpng','ape')
figure;plot(squeeze(wi(:,20,2)),'-o')
print(gcf,'-dpng','aw')
figure;plot(squeeze(deni(:,20,2)),'-o')
print(gcf,'-dpng','aden')
figure;plot(squeeze(vey(:,20,2)),'-o');
print(gcf,'-dpng','avey') 
close all

iz=2;
time=zeros(nts,1);
time2=time;
time3=time;
nx=nx0+2;
ny=ny0+2;
dx=alx/(nx-1);
dx1p5=1./(2.*dx);
vdy=zeros(nx0,ny0);
x=0;
for nt=1:nts
	if nt<14
      x=100*0.01+x;
      t(nt)=x;
    elseif nt<114
    	x=50*0.005+x;
    	t(nt)=x;
    else
    	x=80*0.005+x;
    	t(nt)=x;
    end
end
ixs=25;

for nt=1:nts 
    load(['dat',sprintf('%4.4d',nt)])
    
vy2=mean(vey(:,:,iz).^2,2);
vy2=sqrt(vy2);

time(nt)=mean(vy2(ixs:nx2));

vdy=dx1p5*(pei(3:nx,2:ny-1,iz)-pei(1:nx-2,2:ny-1,iz));


vdy2=sqrt(mean(vdy.^2,2));
time2(nt)=mean(vdy2(ixs:nx0));
end
%plot(time)
%hold 
plot(t,time2,'-r','Linewidth',1)

%plot(time3,'-m','Linewidth',1)
xlabel('t(R/c_s)');
legend('vdy');
%legend('vey','vdy','viy','Location','best');
print(gcf,'-dpng',sprintf('rms_uy')) 
%hold off
close all
%%
iz=2;
% nts=313;
time=zeros(nts,1);time2=time;

for nt=1:nts   
    load(['dat',sprintf('%4.4d',nt)])
    %uxuy=vex(:,:,iz).*vey(:,:,iz);uxuytime=mean(uxuy,2).*mean(wi(:,:,iz),2);
    %plot(squeeze(uxuytime),'-o');print(gcf,'-dpng',sprintf('uxuy%4.4d',nt)) 

%time(nt)=mean(uxuytime);

vxsave=pei(90:102,:,iz).*vex(90:102,:,iz);
%vxsave=pei(:,:,iz).*vex(:,:,iz);
%plot(squeeze(mean(vxsave,2)),'-o');print(gcf,'-dpng',sprintf('flux%4.4d',nt)) 

time2(nt)=mean(mean(vxsave,2),1);

end
%time=100*time;
%plot(time)
%hold on
plot(time2,'-r','Linewidth',1)
xlabel('t'); legend('F_p');
%hold off
print(gcf,'-dpng',sprintf('Fp')) 

close all
    
%%
ny=ny0+2;
% nts=413;
time=zeros(nts,1);
time2=time;
st=1;

for nt=st:nts
   load(['dat',sprintf('%4.4d',nt)])
   vy0=mean(vey(26:166,:,2),2);
   time(nt)=mean(vy0.^2);
   
   vy=vey(26:166,:,2)-repmat(vy0,[1,ny]);
   vperp=vy.^2+squeeze(vex(26:166,:,2).^2);
  time2(nt)=squeeze(mean(mean(vperp,2),1));
  
 
  
end
plot(time)
hold 
plot(time2,'-r','Linewidth',1)
xlabel('t'); legend('v0^2','v^2','Location','best');
print(gcf,'-dpng',sprintf('KE')) 
hold off
close all
%%
iz=2;
time=zeros(nts,1);
time2=time;
st=1;
for nt=st:nts
   load(['dat',sprintf('%4.4d',nt)])
   
edge=mean(pei(2:nx2,:,iz),2);
time(nt)=mean(edge);

sol=mean(pei(1+nx2:nx0+1,:,iz),2);
time2(nt)=mean(sol);
end
plot(time)
hold 
plot(time2,'-r','Linewidth',1)
xlabel('t'); legend('edge','sol','Location','best');
print(gcf,'-dpng',sprintf('psol')) 
hold off
close all
%%
%the confinement time
nt=20
nt=1
 load(['dat',sprintf('%4.4d',nt)])
iz=2;%2d
nxs=2*nx0*xw/alx;
nxs=round(nxs)
nx2
pro_pe=mean(pei(nxs:nx2,:,iz),2);
peAVG=sum(pro_pe)
SpAVG=sum(s(2:nx)/tau)
tau_cnfn=peAVG/SpAVG


