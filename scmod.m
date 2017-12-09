global nx ny nz wi w vex vey  phi den deni te pe tei pei ...
        dy1p5 dx1p5 dyt1p5 dxt1p5 dtx dty source  source2 ...
        Ax api  pii  shat phi2 nve balloon phase c vbias z0...
        cxk cyk dyt1p jz  vii vi  dzt1p5   dtz  dst_dif  ak2 aky Dx vb... 
        bc_left bc_right p_right p_left p_right_fix z_periodic ALdif

z=zeros(1,nz);
sz2=zeros(1,nz);
cx=zeros(1,1,nz);
cy=zeros(1,1,nz);

dz=1./(nz-2);
for k=1:nz
    %z(k)=dz*(k-2);  %outside z=2
    % z(k)=dz*(k-2)-0.25;  %bottom
    z(k)=dz*(k-2)-z0;
    % z(k)=dz*(k-2)-0.5;  %inside
    ph=balloon*2*pi*z(k);        %ph=theta
    sz2(k)=ph*shat;
    cx(k)=sin(ph);
    cy(k)=cos(ph)+sz2(k)*sin(ph);
end
q=3;Lz=2*pi*q;
sigma=aR/(Lz);
dzt1p5=sigma*tau/(2.*dz);
dtz=difz*tau/(dz^2);


nx=nx0+2;
ny=ny0+2;
dx=alx/(nx-1);
bc_left=p_left/dx^2;%full p
bc_right=p_right/dx^2;


dy=aly/(ny0);
dxt1p5=arho*tau/(2.*dx);
dyt1p5=arho*tau/(2.*dy);

dxt1p=-curvature*2.0*bz*aR*tau/(2.*dx);
dyt1p=-curvature*2.0*bz*aR*tau/(2.*dy);


