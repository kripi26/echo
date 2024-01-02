% File: plotSignal.m
function plotSignal(x, y, Fs)
    subplot(2, 1, 1);
    plot(x);
    title('Original Signal');
    
    subplot(2, 1, 2);
    plot(y);
    title('Echoed Signal');
end
