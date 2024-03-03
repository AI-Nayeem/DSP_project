function [num]=select_filter_type(filter_type,fs,lower_cutoff,upper_cutoff,stop_freq1,stop_freq2,pass_freq1,pass_freq2,n)

switch filter_type
    case 'lpf'
        M=(n-1)/2;
        fl=lower_cutoff;
        wl = 2*pi*fl/fs;
        num = [];
        for k = 0:1:M
        pos = k+M+1;
        if k == 0
        num(pos) = wl/pi;
        else
        num(pos) = (sin(k*wl)/(k*pi));
        new_pos = pos-(2*k);
        num(new_pos) = num(pos);
        end
        end
        %[hz,w]=freqz(num,[1],512,fs);
        
        
     case 'hpf'
        M=(n-1)/2;
        fh=upper_cutoff;
        wh = 2*pi*fh/fs;
        num = [];
        for k = 0:1:M
        pos = k+M+1;
        if k == 0
        num(pos) = (pi-wh)/pi;
        else
        num(pos) = -(sin(k*wh)/(k*pi));
        new_pos = pos-(2*k);
        num(new_pos) = num(pos);
        end
        end
        %[hz,w]=freqz(num,[1],512,fs);
      
      
     case 'bsf' 
         M=(n-1)/2;
         fl=lower_cutoff;
         fh=upper_cutoff;
         wl=2*pi*fl/fs;
         wh = 2*pi*fh/fs;
         num = []
         for k = 0:1:M
         pos = k+M+1;
         if k == 0
         num(pos) = pi-wh+wl/pi;
         else
         num(pos) = -(sin(k*wh)/(k*pi))+sin(k*wl)/(k*pi)
         new_pos = pos-(2*k)
         num(new_pos) = num(pos)
         end
         end
         %[hz,w]=freqz(num,[1],512,fs);
    
    case 'bpf'
        M=(n-1)/2;
        fl=(stop_freq1+pass_freq1)/2;
        fh=(stop_freq2+pass_freq2)/2;
        wl=2*pi*fl/fs;
        wh = 2*pi*fh/fs;
        num = [];
        for k = 0:1:M
        pos = k+M+1;
        if k == 0
        num(pos) = (wh-wl)/pi;
        else
        num(pos) = (sin(k*wh)/(k*pi))-sin(k*wl)/(k*pi);
        new_pos = pos-(2*k);
        num(new_pos) = num(pos);
        end
        end
        %[hz,w]=freqz(num,[1],512,fs);
     end
end

