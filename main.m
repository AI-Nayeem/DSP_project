[b]=select_filter_type('bpf',10000,0,0,500,6000,2000,3000,25);
[window_type,m]=select_window(0.0194,50)
[num,h_win,w_win]=filter_coefficients(b,window_type,m);

num

figure(1)
subplot(311)
plot(w_win,20*log10(abs(h_win)))
grid;
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
subplot(312)
plot(w_win, 180*angle(h_win)/pi);grid;
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
subplot(313), 
plot(w_win,180*unwrap(angle(h_win))/pi);grid;
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');


figure(2)
subplot(1,1,1);
zplane(num,1);
title('Pole Zero plot(FIR Filter)');
grid on;





% Generate the input signal
fs=10000;
t = 0:1/fs:0.1;  % Time vector from 0 to 0.1 seconds
input_signal = exp(0.2*t) + sqrt(2)*cos(2*pi*70*t +40);
B=reshape(h_win.',1,[]); %change matrix to vector
% Filter the noisy signal using the FIR filter for the signal
noisy_signal = input_signal+sqrt(0.1)*randn(size(input_signal));
filtered_signal = filter(h_win,1,noisy_signal);
% Plot the original signal, noisy signal, and filtered signal for the signal

figure(3);
subplot(3, 1, 1);
plot(t, input_signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3, 1, 2);
plot(t, noisy_signal);
title('Noisy Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3, 1, 3);
plot(t, filtered_signal);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');