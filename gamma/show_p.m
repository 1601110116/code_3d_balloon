alx=75;nx0=192;
nx=nx0+2;
dx=alx/(nx-1);
for i=1:nx 
   x(i)=dx*(i-1); 
end 

%% The average profile pe
  st=80;
  nts=100;
for nt=st:nts
   load(['dat',sprintf('%4.4d',nt)])
   pesave(:,:,nt)=pei(:,:,2);
end
time2=mean(mean(pesave(:,:,st:nts),2),3); 
figure; 
   set(gca,'FontSize',14);
   plot(x,time2,'b--','Linewidth',1)

fid=['pe_Linear'];
save(fid,'x','time2');
xlabel('x/\rho_s');
ylabel('p');
axis([20 60 0.2 1.1]);
print(gcf,'-dpng','prof_pe')















   
   
