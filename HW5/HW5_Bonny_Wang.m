%% ECE-210B HW5
%   Bonny(Yue) Wang

    clc
    clear
    close all
%% 1
    load fisheriris
    
    Flowers = cell (150, 1);

    for (i = 1:150)
      Flowers{i} = Flower(meas(i,1),meas(i,2),meas(i,3),meas(i,4),char(strtrim(species(i))));
    end
    
    SWidth_30 = Flowers{30}.getSWidth();
    
    ifCorrect = (SWidth_30 == meas(30,3));
    
    Flowers{30}.report();
