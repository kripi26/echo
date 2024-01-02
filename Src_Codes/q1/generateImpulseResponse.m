% File: generateImpulseResponse.m
function impulse_response = generateImpulseResponse(delay, a, Fs)
    D = round(delay * Fs); 
    impulse_response = [];
    current_amplitude = 1;
    
    while current_amplitude > 0.1 
        t_impulse = (0:length(impulse_response) + D - 1) / Fs; 
        current_impulse = a.^t_impulse;
        impulse_response = [impulse_response, zeros(1, D), current_amplitude * current_impulse];
        current_amplitude = current_amplitude * a;
    end
end
