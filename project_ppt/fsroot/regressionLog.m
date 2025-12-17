function [a, b, y_fit, eqn] = regressionLog(x, y)
% Hồi quy logarit y = a*ln(x) + b

    if any(x <= 0)
        error('x phải > 0');
    end

    X = log(x);
    n = length(x);

    sumX  = sum(X);
    sumy  = sum(y);
    sumXy = sum(X .* y);
    sumX2 = sum(X .^ 2);

    a = (n*sumXy - sumX*sumy) / (n*sumX2 - sumX^2);
    b = (sumy - a*sumX) / n;

    y_fit = a*log(x) + b;
    eqn = sprintf('y = %.4f·ln(x) + %.4f', a, b);

end
