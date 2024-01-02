function [y,fs] = loadAudioFile(filename)
    [y,fs] = audioread(filename);
end