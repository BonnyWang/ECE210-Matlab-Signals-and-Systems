%% ECE-210B HW7
%   Bonny(Yue) Wang

    clc
    clear
    close all
%% Q1
    t = 0:0.001:2;
    f = 1:50000;
    
    signal = sum(sin(2*pi.*f'.*t));
%% Q2
    %filterDesigner;
    
    myFunction(filter1,100000,'Butterworth Lowpass Filter', signal);
    
%% 3
    %filterDesigner;
    
    myFunction(filter2,100000,'Chebyshev I Highpass Filter', signal);
%% 4
    %filterDesigner;
    
    myFunction(filter3,100000,'Chebyshev II Bandstop Filter', signal);
%% 5
    %filterDesigner;
    
    myFunction(filter4,100000,'Elliptic Bandpass Filter ', signal);
%% Function

    function myFunction(myFilter, Fs, FilterName, signal)
        a = myFilter;
    
        [H,f] = freqz(a,1024,Fs);
    
        magnitude_DB = 20*log10(abs(H));
        phase_Degree = rad2deg(unwrap(angle(H)));
    
        figure;
        subplot(2,1,1);
        plot(f,magnitude_DB);
        xlabel("Frequency (Hertz)");
        xlim([0 Fs/2]);
        xticks([0 Fs/4 Fs/2]);
        xticklabels({'0', Fs/4, Fs/2});
        ylabel('|H|(dB)');
        title(strcat('Magnitude Response(',FilterName,')'));
        subplot(2,1,2);
        plot(f,phase_Degree);
        xlabel("Frequency (Hertz)");
        xlim([0 Fs/2]);
        xticks([0 Fs/4 Fs/2]);
        xticklabels({'0', Fs/4, Fs/2});
        ylabel('|H|(dB)');
        title(strcat('Phase Response(',FilterName,')'));
    
        y = filter(a.Numerator,a.Denominator,signal);
    
        N= 2^15;
        S = fft(y,N); 
        S = fftshift(abs(S))/N;
    
        F = 100000.*(-N/2:N/2-1)/N;
    
        figure
        plot(F,S);
        title(append('Fourier Transform of the Signal After Applying the ',FilterName));
        xlabel('Frequency (Hz)')
        ylabel('Magnitude')
    end
    