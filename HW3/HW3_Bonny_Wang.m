%% ECE-210B HW3
%   Bonny(Yue) Wang

    clc
    clear
    close all
%% Q1
    A = ones(100,100);
    B = ones(100,100);
    C = ones(100,100);
    
    i = 1:100;
    j = 1:100;    
    [J,I] = meshgrid(j,i);
    
    ConditionA1 = sqrt((I-25).^2+(J-75).^2) < 10;
    ConditionA2 = sqrt((I-75).^2+(J-25).^2) < 10;
    nAConditions = find(ConditionA1|ConditionA2);
    A(ConditionA1|ConditionA2) = 0;
    
    ConditionB1 = sqrt((I-25).^2+(J-25).^2) < 10;
    ConditionB2 = sqrt((I-75).^2+(J-75).^2) < 10;
    nBConditions = find(ConditionB1|ConditionB2);
    B(nBConditions) = 0;
    
    ConditionC1 = sqrt((I-50).^2+(J-50).^2) > 10;
    nCConditions = find(ConditionC1);
    
    C(nCConditions) = 0;
    
    C_Complement = ~C;
    
    figure(1);
    imshow(C_Complement);
    
    figure(2);
    imshow(A);
    
    figure(3);
    imshow(A&C_Complement);
    
    figure(4);
    imshow(B&A);
    
    figure(5);
    imshow(B&A&C_Complement);
 %% Q2
 
    TestMatrix = sin(linspace(0,5,100))+1;
    [val,ind] = findClosest(TestMatrix,3/2);
    
 %% Q3
    test_X = linspace(-3,3,10000);
    TestFunctionQ3 = test_X.^5 -8*test_X.^3+10*test_X+6;
    [pE,pI] = CN_Function(test_X,TestFunctionQ3);
    