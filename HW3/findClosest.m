function [val,ind] = findClosest(x,desiredValue)
    y = x(:);
    Difference = abs(y-desiredValue);
    valIndice = find(Difference == min(Difference));
    val = y(valIndice(1));
    ind = find(y == val,1);
end