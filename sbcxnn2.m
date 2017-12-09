function a=sbcxnn2(a)
	global  nx p_right p_left

%for k=2:nz-1
%	a(1,:,k)=mean(a(2,:,k),2);
	%a(nx,:,k)=mean(a(nx-1,:,k),2);
	% a(nx,:,k)=1;	% pei free-fix end
   
%end
 %a(1,:,:)=a(2,:,:);
 a(nx,:,:)=p_right;	
 a(1,:,:)=p_left;% pei fix-fix 


