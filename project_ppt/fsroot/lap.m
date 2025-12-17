function [x, n] = lap(g, a, b, error)
% Kiểm tra đạo hàm của g có q < 1 trong đoạn [a, b]
    if g(a) > 1 || g(b) > 1
        uialert(app.UIFigure, ['g(x) = q > 1, không hội tụ! Vui lòng nhập lại hàm g(x) ' ...
                    'hoặc khoảng phân ly [a, b] khác'], 'Lỗi');
        x = NaN; n = 0; return;
    end

    n = 1;
    %x0 = (a+b)/2;
    x0 = a;
    max_in = 1000;
    while n < max_in
        x = g(x0);

        % Kiểm tra sai số
        if abs(x - x0) < error
            return;
        end
                
        n = n + 1;
        x0 = x;
    end
    x = x0; % Nếu vượt quá x bằng giá trị của số lần lặp tối đa
    uialert(app.UIFigure, 'Đã hết số lần lặp tối đa mà chưa đạt sai số mong muốn.', 'Cảnh báo');
end