function a=sbcxnn4(a)
	global  nx p_left

 a(nx,:,:)=a(nx-1,:,:);
 a(1,:,:)=p_left;% pei fix-fix 


