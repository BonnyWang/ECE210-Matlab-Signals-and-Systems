%% ECE-210B HW4
%   Bonny(Yue) Wang

    clc
    clear
    close all
%% Q1
    randCompM1 = zeros(4,4);
    for i=  1:4
        for j = 1:4
            randCompM1(i,j) = rand + rand*1i;
        end
    end
   
    randCompM2 = zeros(4,4);
    for i=  1:4
         for j = 1:4
            randCompM2(i,j) = rand + rand*1i;
        end
    end
    
    randCompM3 = zeros(1,4);
    for i=  1:4
        randCompM3(i) = rand + rand*1i;
    end
    
    %same number of elements
    GSM1 = gramSchmidt(randCompM1);
    testOrthonormal = isOrthonormal(GSM1);
    complexProj1 = orthoProj(randCompM2, GSM1);
    
    %different number of elements
    complexProj2 = orthoProj(randCompM3, GSM1);
%% Q2

    x = linspace(0, 2*pi, 100);
    y = sin(x);
    u = [0, pi/2, pi, 3*pi/2, 2*pi];
    for i = 1:5
        for j = 1:100
            d(j, i) = (1/sqrt(2*pi))*exp(-(x(1,j)-u(i)).^(2));
        end
    end
    
    figure;
    plot(x, d);
    hold on
    plot(x, y);
    xticks(0: pi/4: 2*pi);
    xticklabels({'0','\pi/4','\pi/4','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/8','2\pi'});
    title('Sinusoid and Gaussians')

    GRd = gramSchmidt(d);
    PRd = orthoProj(y, GRd);
    PRd_Star = PRd.';

    figure
    subplot(2,1,1)
    plot(x,y)
    xticks(0: pi/4: 2*pi);
    xticklabels({'0','\pi/4','\pi/4','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/8','2\pi'});
    title('Sinusoid')

    subplot(2,1,2)
    plot(x,PRd_Star)
    xticks(0: pi/4: 2*pi);
    xticklabels({'0','\pi/4','\pi/4','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/8','2\pi'});
    title('Estimated')
%% Functions

    function [Output] = gramSchmidt(X)
        [m, n] = size(X);
        Output = zeros(m, n);
        temp = zeros(n, n);
        for i = 1:n
            v = X(:, i);
            for j = 1:(i-1)
                temp(j, i) = Output(:, j)'* X(:, i);
                v = v - temp(j, i) * Output(:, j);
            end
            temp(i, i) = norm(v);
            Output(:, i) = v / temp(i, i);
        end
    end
    
    
    function [Output] = isOrthonormal(X)
        [m, n] = size(X);
        Y = X.';
        for i = 1:n
            u = [1, m];
            for a = 1:m
                u(a) = Y(i, a);
            end
            if abs(norm(u) - 1) <=1000*eps
                %Output = true;
                for j = i+1:n
                    v = [1, m];
                    for a = 1:m
                        v(a) = Y(j, a);
                    end
                    if abs(dot(u, v) - 0) <= 1000*eps
                        Output = true;
                    else
                        Output = false;
                    end
                end
            else
                Output = false;
            end
        end
    end
    
    
    function output = orthoProj(v,X)
        V_Star = v.';
        output = zeros(size(X,1),1);

        for i = 1:size(X,2)
            proj = (V_Star.'*conj(X(:,i)))/(norm(X(:,i)))^2 .* X(:,i);
            output = output + proj;
        end
    end
    
