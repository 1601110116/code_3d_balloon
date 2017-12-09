clear all; close all
addpath /Users/plasma/Desktop/zhouao/code_3d_balloon
addpath /Users/plasma/Desktop/zhouao/code_3d_balloon/plot

global nx0 ny0 nz lam bz  nustar_inv  shat arho dif difz tau...
       nx2 both balloon dif_distribute n_right n_left p_left p_right...
       p_right_fix vbias z0 z_periodic ALdif
   
% z0 = 0.25; % bottom
z0 = 0.5; % inside
% z0 = 0; % outside

z_periodic = 1; % periodic bc in z
% z_periodic = 0; % phase bc in z

p_right_fix = 0;
p_right=0.6;
p_left=1;

n_right=1;
n_left=1;

restart=0;
% restart=1;

amp=0.;

% tau=.01;%linear
tau=.005;            
% tau=.001;%nonlinear

% dif=1;%nonlinear
dif=0.5;%linear
%dif=2;%nonlinear,pi,open

% dif_distribute=1;  % add diffusion layer
% ALdif=5;
dif_distribute=0;

nustar_inv=1;

%arho=500;%arho=Rho=a/rhos 
arho=200;
%arho=1000;
% arho=100;

%sn=.1; sp=.2;%nonlinear,open,helimak
sn=0;sp=0;   %linear,close
%sp=.4;
%sp=.3;
% sp=.02;

% both=0;%close only
both=1;%both, add open, helimak

% balloon=0;shat=0;%2d,interchange,helimak
balloon=1;shat=1;%balloon

% nz=3;%2d
nz=18; %3d

%ntp=20;  nts=30;%nonlinear
% ntp=50;  nts=100;%linear
ntp=80;  nts=40;%linear
%ntp=100;    nts=1; %start
%  ntp=1;    nts=10; %start

alx=75;nx0=192;%balloon
aly=100;ny0=256;

%bn=1;bt=1;
%lam=3;%open
lam=0;

aR=0.3;
curvature=1;
%curvature=0;%DW
pert=1.e-6; 

difz=0.1;

q=3;Lz=2*pi*q;
bz=1;%tokamak
%bz=-1;%helimak
vbias=0.;%helimak
%vbias=-0.5;
%vbias=0.5;
xsb=alx/2;xwb=3;%helimak
%xmin=10;xmax=15;xb=1;%helimak
xs=0;xw=6;
%xw=2;
% xs=alx/4;xw=3;%helimak
%nx2=1;%all open.helimak
nx2=102;     %nx_sol=nx/2;
%nx=nx0+2;
%ny=ny0+2;
scmod;
showt_3d_balloon;
% showt_3d_profile;
% showt_2d;

%scmod;showtime
%save data2 lam tau nts ntp nz nx ny alx aly pert xs xw xmin xmax xb dif vbias Rho bz sn

