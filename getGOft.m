function [ ft] = getGOft( b, time, len )
%GETFT Summary of this function goes here
%   Detailed explanation goes here
for i = 1: len
    ft(i,1)=b*exp(-b*time(i,1));
end