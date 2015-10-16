function [ ] = Uplot(Ft)
len = length(Ft);
y = [1 : len] ./ len;
x = Ft;
figure;
plot(x, y,'r-', y, y, 'b-');