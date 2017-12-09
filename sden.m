
function sden(f,fi) 
global  nx ny  nz    deni den   source2  nve cpe cphi%  jpara %cphi cpe  vpara   den0
%work=deni.*ve; 
% work=deni.*vii;
% bdelvz=sbdel(work);
% bdelvz=bdelvz-jpara;
% bdelvz=sbdel(vii);
bdelvz=sbdel(nve);



%      para=-jpara;

     %cphi= curv(phi); cpe= curv(pei); 
 
    % work=deni+den0;fxy=convect(work);
      fxy=convect(deni);
      %work=den-den0; dif2t=dif3(work);
dif2t=dif3(den);
%dif2t=dif3p0(den);
      %work=ones(nx,ny,nz);
	  work=den;
      for m=2:nz-1
      for l=2:ny-1
      for i=2:nx-1
%      para=deni(i,l,m)*loss(i)*sqrt(tei(i,l,m))*exp(lam-phi(i,l,m)/tei(i,l,m)); 
%para=deni(i,l,m)*vpara(i,l,m);
para=bdelvz(i,l,m);

     curvv=cpe(i,l,m)-deni(i,l,m)*cphi(i,l,m);
     % curvv=-deni(i,l,m)*cphi(i,l,m); 
% curvv=cpephi(i,l,m);
      work(i,l,m)=den(i,l,m)*f+deni(i,l,m)*fi-fxy(i,l,m)+dif2t(i,l,m)+curvv-para+source2(i);%...
      
      end
      end
      end 

      if (f<0.6)
         den=deni;
         deni=work;
      else
         deni=work;
      end

