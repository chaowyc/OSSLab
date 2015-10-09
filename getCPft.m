function [ ft ,Ft] = getCPft( b1, b2, t1, time, len )
%GETFT Summary of this function goes here
%   Detailed explanation goes here
for i = 1: len
    t=time(i,1);
    if (t <= t1)
        ft(i,1)=b1 * b1 * t *exp(-b1*t);
        Ft(i,1)=1-(1 + b1*t)*exp(-b1*t);
    elseif (t > t1)
        ft(i,1)=b2*exp(-b1*t1-b2*(t-t1)) + b1 * b2 * t1 * exp(-b1*t1-b2*(t-t1));
        Ft(i,1)=1-(1 + b1 * t1)*exp(-b1*t1-b2*(t-t1));
    end
end


