function [find_column, find_row] = find_prev_in_col_Cminus1(M, jd, target)

    [R, ~] = size(M);
    I=0;
    r=1;
    while r<=R
        v = M{r, jd};

        if numel(v) == 3 && isequal(v(:).', target)
            I = r;
        end
        r = r + 1; % Move to the next row
    end
    find_column=jd;
    find_row=I;
    return;
end
