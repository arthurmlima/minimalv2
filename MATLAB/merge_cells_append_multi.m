function M = merge_cells_append_multi(varargin)
%MERGE_CELLS_APPEND_MULTI Append multiple cell-matrices per column.
% Each input is an (R x C) cell matrix where each cell is either [] or a 1x3 triple.
% Output M has C columns and enough rows to hold all appended content per column.

    n = nargin;
    if n < 2
        error('Provide at least two matrices (e.g., A,B or A,B,C).');
    end

    % Validate column count matches
    C = size(varargin{1}, 2);
    for t = 2:n
        if size(varargin{t}, 2) ~= C
            error('All inputs must have the same number of columns.');
        end
    end

    % Count filled entries per column for each matrix
    counts = zeros(n, C);
    for t = 1:n
        X = varargin{t};
        for c = 1:C
            counts(t,c) = nnz(~cellfun(@isempty, X(:,c)));
        end
    end

    % Total rows needed is max over columns of (sum of counts in that column)
    R = max(sum(counts, 1));
    M = cell(R, C);

    % Build column by column: append all non-empty cells in order A then B then C...
    for c = 1:C
        pos = 1;
        for t = 1:n
            X = varargin{t};
            idx = find(~cellfun(@isempty, X(:,c)));  % keep original top-to-bottom order
            for k = 1:numel(idx)
                M{pos, c} = X{idx(k), c};
                pos = pos + 1;
            end
        end
    end
end
