gamma=zeros(1,7);
range=zeros(2,7);
for nk=1:7
slope=calcslope(log(phik(nk+1,:)),1);
plot(slope);
print(gcf,'-dpng',sprintf('n=%d',nk)) 
range(1:2,nk)=abs([slope(60)-slope(70),slope(80)-slope(70)])./slope(70);
gamma(nk)=mean(slope(60:80));
end
plot(gamma);
print(gcf,'-dpng','gamma_ky') 
save gamma gamma range phik