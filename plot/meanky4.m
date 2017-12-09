
close all
nts=70;

ny02=ny0/2;
pi2=2.*pi;
pi2y=pi2/aly; 
vky=zeros(ny0,1);
for j=1:ny02+1
 vky(j)=pi2y*(j-1);
end 
for j=ny02+2:ny0
 jj=j-ny0;
 vky(j)=pi2y*(jj-1);
end 
%%
cr=zeros(ny0,1);
cr2=zeros(ny0,1);
cr3=zeros(ny0,1);

phik=zeros(ny0,nts);
pek=zeros(ny0,nts);
denk=zeros(ny0,nts);
for nt=1:nts
    load(['dat',sprintf('%4.4d',nt)])
    nx_i=102;
    %i=30;
    phi_tilde = sp0(phi);
%     pei_tilde = sp0(pei);
    cr(:)=ifft(phi_tilde(nx_i,2:ny0+1,2)); 
%     cr2(:)=ifft(pei_tilde(nx_i,2:ny0+1,2));
%     cr3(:)=ifft(deni(nx_i,2:ny0+1,2));

    phik(:,nt)=abs(cr(:));
%     pek(:,nt)=abs(cr2(:));
%     denk(:,nt)=abs(cr3(:));
end
%%


figure
set(gca,'FontSize',14);
mphik=mean(phik,2);
a(1)=mphik(1);
a(2:ny0/2)=2*mphik(2:ny0/2);
semilogy(vky(1:ny0/2),a,'-b','Linewidth',1)
%loglog(vky(1:ny0/2),a,'-b','Linewidth',1)
axis([0 1 10^-5 10]);
set(gca,'XTick',0:0.1:1);
xlabel('k_y \rho_s'); legend('\phi');
% hold
% 
% mphik=mean(pek,2);
% a(1)=mphik(1);
% a(2:ny0/2)=2*mphik(2:ny0/2);
% axis([0 1 10^-5 10])
% set(gca,'XTick',0:0.1:1);
% semilogy(vky(1:ny0/2),a(1:ny0/2),'-r','Linewidth',1)
% %loglog(vky(1:ny0/2),a(1:ny0/2),'-r','Linewidth',1)
% hold off
% vky=squeeze(vky);
% a=squeeze(a);
% xlabel('k_y \rho_s'); legend('\phi','p');

% print(gcf,'-dpng',[sprintf('%4.4d',i),'newnewdenk2'])
%%
% pause

figure;plot(phik(2,:),'-o')
hold
 plot(phik(4,:),'r-+')
 plot(phik(3,:),'g-')
xlabel('t'); legend('k=1','k=3','k=2');
hold off

% print(gcf,'-dpng',['kt','.png'])

% pause

figure;semilogy(phik(2,:),'-o')
hold
 semilogy(phik(1,:),'g-')
 semilogy(phik(4,:),'r-+')
 semilogy(phik(3,:),'m-')
xlabel('t'); legend('k=1','k=0','k=3','k=2');
hold off

% print(gcf,'-dpng',['ktlog','.png'])

