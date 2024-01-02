function noiseType = classifyNoise(y,y1,y2,y3,y4)
    
    
    minLen = min(length(y), length(y1));
    % if length(y)<length(y1)
    %     y1 = y1(length(y1)-minLen:length(y1));
    %     ytemp = y(1:minLen);
    % else
    y1 = y1(1:minLen);
    ytemp = y(1:minLen);
    % end
    lags = -minLen+1:minLen-1;
    crossCorr = xcorr(ytemp, y1);
    maximum = max(crossCorr);
    noiseType = "Traffic";
    
    figure;
    plot(lags, crossCorr);
    title('Cross-Correlation with Traffic');
    xlabel('Lag');
    ylabel('Cross-Correlation');

    minLen = min(length(y), length(y2));
    y2 = y2(1:minLen);
    ytemp = y(1:minLen);
    lags = -minLen+1:minLen-1;
    crossCorr = xcorr(ytemp, y2);
    if maximum<max(crossCorr)
        maximum = max(crossCorr);
        noiseType = "Pressure Cooker";
    end

    figure;
    plot(lags, crossCorr);
    title('Cross-Correlation with Pressure Cooker');
    xlabel('Lag');
    ylabel('Cross-Correlation');

    minLen = min(length(y), length(y3));
    y3 = y3(1:minLen);
    ytemp = y(1:minLen);
    lags = -minLen+1:minLen-1;
    crossCorr = xcorr(ytemp, y3);
    if maximum<max(crossCorr)
        maximum = max(crossCorr);
        noiseType = "Ceiling fan";
    end
    
    figure;
    plot(lags, crossCorr);
    title('Cross-Correlation with Ceiling fan');
    xlabel('Lag');
    ylabel('Cross-Correlation');

    minLen = min(length(y), length(y4));
    y4 = y4(1:minLen);
    ytemp = y(1:minLen);
    lags = -minLen+1:minLen-1;
    crossCorr = xcorr(ytemp, y4);
    maximum = max(crossCorr);
    if maximum<max(crossCorr)
        maximum = max(crossCorr);
        noiseType = "Water pump";
    end

    figure;
    plot(lags, crossCorr);
    title('Cross-Correlation Water Pump');
    xlabel('Lag');
    ylabel('Cross-Correlation');
end