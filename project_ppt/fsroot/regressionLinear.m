function [a1, a0, y_fit, eqn] = regressionLinear(x, y)
% Hồi quy tuyến tính y = a1*x + a0

    n = length(x);

    sumx  = sum(x);
    sumy  = sum(y);
    sumxy = sum(x .* y);
    sumx2 = sum(x .^ 2);

    a1 = (n*sumxy - sumx*sumy) / (n*sumx2 - sumx^2);
    a0 = (sumy - a1*sumx) / n;

    y_fit = a1*x + a0;
    eqn = sprintf('y = %.4f·x + %.4f', a1, a0);

end
