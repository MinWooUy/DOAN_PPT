function [x,n] = newton_raphson(fx, a, b, error)
% Tính đạo hàm
    try
        syms x;
        f_sym = str2sym(fx);

        df_sym = diff(f_sym, x);
        ddf_sym = diff(df_sym, x);

        % Chuyển về hàm số
        F = matlabFunction(f_sym);%disp(F);
        dF = matlabFunction(df_sym);%disp(dF);
        ddF = matlabFunction(ddf_sym);%disp(ddF);
    catch
        uialert(app.UIFigure, 'Lỗi cú pháp phương trình!', 'Lỗi');
        x = NaN; n = 0; return;
    end
            
    % Xét điều kiện hội tụ
    if double(dF(a))*double(dF(b)) < 0
        uialert(app.UIFigure, 'Đạo hàm cấp 1 của hàm số đổi dấu trên khoảng [a, b]. Không hội tụ.', 'Không thỏa điều kiện');
    elseif double(ddF(a))*double(ddF(b)) < 0
        uialert(app.UIFigure, 'Đạo hàm cấp 2 của hàm số đổi dấu trên khoảng [a, b]. Không hội tụ.', 'Không thỏa điều kiện');
    end
            
    if double(F(a))*double(ddF(a)) > 0
        x0 = a;
    else 
        x0 = b;
    end

    %x0 = (a + b)/2;
    n = 0;
    max_in = 1000;
    while n < max_in
        n = n + 1;
        x1 = x0 - double(F(x0))/double(dF(x0));
        if abs(x1 - x0) < error
            x = x1;
            return;
        end
        x0 = x1;
    end
    x = x1;  % Nếu vượt quá số lần lặp tối đa
    uialert(app.UIFigure, 'Đã hết số lần lặp tối đa mà chưa đạt sai số mong muốn.', 'Cảnh báo');
end