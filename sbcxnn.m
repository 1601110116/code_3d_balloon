function a=sbcxnn(a)
	global nx

    a(1,:,:)=a(2,:,:);
    a(nx,:,:)=a(nx-1,:,:);
end