cy=cy*dyt1p;
cx=cx*dxt1p;
cyk = repmat(cy,[nx,ny,1]);
cxk = repmat(cx,[nx,ny,1]);
%sz2y = repmat(sz2',[ny,1]);
sz2y = repmat(sz2,[ny,1]);

if dif_distribute == 1
    xx = dx:dx:alx-dx;
    xx = xx';
    dst_x = 0.1*alx;
    dst_w = 3;
    % ALdif = 5;
    
    dst_dif =ALdif*(tanh((dst_x-xx)/dst_w)+1)*0.5...
        + 0*(tanh((xx-alx+dst_x)/dst_w)+1)*0.5 +1;
    figure;
    plot(dst_dif,'r+');
    title('distribution of dif');
    print(gcf,'-dpng','dist_dif')
    dst_dif = repmat(dst_dif,[1,ny-2,nz-2]);
else
    dst_dif = dif;
end

dx1p5=1./(2.*dx);
dy1p5=1./(2.*dy);
dtx=dif*tau/(dx^2);
dty=dif*tau/(dy^2);
%dx_2=1./(dx^2);dy_2=1./(dy^2);
dtdx=tau/dx;
%dtxsq=tau/(dx^2);dtysq=tau/(dy^2);

% Ax Dx are in cpu memory
Ax=2*eye(nx0)-diag(ones(nx0-1,1),1)-diag(ones(nx0-1,1),-1);%fix
Dx=0*eye(nx0)-diag(ones(nx0-1,1),1)+diag(ones(nx0-1,1),-1);


Ax=Ax/dx^2;
c=sqrt(-1);
Dx=Dx*c/dx;
Dx=sparse(Dx);
Ax=sparse(Ax);

x=zeros(nx,1);
s=zeros(nx,1);
svb=zeros(nx,1);
s2=zeros(nx,1);
for i=1:nx
   % x3(i)=dx*(i-1)/alx;
    x(i)=dx*(i-2);
    s(i)=tau*sp*exp(-((x(i)-xs)/xw)^2 );
   s2(i)=tau*sn*exp(-((x(i)-xs)/xw)^2 );
   svb(i)=vbias*exp(-((x(i)-xsb)/xwb)^2 );
   %svb(i)=vbias*0.5*(tanh((x(i)-xmin)/xb) +tanh((xmax-x(i))/xb));
end
source = repmat(s,[1,ny,nz]);
source2 = repmat(s2,[1,ny,nz]);
%X3=repmat(x3',[1,ny,nz]);
vb = repmat(svb,[1,ny,nz]);
 %plot(svb);
 %hold;
 %plot(s/tau,'r');
 %print(gcf,'-dpng',['bias_sp','.png'])

ny02=ny0/2;
pi2=2.*pi;
pi2y=pi2/aly;
vkysq=zeros(ny,1);
vky=zeros(ny,1);
for j=1:ny02+1
    vky(j)=pi2y*(j-1);
    vkysq(j)=vky(j)^2;
end
for j=ny02+2:ny0
    jj=j-ny0;
    vky(j)=pi2y*(jj-1);
    vkysq(j)=vky(j)^2;
end

vkyz = repmat(vky,[1,nz]);
vkysqz = repmat(vkysq,[1,nz]);


ak2=zeros(ny,nz);
ak2(1:ny0,1:nz)=vkysqz(1:ny0,1:nz).*(1+sz2y(1:ny0,1:nz).^2);

aky=zeros(ny,nz);
aky(1:ny0,1:nz)=vkyz(1:ny0,1:nz).*sz2y(1:ny0,1:nz);


x2=zeros(nx,1);
for i=1:nx
    x2(i)=dx*(i-1)-alx/2;
end
x2y = repmat(x2,[1,ny]);
vkyx = repmat(vky',[nx,1]);

if (balloon == 1 && z_periodic == 0)
  phase=zeros(nx,ny);
  phase(1:nx0,1:ny0)=-pi2*shat*vkyx(1:nx0,1:ny0).*x2y(2:nx0+1,1:ny0);
end


if ~exist('A3.mat','file')
  calculateA3
else
  load A3.mat
end

% Initialization
wi=zeros(nx,ny,nz);
phi2=zeros(nx,ny,nz);
vex=zeros(nx,ny,nz);
vey=zeros(nx,ny,nz);
jz=zeros(nx,ny,nz);
vii=zeros(nx,ny,nz);
nve=zeros(nx,ny,nz);
ve=zeros(nx,ny,nz);
pii=zeros(nx,ny,nz);

tei=ones(nx,ny,nz);
deni=ones(nx,ny,nz);
phi=ones(nx,ny,nz)*lam;
pei=ones(nx,ny,nz);

%pei=wi;%p=ptilde

if (restart == 0)
      for k=2:nz-1 
      for j=2:ny-1
      for i=2:nx-1     
        %flat p_inital
        pei(i,j,k)=1.+pert*rand+amp*exp(-((x(i)-xs)/xw)^2 );
        pii(i,j,k)=1.+pert*rand+amp*exp(-((x(i)-xs)/xw)^2 );
        
        % deni(i,j,k)=1.+pert*rand+amp*exp(-((x(i)-xs)/xw)^2 );
      end
      end
      end

  if (balloon == 1 && z_periodic == 0)
    pei=sbcz_phase(pei);
    pii=sbcz_phase(pii);
  else
    pei=sbcz(pei);
    pii=sbcz(pii);
  end

  pei=sbcy(pei);
  pii=sbcy(pii);

  if p_right_fix == 0
    % free right boundary of p
    pei=sbcxnn4(pei);
    pii=sbcxnn4(pii);
  else
    % fix right boundary of p
    pei=sbcxnn2(pei);
    pii=sbcxnn2(pii);
  end

  deni=sbcz(deni);
  deni=sbcy(deni);
  deni=sbcxnn3(deni);

  figure
  plot(squeeze(mean(pei(:,:,2),2)),'-o')
elseif (restart == 1)
   load rest.mat
end

if p_right_fix == 0
  % free right boundary of p
  pei=sbcxnn4(pei);
  pii=sbcxnn4(pii);
else
  % fix right boundary of p
  pei=sbcxnn2(pei);
  pii=sbcxnn2(pii);
end
phi2=phi+pii;

% solve equations
den=deni;
tei=pei./deni;
te=tei;
pe=pei;
api=pii;
w=wi;

bc=0;
vi=vii;
for nt=1:nts
  for ntt=1:ntp

     sfield
     f=0.5;
     fi=0.5;
     svi(f,fi)
     sw(f,fi)
     spe(f,fi)
     spi(f,fi)
     % sden(f,fi)
     spe1d

     sfield
     f=1.0;
     fi=0.0;
     svi(f,fi)
     sw(f,fi);
     spe(f,fi)
     spi(f,fi)
     % sden(f,fi)
     spe1d

     done=isfinite(pei(2,2,2));
     if done==0
        error('nan')
     end
  end
  nt
  % p_left
  fid=['dat',sprintf('%4.4d',nt)];
  save(fid,'wi', 'pei', 'phi','vii', 'vey','vex','jz','deni', 'phi2','tei','pii')%,'laplace2_pi')
end

