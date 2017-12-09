global  phi pei jz  jpara  vbias  both cphi cpe ...
        petilde dpdz vex vey dy1p5 dx1p5 bz  balloon...
         deni nve vii nustar_inv z_periodic
        
cphi=curv(phi);
petilde=sp0(pei);

if (balloon<1) %interchange,2d
    cpe=curv(pei);
else
    petilde=sp0(pei);
    cpe=curv(petilde);%balloon
end
% cpe=curv(pei);

dpdz=sbdel(pei);
dphidz=sbdel(phi);

% no density evolution
jz=(dpdz-dphidz)*nustar_inv;

% with density evolution
% jz=(dpdz-deni.*dphidz)*nustar_inv;
    
    if (both<1)
        if (balloon == 1 && z_periodic == 0)
            jz=sbcz_phase(jz);    %close
        else
            jz=sbcz(jz);
        end
    else
        if (balloon == 1 && z_periodic == 0)
            jz = sbcz3_phase(jz);
        else
            jz=sbcz3(jz);
        end

        if vbias == 1
            sbcz_open;%bias
        else
            sbcz_open2;%both
        end
    end

    jpara=sbdel(jz);
    nve=vii.*deni-jz;
    
    
vey(2:nx-1,2:ny-1,2:nz-1)=dx1p5*(phi(3:nx,2:ny-1,2:nz-1)-phi(1:nx-2,2:ny-1,2:nz-1));
vex(1:nx-1,2:ny-1,2:nz-1)=dy1p5*(phi(1:nx-1,3:ny,2:nz-1)-phi(1:nx-1,1:ny-2,2:nz-1)); %free- fix


vex=-bz*vex;
vey=bz*vey;
vey=sbcy(vey);




