function a=sbcz3_phase(a)
	global nz ny nx phase c nx2

	nx0=nx2-1;
	ny0=ny-2;

	ko(1)=1;
	ko(2)=nz;
	ki(1)=nz-1;
	ki(2)=2;

	cr=zeros(nx0,ny0,2);
	for kc=1:2
	    k=ki(kc);
	    cr(1:nx0,1:ny0,kc)=a(2:nx0+1,2:ny0+1,k);
	end

	for kc=1:2
	    cr(:,:,kc)=fft(cr(:,:,kc),[],2);
	end

	cr(1:nx0,1:ny0,1)=cr(1:nx0,1:ny0,1).*exp(-c*phase(1:nx0,1:ny0));
	cr(1:nx0,1:ny0,2)=cr(1:nx0,1:ny0,2).*exp(c*phase(1:nx0,1:ny0));

	for kc=1:2
	    cr(:,:,kc)=ifft(cr(:,:,kc),[],2);
	end

	for kc=1:2
	    k=ko(kc);
	    a(2:nx0+1,2:ny0+1,k)=real(cr(1:nx0,1:ny0,kc));
	end
end
