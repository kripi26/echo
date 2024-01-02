% Load the audio file
[x, fs] = audioread('q1.wav');

% Create an echo by adding a delayed version of the signal
% delay = round(0.1 * fs); % 100 ms delay
delay = round(0.8 * fs);
disp(delay)
d = [zeros(delay, 1); x(1:end - delay)];
delayed = d+x;

% Set parameters
mu = 0.001; % Step size
order = 10; % Filter order

% Apply echo cancellation
y = echo_cancellation(x, delayed, mu, order);

% Plot the results
t = (0:length(x)-1) / fs;

figure;
subplot(3,1,1); plot(t, x); title('Noisy Signal with Echo');
subplot(3,1,2); plot(t, delayed); title('Desired Signal (Original)');
subplot(3,1,3); plot(t, y); title('Echo-Cancelled Signal');

% Play the original and echo-cancelled signals
sound(x, fs);
pause(9);
soundsc(y, fs);
% soundsc(delayed,fs);
