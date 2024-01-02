[x, Fs] = audioread('q1_hard.wav');
% sound(x,Fs);
x_mono = mean(x,2);
% plot(x);
delay = 0.5; 
D = round(delay * Fs); 
a = 0.7;
impulse_response = [];
current_amplitude = 1;
while current_amplitude > 0.1 
    t_impulse = (0:length(impulse_response) + D - 1) / Fs; 
    current_impulse = a.^t_impulse;
    impulse_response = [impulse_response, zeros(1, D), current_amplitude * current_impulse];
    current_amplitude = current_amplitude * a;
    % disp(current_amplitude);
end

y= conv(x_mono, impulse_response);
% y= conv(x, impulse_response);
y = y / max(abs(y));

subplot(2, 1, 1);
plot(x);
title('Original Signal');

subplot(2, 1, 2);
plot(y);
title('Echoed Signal');

sound(y, Fs);
