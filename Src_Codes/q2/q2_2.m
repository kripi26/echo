[x, fs] = audioread('q2_easy.wav');
u = 0.01;
len = length(x);
y = zeros(1,len);
N = 32; 
w = ones(N,len);
d = zeros(1,len);
e = zeros(1,len);
for k = 1:len-N
    for m = 0:N-1
        if k>m 
            y(k) = y(k)+w(m+1,k)*x(k-m);
        
        end
        d(k+m+N/2) = x(k+m);
        % disp(d)
        e(k) = d(k) - y(k);
        w(m+1,k+1) = w(m+1,k) + 2*u*e(k)*x(k);
    end
end
disp(e)
% while mean(e)>0.5
for k = 1:len-N
    for m = 0:N-1
        if k>m 
            y(k) = y(k)+w(m+1,k)*x(k-m);
        
        end
        d(k+m+N/2) = x(k+m);
        % disp(d)
        e(k) = d(k) - y(k);
        w(m+1,k+1) = w(m+1,k) + 2*u*e(k)*x(k);
    end
    
end
for q = 1:len
    d(q) = y(q);
end



% end
plot(x);
figure
plot(y);
% plot(e)
% disp(e)