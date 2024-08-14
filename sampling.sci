f = 5;
t = 0:0.01:1;
sampling = 200;
quantization = 8;

y = sin(2 * %pi * f * t);

ts = 0:1/sampling:1;
ys = sin(2 * %pi * f * ts);

step = 2 / quantization;
yq = round(ys / step) * step;
yq_normalized = (yq + 1) / 2 * (quantization - 1);

yq_int = round(yq_normalized);

pcm_code = dec2bin(yq_int, log2(quantization_levels));

disp("PCM Code:");
disp(pcm_code);

subplot(4,1,1);
plot(t, y);
title('Continuous Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot2d3('gnn',ts, ys);
title('Sampled Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(ts, yq, 'g');
title('Quantized Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,4);
plot(ts, yq_int, 'facecolor', 'b');
title('PCM Encoded Signal');
xlabel('Time (s)');
ylabel('PCM Code');
