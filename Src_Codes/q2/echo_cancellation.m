function y = echo_cancellation(x, d, mu, order)
    N = length(x);
    w = zeros(order, 1);
    y = zeros(N, 1);     
    
    for n = order:N
            x_n = d(n:-1:n-order+1); 
            y(n) = w' * x_n;         
        e = x(n) - y(n);         
        w = w + mu * e * x_n;    
    end
    % disp(mean(e));
    % Apply LMS algorithm
    while mean(e)>0.001
        for n = order:N
            x_n = x(n:-1:n-order+1); 
            y(n) = w' * x_n;         
            e = d(n) - y(n);         
            w = w + mu * e * x_n;    
        end
    end
end