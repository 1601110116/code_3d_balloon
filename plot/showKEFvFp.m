iz=2;
st=1;

alx=75;nx0=192;
aly=100;ny0=256;
arho = 100;
aR = 0.3;

nx=nx0+2;
ny=ny0+2;
dx=alx/(nx-1);
dx1p5=1./(2.*dx);

t = zeros(nts,1);
x=0;
for nt=st:nts
  if nt<201
      x=80*0.005+x;
    else
      x=100*0.002+x;
    end
    t(nt)=x;
end

F_v=zeros(nts,1);
F_p=zeros(nts,1);
U=zeros(nts,1);
K=zeros(nts,1);

for nt=st:nts   
    load(['dat',sprintf('%4.4d',nt)])

    uxuy = vex(26:166,:,iz) .* vey(26:166,:,iz);
    uxuytime = mean(uxuy,2) .* mean(wi(26:166,:,iz),2);
    F_v(nt) = arho * mean(uxuytime);

    vxsave = pei(26:166,:,iz) .* vex(26:166,:,iz); 
    F_p(nt) = 2 * aR * mean(mean(vxsave,2),1);

    vy0=mean(vey(26:166,:,2),2);
    U(nt)=mean(vy0.^2); 

    vy=vey(26:166,:,2)-repmat(vy0,[1,ny]);
    vperp=vy.^2+squeeze(vex(26:166,:,2).^2);
    K(nt)=squeeze(mean(mean(vperp,2),1));

end

fid=['F_v'];
save(fid,'t','F_v');
fid=['F_p'];
save(fid,'t','F_p')
fid=['U'];
save(fid,'t','U')
fid=['K'];
save(fid,'t','K')


span = 101;
F_v_ma = smooth(F_v, span);
F_p_ma = smooth(F_p, span);
U_ma = smooth(U, span);
K_ma = smooth(K, span);


figure;
height=0.4;
width=0.89;
left=0.06;
bottom=0.1;
ps1=[left,bottom,width,height];
ps2=[left,bottom+height+0.04,width,height];
% ps3=[left,bottom+2*height+0.08,width,height];

subplot('position',ps2)
set(gca,'FontSize',14);
plot(t,F_v,'b-','Linewidth',1)
hold on;
plot(t, F_v_ma, 'g-','Linewidth',1)


hold on;
plot(t,F_p,'r--','Linewidth',1)
hold on;
plot(t,F_p_ma,'y--','Linewidth',1)

a=findall(gcf,'type','axes');
set(a,'XTickLabel',[]);
% xsep=80;
% lx=[xsep,xsep];ly=[-0.01,0.01];
% plot(lx,ly,'k');
legend('F_v','F_{v_{ma}}','F_p','F_{p_{ma}}');
axis([0 max(t) -0.01 0.01]);
hold off
drawnow

subplot('position',ps1)
set(gca,'FontSize',14);
plot(t,U,'b-','Linewidth',1)
hold on
plot(t,U_ma,'g-','Linewidth',1)

hold on;
plot(t,K,'r--','Linewidth',1)
hold on;
plot(t,K_ma,'y--','Linewidth',1)

legend('U','U_{ma}','K','K_{ma}');
axis([0 max(t) 0 0.03]);
% xsep=80;
% lx=[xsep,xsep];ly=[0,0.03];
% plot(lx,ly,'k');
xlabel('t/t_0');
hold off
drawnow
print(gcf,'-depsc',sprintf('KEFvFp_full'))
print(gcf,'-dpng',sprintf('KEFvFp_full'))
