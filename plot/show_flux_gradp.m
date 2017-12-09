% plot flux - grad p
% Zhou Ao 10/1/16

alx=75;nx0=192;%balloon
aly=100;ny0=256;

nx = nx0+2;
ny = ny0+2;
nz = 3;

iz = 2 % 2d case

dx=alx/(nx-1);
dy=aly/(ny-1);
xx=0:dx:alx;
yy=0:dy:aly;

st = 431;
nts = 1630;
gap = 200;
flux = zeros(1,nts-st+1);
gradp = zeros(1,nts-st+1);
for nt=st:nts
	nt
	load(['dat',sprintf('%4.4d',nt)])

	flux(nt) = mean(mean(pei(40:50,2:ny-1,2:nz-1).*vex(40:50,2:ny-1,2:nz-1)));
	gradp_temp = mean((pei(3:nx,2:ny-1,2:nz-1) - pei(1:nx-2,2:ny-1,2:nz-1)),2)/dx/2;
	gradp(nt) = mean(gradp_temp(65:90));
end

figure
plot(flux,gradp,'*');
xlabel('flux');
ylabel('gradp');

figure
% sp = 0.04
st
plot(mean(flux(st:st+gap-1)), mean(gradp(st:st+gap-1)),'o');
st = st + gap;
hold on;
% sp = 0.06
st
plot(mean(flux(st:st+gap-1)), mean(gradp(st:st+gap-1)),'+');
st = st + gap;
hold on;
% sp = 0.08
st
plot(mean(flux(st:st+gap-1)), mean(gradp(st:st+gap-1)),'x');
st = st + gap;
hold on;
% sp = 0.10
st
plot(mean(flux(st:st+gap-1)), mean(gradp(st:st+gap-1)),'s');
st = st + gap;
hold on;
% sp = 0.12
st
plot(mean(flux(st:st+gap-1)), mean(gradp(st:st+gap-1)),'d');
st = st + gap;
hold on;
% sp = 0.14
st
plot(mean(flux(st:st+gap-1)), mean(gradp(st:st+gap-1)),'*');
xlabel('flux');
ylabel('gradp');


