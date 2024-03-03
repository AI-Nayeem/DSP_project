function [num,h_win, w_win] = filter_coefficients(h,window_type,M)
n=25;
fs=10000;
    if window_type==1

        % Rectangular window
        w=[ones(size(h))];
        num=h.*w;
        [h_win,w_win]=freqz(num,[1],512,fs);
        
    elseif window_type==2
        % Hanning window
        w=[ones(size(h))];
        for k = 0:1:M
        pos = k+M+1;
        w(pos) = 0.5 + 0.5*cos(k*pi/M);
        new_pos = pos-(2*k);
        w(new_pos) = w(pos);
        end
        num= h.*w;
        [h_win, w_win] = freqz(num, [1], 512, fs);

    elseif window_type==3
        % Hamming window
        w=[ones(size(h))];
        for k=0:1:M
        pos=k+M+1;
        w(pos)=0.54+0.46*cos(k*pi/M);
        new_pos=pos-(2*k);
        w(new_pos)=w(pos);
        end
        num=h.*w;
        [h_win,w_win]=freqz(num,[1],512,fs);
    else
        % Blackman window
        w=[ones(size(h))];
        for k = 0:1:M
        pos = k+M+1;
        w(pos) = 0.42 + 0.5*cos(k*pi/M) + 0.08*cos(2*k*pi/M);
        new_pos = pos-(2*k);
        w(new_pos) = w(pos);
        end
        num = h.*w;
        [h_win, w_win] = freqz(num,[1],512,fs);


    end
    
    %w_win = linspace(0, fs/2, length(h_win));
end

