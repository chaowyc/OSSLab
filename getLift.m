function [ ft] = getLift( N, A, afa, time, len )
%GETFT Summary of this function goes here
%   Detailed explanation goes here
for i = 1: len
    tt=1+A*exp(-afa*time(i,1));
    ft(i,1)=A*N*afa*exp(-N/tt-afa*time(i,1))/(tt^2);
end