inputAudioFile = "music_water-pump.wav";
    f1 = "traffic.mp3";
    f2 = "Pressure-cooker_noise.wav";
    f3 = "ceiling_fan.wav";
    f4 = "pumping-water-ref.mp3";
    
    [y,~] = loadAudioFile(inputAudioFile);
    [y1,~] = loadAudioFile(f1);
    [y2,~] = loadAudioFile(f2);
    [y3,~] = loadAudioFile(f3);
    [y4,~] = loadAudioFile(f4);


noiseType = classifyNoise(y,y1,y2,y3,y4);
disp(['The detected noise type is: ' noiseType]);