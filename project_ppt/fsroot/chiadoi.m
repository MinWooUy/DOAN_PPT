function [x,n] = chiadoi(fx, a, b, error)
% Kiểm tra hàm số liên tục trong khoảng phân ly không
    if fx(a)*fx(b) >= 0
        uialert(app.UIFigure,['Hàm số không liên tục trong khoảng phân ly [a, b]. ' ...
                    'Vui lòng nhập lại [a, b] hoặc hàm số khác!'], 'lỗi');
        x = NaN; n = 0; return;
    end

    n = 1; % Số lần lặp
    max_in = 1000;
    while n < max_in
        x = (a + b)/2;

        if fx(x)*fx(b) > 0
            b = x;
        else 
            a = x;
        end

        if abs(b - a) < error
            return;
        end
        n = n + 1;
    end
    uialert(app.UIFigure, 'Đã hết số lần lặp tối đa mà chưa đạt sai số mong muốn.', 'Cảnh báo');
end