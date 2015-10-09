function [  ] = DrawU( Nt, Ft, model, l ,k)
%DRAWU Summary of this function goes here
%   Detailed explanation goes here
for i = 1:l
    y(i,1)=Nt(i,1)*1.0/Nt(l,1);
    x(i,1)=Ft(i,1);
end
figure;
plot(x,y,'r-',y,y,'b-');
title([model,'-',num2str(k),'-Uͼ']);

end

