%% ECE-210B HW1
%   Bonny(Yue) Wang

    clc
    clear
    close all
%% Q1
    a = log10(26);
    b = 5*exp(j*2*pi/3);
    c = atan(sqrt(15))+34;
    d = sqrt(3)/2 + j/2;
    v1 = [a;b;c;d];
%% Q2
    btC = b*c;
    rbtC = real(btC);
    ibtC = imag(btC);
    mbtC = abs(btC);
    abtC = angle(btC);
    v2 = [rbtC, ibtC, mbtC, abtC];
%% Q3
    m1 = v1*v2;
    m2 = repmat((v1.') .* v2, 4 ,1);
%% Q4
    mAdd = m1 + 2*m2;
    mMult = m1 .* m2;
    m1Sub = m1 - 2;
    m1ConTrans = m1';
%% Q5
    n = rad2deg(abtC);
    v3 = linspace(1,n,2000);
    v4 = 1:0.3:n;