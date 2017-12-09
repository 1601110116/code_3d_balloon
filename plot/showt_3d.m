close all

iz_iter = [2]
iy_iter = [10]
ix_iter = [40]

dx=alx/(nx-1);
dy=aly/(ny-1);
xx=0:dx:alx;
yy=0:dy:aly;

K=zeros(nts,1);
U=zeros(nts,1);

for nt=1:nts

    data = load(['dat',sprintf('%4.4d',nt)]);

    % plot spatial structure
    for iz = iz_iter
        % x-y plot
        figure
        colormap jet;

        subplot(423)
        pcolor(yy,xx,squeeze(data.phi(:,:,iz))); 
        colorbar; shading interp;
        axis([0 100 10 65]);
        hold on
        ysep=40;
        lx=[0,100];ly=[ysep,ysep];
        plot(lx,ly,'k');
        hold off
        title('$$\phi$$','Interpreter','latex')
        ylabel('x')
        xlabel('y')
        drawnow
        
        subplot(424)
        a=sp0(data.phi);
        pcolor(yy,xx,squeeze(a(:,:,2)))
        colorbar;shading interp;
        title('$$\widetilde{\phi}$$','Interpreter','latex')
        ylabel('x')
        hold on
        ysep=40;
        lx=[0,100];ly=[ysep,ysep];
        plot(lx,ly,'k');
        hold off
        axis([0 100 10 65]);
        xlabel('y')
        drawnow
            
        subplot(425)
        pcolor(yy,xx,squeeze(data.wi(:,:,iz))); colorbar; shading interp;
        title('$$w$$','Interpreter','latex')
        hold on
        ysep=40;
        lx=[0,100];ly=[ysep,ysep];
        plot(lx,ly,'k');
        hold off
        axis([0 100 10 65]);
        ylabel('x')
        xlabel('y')
        drawnow

        subplot(426)
        a = sp0(data.pei);
        pcolor(yy,xx,squeeze(a(:,:,iz)));colorbar; shading interp;
        title('$$\widetilde{p_e}$$','Interpreter','latex')
        hold on
        ysep=40;
        lx=[0,100];ly=[ysep,ysep];
        plot(lx,ly,'k');
        hold off
        axis([0 100 10 65]);
        xlabel('y')
        ylabel('x')
        drawnow

        subplot(422)
        pcolor(yy,xx,squeeze(data.pei(:,:,iz))); 
        colorbar; shading interp;
        title('$$p_e$$','Interpreter','latex')
        hold on
        ysep=40;
        lx=[0,100];ly=[ysep,ysep];
        plot(lx,ly,'k');
        hold off
        axis([0 100 10 65]);
        ylabel('x')
        xlabel('y')
        drawnow

        subplot(427) 
        pcolor(yy,xx,squeeze(data.vex(:,:,iz))); 
        colorbar; shading interp; 
        title('$$v_x$$','Interpreter','latex')
        hold on
        ysep=40;
        lx=[0,100];ly=[ysep,ysep];
        plot(lx,ly,'k');
        hold off
        axis([0 100 10 65]);
        xlabel('y')
        ylabel('x')
        drawnow

        subplot(421)
        pcolor(yy,xx,squeeze(data.pii(:,:,iz))); colorbar; shading interp;
        title('$$p_i$$','Interpreter','latex')
        hold on
        ysep=40;
        lx=[0,100];ly=[ysep,ysep];
        plot(lx,ly,'k');
        hold off
        axis([0 100 10 65]);
        xlabel('y')
        ylabel('x')
        drawnow

        subplot(428) 
        pcolor(yy,xx,squeeze(data.vey(:,:,iz))); 
        colorbar; shading interp; 
        axis([0 100 10 65]);
        title('$$v_y$$','Interpreter','latex')
        hold on
        ysep=40;
        lx=[0,100];ly=[ysep,ysep];
        plot(lx,ly,'k');
        hold off
        xlabel('y')
        ylabel('x')
        drawnow;
        
        print(gcf,'-dpng',sprintf('%2.2dz_%4.4d',iz,nt))
        close all

        % plot mean profile
        figure;plot(squeeze(mean(data.pei(:,:,iz),2)),'-o');print(gcf,'-dpng',sprintf('%2.2dz_pe%4.4d',iz,nt)); close all;
        figure;plot(squeeze(mean(data.pii(:,:,iz),2)),'-o');print(gcf,'-dpng',sprintf('%2.2dz_pi%4.4d',iz,nt)); close all;
        figure;plot(squeeze(mean(data.phi(:,:,iz),2)),'-o');print(gcf,'-dpng',sprintf('%2.2dz_phi%4.4d',iz,nt)); close all;
        figure;plot(squeeze(mean(data.vey(:,:,iz),2)),'-o');print(gcf,'-dpng',sprintf('%2.2dz_vy%4.4d',iz,nt)); close all;
        figure;plot(squeeze(mean(data.wi(:,:,iz),2)),'-o');print(gcf,'-dpng',sprintf('%2.2dz_w%4.4d',iz,nt)); close all;
    end

    for iy = iy_iter
        % x-z plot
        figure;
        subplot(421)
        pcolor(squeeze(data.phi(:,iy,:))); colorbar; shading interp; colormap jet;
        title('$\phi$','Interpreter','latex');
        ylabel('x');
        xlabel('z');
        hold on;

        subplot(422)
        pcolor(squeeze(-data.wi(:,iy,:))); colorbar; shading interp; colormap jet;
        title('$w$','Interpreter','latex');
        ylabel('x');
        xlabel('z');
        hold on;

        subplot(423)
        pcolor(squeeze(data.pei(:,iy,:))); colorbar;shading interp; colormap jet;
        title('$p_e$','Interpreter','latex');
        ylabel('x');
        xlabel('z');
        hold on;

        subplot(424)
        a=sp0(data.pei);
        pcolor(squeeze(a(:,iy,:)));colorbar; shading interp; colormap jet;
        title('${\tilde p}_e$','Interpreter','latex');
        ylabel('x');
        xlabel('z');
        hold on;

        subplot(425)
        pcolor(squeeze(data.vex(:,iy,:))); colorbar; shading interp; colormap jet;
        title('$v_x$','Interpreter','latex');
        ylabel('x');
        xlabel('z');
        hold on;

        subplot(426)
        pcolor(squeeze(data.vey(:,iy,:))); colorbar; shading interp; colormap jet;
        title('$v_y$','Interpreter','latex');
        ylabel('x');
        xlabel('z');
        hold on;

        subplot(427)
        pcolor(squeeze(data.vii(:,iy,:))); colorbar;shading interp; colormap jet;
        title('$u_i$','Interpreter','latex');
        ylabel('x');
        xlabel('z');
        hold on;

        subplot(428)
        pcolor(squeeze(data.jz(:,iy,:))); colorbar;shading interp; colormap jet;
        title('$j_z$','Interpreter','latex');
        ylabel('x');
        xlabel('z');

        filename=sprintf('%2.2dy_%4.4d',iy,nt);
        % saveas(gcf,filename);     % for Matlab r2014a save as .fig
        saveas(gcf,[filename,'.png']);   % for Matlab r2014b save as .png
        close;
    end

    % fluctating energy and mean energy
    vy0=mean(mean(data.vey(26:166,:,:),2),3);
    U(nt)=mean(vy0.^2); 

    vy=data.vey(26:166,:,:)-repmat(vy0,[1,ny,nz]);
    vperp=vy.^2+data.vex(26:166,:,:).^2;
    K(nt)=mean((mean(mean(vperp,2),1)));

end


close all


plot(U)
hold on
plot(K,'-r','Linewidth',1)
xlabel('nts');
legend('U','K','Location','best');
print(gcf,'-dpng',sprintf('KE')) 
hold off
close all

