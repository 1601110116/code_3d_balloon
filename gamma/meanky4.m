close all

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
st=200;
nts=230;
     cr=zeros(ny0,1);
phik=zeros(ny0,nts-st+1);

for nt=st:nts
load(['dat',sprintf('%4.4d',nt)])
%densave(:,:,nt)=deni(:,:,2);

i=77;

cr(:)=ifft(phi(i,2:ny0+1,2)); 

phik(:,nt)=abs(cr(:));

end
figure; 
set(gca,'FontSize',14);
mphik=mean(phik(:,st),2);
a(1)=mphik(1);
a(2:ny0/2)=2*mphik(2:ny0/2);
semilogy(vky(1:ny0/2),a,'r--','Linewidth',1)
hold
st=380;
nts=400;
cr=zeros(ny0,1);
phik=zeros(ny0,nts-st+1);
for nt=st:nts                       %%% H
load(['dat',sprintf('%4.4d',nt)])
%densave(:,:,nt)=deni(:,:,2);

%      for i=1:nx0 
i=77;
%i=30;
cr(:)=ifft(phi(i,2:ny0+1,2)); 
%cr(:)=ifft(tei(i,2:ny0+1,2)); 
% cr2(:)=ifft(pei(i,2:ny0+1,2));
% cr3(:)=ifft(deni(i,2:ny0+1,2));
phik(:,nt)=abs(cr(:));
% pek(:,nt)=abs(cr2(:));
% denk(:,nt)=abs(cr3(:));
end
set(gca,'FontSize',14);
axis([0 2 10^-5 10])
set(gca,'XTick',[0 1 2]);
mphik=mean(phik(:,st),2);
a(1)=mphik(1);
a(2:ny0/2)=2*mphik(2:ny0/2);
semilogy(vky(1:ny0/2),a,'-b','Linewidth',1)
% %loglog(vky(1:ny0/2),a,'-b','Linewidth',1)
% hold

% mphik=mean(pek,2);
% a(1)=mphik(1);
% a(2:ny0/2)=2*mphik(2:ny0/2);
% axis([0 2 10^-10 10])
% set(gca,'XTick',[0 1 2]);
% semilogy(vky(1:ny0/2),a(1:ny0/2),'-r','Linewidth',1)
% %loglog(vky(1:ny0/2),a(1:ny0/2),'-r','Linewidth',1)
% mphik=mean(denk,2);
% a(1)=mphik(1);
% a(2:ny0/2)=2*mphik(2:ny0/2);
% axis([0 2 10^-10 10])
% set(gca,'XTick',[0 1 2]);
% semilogy(vky(1:ny0/2),a(1:ny0/2),'-g','Linewidth',1)
% hold off
% vky=squeeze(vky);
% a=squeeze(a);
xlabel('k_y \rho_s'); legend('L','H');
print(gcf,'-depsc',[sprintf('%4.4d',i),'phik'])


