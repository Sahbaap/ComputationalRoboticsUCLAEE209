function value_error = calculate_V_diff(V1,V2)

    err = 0;
    for idx_v = 1:1:size(V1,2)
        err = err + (V1{idx_v}-V2{idx_v})*(V1{idx_v}-V2{idx_v});
    end

    value_error = sqrt(err/size(V1,2));
end