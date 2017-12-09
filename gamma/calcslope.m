function [ E ] = calcslope( X,dx )
%CALCSLOPE calculate slope of X
%   此处显示详细说明
s=size(X);
if s(1)==1
    s(1)=[];
else 
        s(2)=[];
end
E=zeros(1,s);
for i=1:s-1
    E(i)=(X(i+1)-X(i))/(2*dx);
end
plot(E)
