function [a, b, y_fit, eqn] = regressionPower(x, y)
% Hồi quy hàm mũ y = a*x^b

    if any(x <= 0) || any(y <= 0)
        error('x và y phải > 0');
    end

    X = log10(x);
    Y = log10(y);
    n = length(x);

    sumX  = sum(X);
    sumY  = sum(Y);
    sumXY = sum(X .* Y);
    sumX2 = sum(X .^ 2);

    b  = (n*sumXY - sumX*sumY) / (n*sumX2 - sumX^2);
    a0 = (sumY - b*sumX) / n;
    a  = 10^a0;

    y_fit = a * x.^b;
    eqn = sprintf('y = %.4f·x^{%.4f}', a, b);

end
