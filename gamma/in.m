clear all; close all
addpath D:\BS\code_pi_fullp_n_diflayer

global nx0 ny0 nz lam bz  alpha  shat arho dif difz tau...
       nx2 both cold balloon  difw flux0 p_right p_left n_right n_left dif_distribute %RLp %difui % difs nxs sigma
%Rho rho aR arho
%sigma=1;sigma=0.1;%loss
p_right=0.7;
p_left=1;
n_right=0.7;
n_left=1;
%spbc=1;heat=0;heat=1;dsp=0.1;
restart=0;
%restart=1;
%RLp=2;RLp=1;%R/Lp, growth rate
amp=0.;
%amp=0.6;
%flux0=1e-3;
flux0=0;
tau=.01;%linear
 tau=.005;

% tau=.002;
%tau=.001;%nonlinear

dif=1;%nonlinear
%dif=0.5;%linear
%dif=2;%nonlinear,pi,open
dif_distribute=1;  % add diffusion layer
%dif_distribute=0;

alpha=0.001;%alpha=1;%DW
%alpha=0.1;
%arho=500;%arho=Rho=a/rhos 
% arho=200;
%arho=1000;
arho=100;

%sn=.1; sp=.2;%nonlinear,open,helimak
sn=0;sp=0;   %linear,close
%sp=.4;
%sp=.3;
% sp=.02;

%difH=5;%difH=1;


% cold=1;%pi=0,helimak
cold=0;%with pi
% both=0;%close only
both=1;%both, add open, helimak
balloon=0;shat=0;%2d,interchange,helimak
% balloon=1;shat=1;%balloon

nz=3;%2d
% nz=18; %3d

%ntp=20;  nts=30;%nonlinear
ntp=50;  nts=100;%linear
ntp=80;  nts=150;%linear
%ntp=100;    nts=1; %start
 %ntp=1;    nts=1; %start

alx=25;nx0=64;
aly=25;ny0=64;%2d,interchange
alx=75;nx0=192;%balloon
aly=100;ny0=256;

% alx=50;nx0=128;
% alx=30;nx0=76;
%nx=nx0+2;nxb=nx0-5;nxb=nx0+1;
%nxs=round(2*nx0*xw/alx);
%ns=nxs;ns=2;
%nx=nx0+2;

%bn=1;bt=1;
%lam=3;%open
lam=0;
%R=68;a=22;
%Rho=68.5/.02; Rho=50;Rho=1000;
%rho=1/Rho;
%aR=a/R; %0.3
% aR=1; %2d, L_0=R
aR=0.3;
curvature=1;
%curvature=0;%DW
pert=1.e-15; 

difz=0.1;
%difz=0.2;%nan in z
%difui=1;
%difw=2;
difw=1;
%difs=10;difs=1;

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
%scmod;
% showt_3d;
%showt_2d;

%scmod;showtime
%save data2 lam tau nts ntp nz nx ny alx aly pert xs xw xmin xmax xb dif vbias Rho bz sn

