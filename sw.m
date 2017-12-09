function sw(f,fi)
   global    wi w jpara pii pei balloon

   ptot=pei+pii;
   

   if (balloon<1) %interchange,2d
      cptot=curv(ptot);
   else
      ptotaltilde=sp0(ptot);
      cptot=curv(ptotaltilde);%balloon
   end

   fxy=convect(wi);
   dif2t=dif3(w);


   fxy = fxy - cptot - jpara - dif2t;
   work=w*f+wi*fi-fxy;

   if(f<0.6)
      w=wi;
      wi=work;
   else
      wi=work;
   end
end
