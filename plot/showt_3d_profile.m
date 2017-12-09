close all


dx=alx/(nx-1);
dy=aly/(ny-1);
xx=0:dx:alx;
yy=0:dy:aly;

st = 1;
for nt=st:nts

	data = load(['dat',sprintf('%4.4d',nt)]);
	% -------------
	% profile of pi
	% -------------
	figure;
	X = linspace(0, 2*pi, 16);
	Y = xx;
	a = squeeze(mean(data.pii, 2));
	% surfL = surf(X, Y(26:166), a(26:166,2:17));
	surfL = surf(X, Y, a(:,2:17));
	colormap('jet');
	colorbar;
	% freezeColors
	% hold on;
	% surfH = surf(X, Y(26:166), pi_prof_H(26:166,2:17));
	% colormap('autumn');
	% freezeColors
	shading interp;
	% surfL.FaceColor = 'b';
	% surfH.FaceColor = 'r';
	surfL.FaceAlpha = 0.8;
	% surfH.FaceAlpha = 0.8;
	% ylim([10 65])
	set(gca,'ydir','reverse');
	set(gca,'XTick',linspace(0, 2*pi, 5))
	set(gca,'XTickLabel',{'0', '4\pi/8','8\pi/8','12\pi/8', '2\pi'})
	xlabel('$z$','Interpreter','latex')
	ylabel('$x$','Interpreter','latex')
	zlabel('$p_i$','Interpreter','latex')
	% lgd = legend('L-regime','H-regime');
	% set(lgd, 'Location', 'northeast');

	z_range = zlim;
	hold on;
	sepF = surf([0, 2*pi], [40 40],...
	    [z_range(2),z_range(2);z_range(1),z_range(1)]);
	sepF.FaceColor = 'k';
	sepF.FaceAlpha = 0.2;
	sepF.EdgeColor = 'none';

	view(-75,15)

	filename=sprintf('pi_prof%4.4d',nt);
	print(gcf,'-dpng',filename)

	% -------------
	% profile of pe
	% -------------
	figure;
	X = linspace(0, 2*pi, 16);
	Y = xx;
	a = squeeze(mean(data.pei, 2));
	% surfL = surf(X, Y(26:166), a(26:166,2:17));
	surfL = surf(X, Y, a(:,2:17));
	colormap('jet');
	colorbar;
	% freezeColors
	% hold on;
	% surfH = surf(X, Y(26:166), pe_prof_H(26:166,2:17));
	% colormap('autumn');
	% freezeColors
	shading interp;
	% surfL.FaceColor = 'b';
	% surfH.FaceColor = 'r';
	surfL.FaceAlpha = 0.8;
	% surfH.FaceAlpha = 0.8;
	% ylim([10 65])
	set(gca,'ydir','reverse');
	set(gca,'XTick',linspace(0, 2*pi, 5))
	set(gca,'XTickLabel',{'0', '4\pi/8','8\pi/8','12\pi/8', '2\pi'})
	xlabel('$z$','Interpreter','latex')
	ylabel('$x$','Interpreter','latex')
	zlabel('$p_e$','Interpreter','latex')
	% lgd = legend('L-regime','H-regime');
	% set(lgd, 'Location', 'northeast');

	z_range = zlim;
	hold on;
	sepF = surf([0, 2*pi], [40 40],...
	    [z_range(2),z_range(2);z_range(1),z_range(1)]);
	sepF.FaceColor = 'k';
	sepF.FaceAlpha = 0.2;
	sepF.EdgeColor = 'none';

	view(-75,15)

	filename=sprintf('pe_prof%4.4d',nt);
	print(gcf,'-dpng',filename)

	% -------------
	% profile of phi
	% -------------
	figure;
	X = linspace(0, 2*pi, 16);
	Y = xx;
	a = squeeze(mean(data.phi, 2));
	% surfL = surf(X, Y(26:166), a(26:166,2:17));
	surfL = surf(X, Y, a(:,2:17));
	colormap('jet');
	colorbar;
	% freezeColors
	% hold on;
	% surfH = surf(X, Y(26:166), phi_prof_H(26:166,2:17));
	% colormap('autumn');
	% freezeColors
	shading interp;
	% surfL.FaceColor = 'b';
	% surfH.FaceColor = 'r';
	surfL.FaceAlpha = 0.8;
	% surfH.FaceAlpha = 0.8;
	% ylim([10 65])
	set(gca,'ydir','reverse');
	set(gca,'XTick',linspace(0, 2*pi, 5))
	set(gca,'XTickLabel',{'0', '4\pi/8','8\pi/8','12\pi/8', '2\pi'})
	xlabel('$z$','Interpreter','latex')
	ylabel('$x$','Interpreter','latex')
	zlabel('$\phi$','Interpreter','latex')
	% lgd = legend('L-regime','H-regime');
	% set(lgd, 'Location', 'northeast');

	z_range = zlim;
	hold on;
	sepF = surf([0, 2*pi], [40 40],...
	    [z_range(2),z_range(2);z_range(1),z_range(1)]);
	sepF.FaceColor = 'k';
	sepF.FaceAlpha = 0.2;
	sepF.EdgeColor = 'none';

	view(-75,15)

	filename=sprintf('phi_prof%4.4d',nt);
	print(gcf,'-dpng',filename)

	% -------------
	% profile of vy
	% -------------
	figure;
	X = linspace(0, 2*pi, 16);
	Y = xx;
	a = squeeze(mean(data.vey, 2));
	% surfL = surf(X, Y(26:166), a(26:166,2:17));
	surfL = surf(X, Y, a(:,2:17));
	colormap('jet');
	colorbar;
	% freezeColors
	% hold on;
	% surfH = surf(X, Y(26:166), vy_prof_H(26:166,2:17));
	% colormap('autumn');
	% freezeColors
	shading interp;
	% surfL.FaceColor = 'b';
	% surfH.FaceColor = 'r';
	surfL.FaceAlpha = 0.8;
	% surfH.FaceAlpha = 0.8;
	% ylim([10 65])
	set(gca,'ydir','reverse');
	set(gca,'XTick',linspace(0, 2*pi, 5))
	set(gca,'XTickLabel',{'0', '4\pi/8','8\pi/8','12\pi/8', '2\pi'})
	xlabel('$z$','Interpreter','latex')
	ylabel('$x$','Interpreter','latex')
	zlabel('$v_y$','Interpreter','latex')
	% lgd = legend('L-regime','H-regime');
	% set(lgd, 'Location', 'northeast');

	z_range = zlim;
	hold on;
	sepF = surf([0, 2*pi], [40 40],...
	    [z_range(2),z_range(2);z_range(1),z_range(1)]);
	sepF.FaceColor = 'k';
	sepF.FaceAlpha = 0.2;
	sepF.EdgeColor = 'none';

	view(-75,15)

	filename=sprintf('vy_prof%4.4d',nt);
	print(gcf,'-dpng',filename)

	% -------------
	% profile of w
	% -------------
	f = figure;
	X = linspace(0, 2*pi, 16);
	Y = xx;
	a = squeeze(mean(data.wi, 2));
	% surfL = surf(X, Y(26:166), a(26:166,2:17));
	surfL = surf(X, Y, a(:,2:17));
	colormap('jet');
	colorbar;
	% freezeColors
	% hold on;
	% surfH = surf(X, Y(26:166), w_prof_H(26:166,2:17));
	shading interp;
	% colormap('autumn');
	% freezeColors
	% surfL.FaceColor = 'b';
	% surfH.FaceColor = 'r';
	surfL.FaceAlpha = 0.8;
	% surfH.FaceAlpha = 0.8;
	% ylim([10 65])
	set(gca,'ydir','reverse');
	set(gca,'XTick',linspace(0, 2*pi, 5))
	set(gca,'XTickLabel',{'0', '4\pi/8','8\pi/8','12\pi/8', '2\pi'})
	xlabel('$z$','Interpreter','latex')
	ylabel('$x$','Interpreter','latex')
	zlabel('$w$','Interpreter','latex')
	% lgd = legend('L-regime','H-regime');
	% set(lgd, 'Location', 'northeast');

	z_range = zlim;
	hold on;
	sepF = surf([0, 2*pi], [40 40],...
	    [z_range(2),z_range(2);z_range(1),z_range(1)]);
	sepF.FaceColor = 'k';
	sepF.FaceAlpha = 0.2;
	sepF.EdgeColor = 'none';

	view(-75,15)

	filename=sprintf('w_prof%4.4d',nt);
	print(gcf,'-dpng',filename)

	close all
end