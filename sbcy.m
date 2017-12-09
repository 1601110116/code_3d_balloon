function a=sbcy(a)
	global  ny
	a(:,1,:)=a(:,ny-1,:);
	a(:,ny,:)=a(:,2,:);
end
