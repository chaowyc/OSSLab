function [Ft] = getFt(data, a1, a2, b1, b2, t, len)
for i = 1 : len
    if i <= t
        Ft(i, 1) = exp(-a1 * exp(-b1 * data(i, 1)) * (data(i + 1, 1) - data(i, 1)));
    else
        Ft(i, 1) = exp(-a2 * exp(-b2 * data(i, 1)) * (data(i + 1, 1) - data(i, 1)));
    end
end
