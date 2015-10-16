function [data, len] = getData(filename)
data = importdata(filename);
len = length(data);
