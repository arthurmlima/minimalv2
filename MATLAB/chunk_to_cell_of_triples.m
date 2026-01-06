function M = chunk_to_cell_of_triples(chunk)
    % chunk: 1xC cell, each cell is Nx3 (or empty)
    C = numel(chunk);
    lens = zeros(1,C);
    for c = 1:C
        if ~isempty(chunk{c})
            lens(c) = size(chunk{c}, 1);
        end
    end
    R = max(lens);

    M = cell(R, C);   % empty cells default to []

    for c = 1:C
        col = chunk{c};
        if isempty(col), continue; end
        for r = 1:size(col,1)
            M{r,c} = col(r,:);     % store one 1x3 triple per cell
        end
    end
end