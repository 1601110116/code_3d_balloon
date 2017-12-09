x=0;
st=1;
nts=150;
aly=100;
for nt=st:nts
    x=80*0.005+x;
    t(nt)=x;
end
load(['gamma']);
for nk=1:7
	% figure;
	% set(gca,'FontSize',14);
	% plot(t,log(phik(nk+1,:)));
	% xlabel('t/t_0');
	% ylabel('$$log\phi$$','Interpreter','latex');
 %    %legend('n=1','location','NorthWest');
	% print(gcf,'-dpng',sprintf('n=%d_logphik',nk));
    
    Dt=80*0.005;
    slope_phik=firstlog(phik(nk+1,:),Dt);
    % figure;
    % set(gca,'FontSize',14);
    % plot(t,slope_phik);
    % xlabel('t/t_0');
    % ylabel('slope-$$log\phi$$','Interpreter','latex');
    % %legend('n=1','location','NorthWest');
    % print(gcf,'-dpng',sprintf('n=%d_slope_phik',nk));

    % gamma(nk)=mean(slope_phik(60:80));  % first stage
    gamma(nk)=mean(slope_phik(95:105));  % second stage
    ky(nk)=2*pi*nk/aly;
end
%%
figure;
set(gca,'FontSize',14);
plot(ky,gamma);
xlabel('$$k_y \rho_s$$','Interpreter','latex');
ylabel('$$\gamma t_0$$','Interpreter','latex');
print(gcf,'-dpng',sprintf('gamma_ky2'));
