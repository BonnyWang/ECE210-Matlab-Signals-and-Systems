function v_Switched = signSwitch(v)
    v_Compare = [v(1) v(1:end)];
    v(length(v)+1) = v(end);
    detector = v.*v_Compare;
    v_Switched = find(detector<0);
end

