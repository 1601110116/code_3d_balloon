figure
set(gca,'FontSize',14);
mphik = mean(phik_1,2);
a(1)=mphik(1);
a(2:ny0/2)=2*mphik(2:ny0/2);
% semilogy(vky(1:ny0/2),a,'-b','Linewidth',1)
plot(vky(1:ny0/2),a,'-b','Linewidth',1)

hold on;
mphik = mean(phik_2,2);
a(1)=mphik(1);
a(2:ny0/2)=2*mphik(2:ny0/2);
% semilogy(vky(1:ny0/2),a,'-r','Linewidth',1)
plot(vky(1:ny0/2),a,'-r','Linewidth',1)

hold on;
mphik = mean(phik_3,2);
a(1)=mphik(1);
a(2:ny0/2)=2*mphik(2:ny0/2);
% semilogy(vky(1:ny0/2),a,'-g','Linewidth',1)
plot(vky(1:ny0/2),a,'-g','Linewidth',1)

axis([0 1 0 0.1]);
set(gca,'XTick',0:0.1:1);
xlabel('k_y \rho_s'); legend('\phi (\alpha = 0.001)', '\phi (\alpha = 0.1)', '\phi (\alpha = 10)');