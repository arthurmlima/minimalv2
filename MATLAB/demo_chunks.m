function [chunk1, chunk2, chunk3]=demo_chunks(k)
% DEMO_CHUNKS  Generate chunk1/chunk2/chunk3 like the Python code and print them.
%
% Usage:
%   demo_chunks(8)

    chunk1 = chunk_to_cell_of_triples(generate_chunk1_arrays(k));
    chunk2 = chunk_to_cell_of_triples(generate_chunk2_arrays(k));
    chunk3 = chunk_to_cell_of_triples(generate_chunk3_arrays(k, generate_chunk2_arrays(k)));

end


% -------------------------------------------------------------------------
% Chunk 1 (d = 1)
% -------------------------------------------------------------------------
function chunk1 = generate_chunk1_arrays(k)
    C = 2*k - 2;
    chunk1 = cell(1, C);

    % Python: chunk1_array[0] = []
    if C >= 1
        chunk1{1} = [];
    end

    % Python: for cl in range(1, C):
    for cl = 1:(C-1)
        col = zeros(0,3,'uint32');

        if cl <= (k-1)
            base_i = k - cl;
            base_j = k;
        else
            base_i = 1;
            base_j = 2*k - 1 - cl;
        end

        for n = 0:(k-1)
            i = base_i + n;
            j = base_j - n;

            if i >= j
                break;
            else
                col(end+1,:) = uint32([1, i, j]); %#ok<AGROW>
            end
        end

        chunk1{cl+1} = col;  % MATLAB index cl+1 corresponds to Python cl
    end
end

% -------------------------------------------------------------------------
% Chunk 2 (d = 2)
% -------------------------------------------------------------------------
function chunk2 = generate_chunk2_arrays(k)
    C = 2*k - 2;
    chunk2 = cell(1, C);

    % Python placeholders:
    % chunk2_array[0], [1], [2], [3] = [], [], [], []
    for cl = 0:min(3, C-1)
        chunk2{cl+1} = [];
    end

    % Python: for cl in range(4, C):
    for cl = 4:(C-1)
        col = zeros(0,3,'uint32');

        if cl <= k
            base_i = k - cl + 1;
            base_j = k;
        else
            base_i = 1;
            base_j = 2*k - cl;
        end

        for n = 0:(k-1)
            i = base_i + n;
            j = base_j - n;

            if i >= j
                break;
            else
                col(end+1,:) = uint32([2, i, j]); %#ok<AGROW>
            end
        end

        chunk2{cl+1} = col;
    end

    % Ensure any unset cells are empty
    for idx = 1:C
        if isempty(chunk2{idx})
            chunk2{idx} = [];
        end
    end
end

% -------------------------------------------------------------------------
% Chunk 3 (d > 2)
% -------------------------------------------------------------------------
function chunk3 = generate_chunk3_arrays(k, chunk2)
    C = 2*k - 2;
    chunk3 = cell(1, C);

    % Python: for i in range(min(7,C)): chunk3_array[i] = []
    for idx = 1:min(7, C)
        chunk3{idx} = [];
    end

    % Python uses an internal "col" list to reference previous chunk3 col
    col_internal = cell(1, C);
    for idx = 1:C
        col_internal{idx} = [];
    end

    % used_tuples set: store keys like "d_i_j"
    used = containers.Map('KeyType','char','ValueType','logical');

    % Python: for cl in range(7, C):
    for cl = 7:(C-1)
        % Python: prev2 = chunk2_array[cl-1]
        prev2 = chunk2{(cl-1)+1};       % MATLAB index = (cl-1)+1 = cl
        % Python: prev3 = col[cl-1]
        prev3 = col_internal{(cl-1)+1}; % MATLAB index = cl

        target = size(prev2,1) + size(prev3,1) - 2;
        if target <= 0
            col_internal{cl+1} = [];
            chunk3{cl+1} = [];
            continue;
        end

        combined = [prev2; prev3];  % iterate like itertools.chain(prev2, prev3)
        new_entries = zeros(0,3,'uint32');

        for r = 1:size(combined,1)
            d = double(combined(r,1));
            i = double(combined(r,2));
            j = double(combined(r,3));

            keyTrip = [d+1, i, j];
            if j > i
                keyStr = sprintf('%d_%d_%d', keyTrip(1), keyTrip(2), keyTrip(3));
                if ~isKey(used, keyStr)
                    used(keyStr) = true;
                    new_entries(end+1,:) = uint32(keyTrip); %#ok<AGROW>
                    if size(new_entries,1) == target
                        break;
                    end
                end
            end
        end

        col_internal{cl+1} = new_entries;
        chunk3{cl+1} = new_entries;
    end

    % Ensure any unset cells are empty
    for idx = 1:C
        if isempty(chunk3{idx})
            chunk3{idx} = [];
        end
    end
end