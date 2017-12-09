x1 = 26;
x2 = 166;
nx_eff = x2 - x1 + 1;

tau
ntp
dt = tau * ntp

pe_ts = zeros(nx_eff,ny-2,nz-2,nts);
pi_ts = zeros(nx_eff,ny-2,nz-2,nts);
phi_ts = zeros(nx_eff,ny-2,nz-2,nts);
vi_ts = zeros(nx_eff,ny-2,nz-2,nts);
jz_ts = zeros(nx_eff,ny-2,nz-2,nts);
vx_ts = zeros(nx_eff,ny-2,nz-2,nts);
vy_ts = zeros(nx_eff,ny-2,nz-2,nts);

dpidx_ts = zeros(nx_eff,ny-2,nz-2,nts);
dpidy_ts = zeros(nx_eff,ny-2,nz-2,nts);

cphi_ts = zeros(nx_eff,ny-2,nz-2,nts);
bdelvi_ts = zeros(nx_eff,ny-2,nz-2,nts);
bdelpe_ts = zeros(nx_eff,ny-2,nz-2,nts);
bdelphi_ts = zeros(nx_eff,ny-2,nz-2,nts);

for nt=1:nts

    data = load(['dat',sprintf('%4.4d',nt)]);

    pe_ts(:,:,:,nt) = data.pei(x1:x2,2:ny-1,2:nz-1);
    pi_ts(:,:,:,nt) = data.pii(x1:x2,2:ny-1,2:nz-1);
    phi_ts(:,:,:,nt) = data.phi(x1:x2,2:ny-1,2:nz-1);
    vi_ts(:,:,:,nt) = data.vii(x1:x2,2:ny-1,2:nz-1);
    jz_ts(:,:,:,nt) = data.jz(x1:x2,2:ny-1,2:nz-1);
    vx_ts(:,:,:,nt) = data.vex(x1:x2,2:ny-1,2:nz-1);
    vy_ts(:,:,:,nt) = data.vey(x1:x2,2:ny-1,2:nz-1);

    dpidx = zeros(nx,ny,nz);
    dpidy = zeros(nx,ny,nz);
    dpidx(2:nx-1,2:ny-1,2:nz-1) = (data.pii(3:nx,2:ny-1,2:nz-1) - data.pii(1:nx-2,2:ny-1,2:nz-1)) / (2*tau);
    dpidy(2:nx-1,2:ny-1,2:nz-1) = (data.pii(2:nx-1,3:ny,2:nz-1) - data.pii(2:nx-1,1:ny-2,2:nz-1)) / (2*tau);
    
    dpidx_ts(:,:,:,nt) = dpidx(x1:x2,2:ny-1,2:nz-1);
    dpidy_ts(:,:,:,nt) = dpidy(x1:x2,2:ny-1,2:nz-1);


    cphi = curv(data.phi);
    cphi_ts(:,:,:,nt) = cphi(x1:x2,2:ny-1,2:nz-1);
    
    bdelvi = sbdel(data.vii);
    bdelvi_ts(:,:,:,nt) = bdelvi(x1:x2,2:ny-1,2:nz-1);
    
    bdelpe = sbdel(data.pei);
    bdelpe_ts(:,:,:,nt) = bdelpe(x1:x2,2:ny-1,2:nz-1);
    
    bdelphi = sbdel(data.phi);
    bdelphi_ts(:,:,:,nt) = bdelphi(x1:x2,2:ny-1,2:nz-1);
end

% left side
% eq 13
pe_int = sum3(pe_ts);
dpedt_int = (pe_int(3:nt) - pe_int(1:nt-2)) / (2*dt);
% eq 14
pi_int = sum3(pi_ts);
dpidt_int = (pi_int(3:nt) - pi_int(1:nt-2)) / (2*dt);
% eq 15
E_int = 0.5 * sum3(vx_ts.^2 + vy_ts.^2);
dEdt_int = (E_int(3:nt) - E_int(1:nt-2)) / (2*dt);

