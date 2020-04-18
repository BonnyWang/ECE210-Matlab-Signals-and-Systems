%% ECE-210B HW6
%   Bonny(Yue) Wang

    clc
    clear
    close all
%% Q1
    Denominator = [1/3, 0, -1/8, 3/2];
    Numerator = [0, 2/5, 1/4, 1/7];
    
    transfer_Function = tf(Numerator,Denominator);
    
    Poles = pole(transfer_Function); 
    Zeros = zero(transfer_Function);
    
    figure;
    zplane(Numerator,Denominator);
    title('$$H_1(z)=\frac{\frac{2}{5}z^2+\frac{1}{4}z+\frac{1}{7}}{\frac{1}{3}z^3-\frac{1}{8}z+\frac{3}{2}}$$','interpreter','latex')
    
    Impulse_response = impz(Numerator,Denominator,50);
    figure;
    impz(Numerator,Denominator,50);
    
    n = 0:49;
    x = (-4/5).^n;
    
    figure;
    subplot(2,1,1);
    y1 = filter(Numerator,Denominator,x);
    stem(y1);
    title("Signal After the Filter");
    xlabel("n(Samples)")
    ylabel("Amplitude")
    subplot(2,1,2);
    impz(Numerator,Denominator,50);
    
    figure;
    subplot(2,1,1);
    y2 = conv(Impulse_response,x);
    stem(y2(1:50));
    title("Signal After the Convolution");
    xlabel("n(Samples)")
    ylabel("Amplitude")
    subplot(2,1,2);
    impz(Numerator,Denominator,50);
%% 2
    zer = [-1,1]'; 
    pol = [0.9*exp(j*pi/2),0.9*exp(j*-pi/2),0.95*exp(j*5*pi/12),0.95*exp(j*-5*pi/12),0.95*exp(j*7*pi/12),0.95*exp(j*-7*pi/12)]';
    figure;
    zplane(zer,pol);
    title('Pole-zero Plot of Known Poles and Zeros')
    
    k = 0.01;
    
    [Num,Den] = zp2tf(zer,pol,k);
    
    [H,w] = freqz(Num,Den,1024);
    
    magnitude_DB = 20*log10(abs(H));
    phase_Degree = rad2deg(unwrap(angle(H)));
    
    figure;
    subplot(2,1,1);
    plot(w,magnitude_DB);
    xlabel("Frequency (rad)");
    xlim([0 pi]);
    xticks([0 pi/2 pi]);
    xticklabels({'0', '\pi/2', '\pi'});
    ylabel('|H|(dB)');
    title('Magnitude Response')
    subplot(2,1,2);
    plot(w,phase_Degree);
    xlabel("Frequency (rad)");
    xlim([0 pi]);
    xticks([0 pi/2 pi]);
    xticklabels({'0', '\pi/2', '\pi'});
    ylabel('Phase(deg)');
    title('Phase Response');
    
    