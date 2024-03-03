function [window_type,M ]= select_window(passband_ripple, stopband_attenuation)
f_stop=500;
f_pass=2000;
fs=10000;
    if (passband_ripple >= 0.7416) && (stopband_attenuation > 0 && stopband_attenuation <= 21)
        % Rectangular window
        N = 0.9*fs/ abs(f_stop-f_pass);
        N=check_digit(0,N);
        M = (N - 1) / 2;
        window_type=1;
    elseif (passband_ripple >= 0.0546) && (stopband_attenuation > 21 && stopband_attenuation <= 44)
        % Hanning window
        N = 3.1*fs/ abs(f_stop-f_pass);
        N=check_digit(0,N);
        M = (N - 1) / 2;
        window_type=2;
    elseif (passband_ripple >= 0.0194) && (stopband_attenuation > 44 && stopband_attenuation <= 53)
        % Hamming window
        N = 3.3*fs/ abs(f_stop-f_pass);
        N=check_digit(0,N);
        M = (N - 1) / 2;
        window_type=3;
    elseif (passband_ripple >= 0.0017) && (stopband_attenuation > 53 && stopband_attenuation <= 74)
        % Blackman window
       N = 5.5*fs/ abs(f_stop-f_pass)
       N=check_digit(0,N);
        M = (N - 1) / 2;
        window_type=4;
    else
         disp('error');
    end
end

function x = check_digit(m,n)
k = round(max(m,n));
if mod(k,2)==0
x = k+1;
else
x = k;
end
end



