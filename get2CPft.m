function [ ft , Ft] = get2CPft( b1, b2, b3, t1, t2, time, len )
%GETFT Summary of this function goes here
%   Detailed explanation goes here
for i = 1: len
    t=time(i,1);
    if (t <= t1)
        ft(i,1)=b1*b1*t*exp(-b1*t);
        Ft(i,1)=1-(1+b1*t)*exp(-b1*t);
    elseif (t > t1) && (t <= t2) 
        ft(i,1)=b2*(b1*t1+b2*t-b2*t1)*exp(-b1*t1-b2*(t-t1));
        Ft(i,1)=1-(1+b1*t1+b2*(t-t1))*exp(-b1*t1-b2*(t-t1));
    elseif (t > t2)
        ft(i,1)=b3*(b1*t1+b2*(t2-t1)+b3*(t - t2))*exp(-b1*t1-b2*(t2-t1)-b3*(t-t2));
        Ft(i,1)=1-(1+b1*t1+b2*(t2-t1)+b3*(t-t2))*exp(-b1*t1-b2*(t2-t1)-b3*(t-t2));
    end
end

