function h=sp0(f)
	global  nx ny nz
h=zeros(nx,ny,nz);
	%for k=1:nz
        
	for k=2:nz-1
        
		%f(:,:,k)=f(:,:,k)-repmat(mean(f(:,:,k),2),[1,ny]);
		h(2:nx-1,:,k)=f(2:nx-1,:,k)-repmat(mean(f(2:nx-1,:,k),2),[1,ny]);
	end

%h(2:nx-1,:,:)=mean(mean(h(2:nx-1,:,:),2),3);
%h(2:nx-1,:,:)=f(2:nx-1,:,:)-h(2:nx-1,:,:);