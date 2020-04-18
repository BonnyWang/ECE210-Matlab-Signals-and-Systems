function [local_Extrema,point_Inflection] = CN_Function(X,Y)
    fDF = diff(Y)./diff(X);
    local_Extrema = signSwitch(fDF);

    sDF = diff(fDF)./diff(X(1:(end-1)));
    point_Inflection = signSwitch(sDF);

    figure;
    plot(X,Y,X(local_Extrema),Y(local_Extrema),'ko',X(point_Inflection),Y(point_Inflection),'r*');
end
