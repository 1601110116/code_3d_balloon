function a=sbcxnn3(a)
	global  nx n_right n_left

%for k=2:nz-1
%	a(1,:,k)=mean(a(2,:,k),2);
	%a(nx,:,k)=mean(a(nx-1,:,k),2);
	% a(nx,:,k)=1;	% pei free-fix end
   
%end
 %a(1,:,:)=a(2,:,:);
 a(nx,:,:)=n_right;	
 a(1,:,:)=n_left;% pei fix-fix 


