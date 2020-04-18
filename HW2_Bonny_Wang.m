%% ECE-210B HW2
%   Bonny(Yue) Wang

    clc
    clear
    close all
%% Q1
    V1 = linspace(0,pi,100);
    V2 = linspace(0,pi,1000);
    Y1 = sin(2*V1);
    Y2 = sin(2*V2);
    
    dY1 = diff(Y1)./diff(V1);
    dY2 = diff(Y2)./diff(V2);
    
    rdY1 = 2*cos(2*V1(1:end-1));
    rdY2 = 2*cos(2*V2(1:end-1));
    
    dDifference1 = dY1-rdY1;
    dDifference2 = dY2-rdY2;
    
    maxdDiff1 = max(dDifference1);
    maxdDiff2 = max(dDifference2);
    %Therefore, 1000 length produce better result

    csY1 = cumsum(Y1*(pi/100));
    csY2 = cumsum(Y2*(pi/1000));
    ctY1 = cumtrapz(Y1*(pi/100));
    ctY2 = cumtrapz(Y2*(pi/1000));
    
    csY1 = csY1-0.5;
    csY2 = csY2-0.5;
    ctY1 = ctY1-0.5;
    ctY2 = ctY2-0.5;
    
    riY1 = -cos(2*V1)/2;
    riY2 = -cos(2*V2)/2;
    
    iDifference1 = riY1 - csY1;
    iDifference2 = riY2 - csY2;
    iDifference3 = riY1 - ctY1;
    iDifference4 = riY2 - ctY2;
    
    maxiDiff1 = max(iDifference1);
    maxiDiff2 = max(iDifference2);
    maxiDiff3 = max(iDifference3);
    maxiDiff4 = max(iDifference4);
    %Therefore ctY2 is the best approximation
    
    figure;
    plot(V2,ctY2);
    title("Best Approximation of The Integral of sin(2x)");
    
%% Q2
    A = 1:100;
    A = reshape(A,10,10);
    
    A = flipud(A);
    
    A(3,:) = fliplr(A(3,:)); 
    
    rV = sum(A,1);
    
    cV = prod(A,2);
    
    A(6,:) = [];
    
%% 3
    
    %Without preallocation
    tic
    for i = 1:300
        for j = 1:500
            B1(i,j) = i^3+j^3/(i+j+2);
        end
    end
    toc
    
    %With preallocation
    B2 = zeros(300,500);
    tic
    for i = 1:300
        for j = 1:500
            B2(i,j) = i^3+j^3/(i+j+2);
        end
    end
    toc
    
    %Only matrix operation
    tic
    i = 1:300;
    j = 1:500;    
    [J,I] = meshgrid(j,i);
    B3 = I.^3+J.^3./(I+J+2);
    toc
