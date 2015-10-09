function [] = getPLR( model1, model2, ft1, ft2, len, f)
%%µÃPLR
y(1, 1) = log(ft1(1, 1))-log( ft2(1, 1));
for i = 2 : len
    tmp = log(ft1(1, 1))-log( ft2(1, 1));
    y(i, 1) = y(i - 1, 1) + tmp;
end

figure;
plot(y,'r-');
title(['PLR-',model1,'/',model2,'-',num2str(f)]);

end
