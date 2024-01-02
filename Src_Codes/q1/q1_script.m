% File: mainScript.m
inputAudioFile = 'q1.wav'; % Replace with the actual filename

[x, Fs] = audioread(inputAudioFile);
% sound(x, Fs);
% x_mono = mean(x, 2);
% plot(x);

delay = 0.6; 
a = 0.6;

% Step 1: Generate Impulse Response
impulse_response = generateImpulseResponse(delay, a, Fs);

% Step 2: Apply Echo Effect
y = applyEchoEffect(x, impulse_response);

% Step 3: Plot Signal
plotSignal(x, y, Fs);

% Step 4: Play Sound
playSound(y, Fs);