gradphi_dgradpdt = sum3(vy_ts(:,:,:,2:nt-1) .* (dpidx_ts(:,:,:,3:nt) - dpidx_ts(:,:,:,1:nt-2)) / (2*dt) ...
                            + vx_ts(:,:,:,2:nt-1) .* (dpidy_ts(:,:,:,3:nt) - dpidx_ts(:,:,:,1:nt-2)) / (2*dt));
% eq16
vi2_int = sum3(vi_ts.^2);
dvi2dt_int = 0.5 * (vi2_int(3:nt) - vi2_int(1:nt-2)) / (2*dt);
% eq17
jz2_int = sum3(jz_ts(:,:,:,2:nt-1).^2) / nustar_inv;
sum_left = dpedt_int + dpidt_int + dEdt_int + gradphi_dgradpdt + dvi2dt_int + jz2_int;

% right hand
% eq 13
pi_cphi_int = sum3(pi_ts(:,:,:,2:nt-1) .* cphi_ts(:,:,:,2:nt-1));
pi_gradvi_int = sum3(pi_ts(:,:,:,2:nt-1) .* bdelvi_ts(:,:,:,2:nt-1));
% eq 14
pe_cphi_int = sum3(pe_ts(:,:,:,2:nt-1) .* cphi_ts(:,:,:,2:nt-1));
pe_gradvi_int = sum3(pe_ts(:,:,:,2:nt-1) .* bdelvi_ts(:,:,:,2:nt-1));
jz_gradpe_int = sum3(jz_ts(:,:,:,2:nt-1) .* bdelpe_ts(:,:,:,2:nt-1));
% eq 15
jz_gradphi_int = sum3(jz_ts(:,:,:,2:nt-1) .* bdelphi_ts(:,:,:,2:nt-1));

figure;
plot(dpedt_int,'r-o');
hold on;
plot(-pi_cphi_int-pi_gradvi_int,'b-x')
h = legend('$$\int{\partial p_e \over \partial t}$$','$$\int{-p_i \hat{C} \phi - p_i \nabla_{||} v_{||i}}$$');
set(h,'Interpreter','latex');
title('The evolution of ion thermal energy');

figure;
plot(dpidt_int,'r-o');
hold on;
plot(-pe_cphi_ts_int-pe_gradvi_int-jz_gradpe_int,'b-x');
h = legend('$$\int{\partial p_i \over \partial t}$$','$$\int{ p_e \hat{C} \phi -p_e \nabla_{||} v_{||i} -j_{||}\nabla_{||} p_e }$$');
set(h,'Interpreter','latex');
title('The evolution  of electron thermal energy');

figure;
plot(dEdt_int + gradphi_dgradpdt,'r-o');
hold on;
plot(pi_cphi_int + pe_cphi_int + jz_gradphi_int,'b-x');
h = legend('$$\int{{1 \over 2} {\partial \over \partial t} |\nabla_{\perp} \phi|^2 + \nabla_{\perp} \phi \cdot {\partial \over \partial t} \nabla_{\perp}{p} }$$',...
        '$$\int{ (p_e+p_i) \hat{C} {\phi} +j_{||}\nabla_{||} \phi }$$');
set(h,'Interpreter','latex');
title('The evolution of the fluid kinetic energy');

figure;
plot(dvi2dt_int,'r-o');
hold on;
plot(pi_gradvi_int + pe_gradvi_int,'b-x');
h = legend('$$\int{\partial v_{||i}^2 / \partial t}$$','$$\int{ (p_e+p_i) \nabla_{||} v_{||i} }$$');
set(h,'Interpreter','latex');
title('The evolution  of ion parallel flow energy');

figure;
plot(jz2_int,'r-o');
hold on;
plot(-jz_gradphi_int + jz_gradpe_int,'b-x');
h = legend('$$\int{\nu_* j_{||}^2}$$','$$\int{-j_{||}\nabla_{||} \phi +j_{||}\nabla_{||} p_e}$$');
set(h,'Interpreter','latex');
title('The Ohm’s law');

figure;
plot(sum_left ,'k-^');
title('Total Left');


