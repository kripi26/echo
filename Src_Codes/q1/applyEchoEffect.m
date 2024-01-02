% File: applyEchoEffect.m
function y = applyEchoEffect(x, impulse_response)
    y = conv(x, impulse_response);
    y = y / max(abs(y));
end
