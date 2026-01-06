clear all;
clc
[a,b,c]=demo_chunks(8);
M=merge_cells_append_multi(a,b,c);

vhdlFileName = 'example.vhd';
K = 8; % Define the number of bits for the std_logic_vector

% Open the file for writing
fileID = fopen(vhdlFileName, 'w');

% Check if the file opened successfully
if fileID == -1
    error('Failed to open the file for writing.');
end

% Write VHDL code to the file
fprintf(fileID, 'library ieee;\n');
fprintf(fileID, 'use ieee.std_logic_1164.ALL;\n\n');
fprintf(fileID, 'entity example is\n');
fprintf(fileID, '    Port ( a     : in std_logic_vector(%d downto 0);\n', K-1);
fprintf(fileID, '           a_out : out std_logic_vector(%d downto 0));\n',K-1);
fprintf(fileID, 'end example;\n\n');
fprintf(fileID, 'architecture Behavioral of example is\n');
fprintf(fileID, 'begin\n');




for x = 0:K-1
    for y = x+1:K-1
        fprintf(fileID,'signal s_1_%d_%d : std_logic;\n', x+1, y+1);
    end
end



[R, C] = size(M);
for i = 1:C                      % loop columns
    for j = 1:R                  % loop rows within column (top -> bottom)

        v = M{j,i};

        % break column if null/empty
        if isempty(v)
            break;
        end

        % safety check (optional)
        if numel(v) ~= 3
            error("M{%d,%d} must be a 1x3 triple.", j, i);
        end

        d = v(1);
        x = v(2);
        y = v(3);

        if d == 1
            % -------- Rule for [1,x,y] ----------
            % <<< put your rule here >>>
            % Example:
            fprintf(fileID,'    s_%d_%d_%d <= a(%d) xor (not a(%d));\n\n',  d, x, y, x, y );
        
        elseif d >= 2
            %fprintf(fileID,'    s_%d_%d_%d <= (s_%d_%d_%d) and ( ',  d, x, y,  d-1, x, y);
            va=[d-1 x y];
            [find_col, find_row] = find_prev_in_col_Cminus1(M, i-1, va);
            fprintf(fileID,'\n    s_%d_%d_%d <= ', d, x, y);
            idx=0;
            while (find_row + idx <= R) && ~isempty(M{find_row + idx, find_col})
            o=M{find_row+idx,find_col};
            if idx==0 
                if isempty(M{find_row+idx+1,find_col}) %|| find_row+idx+1<R
                    fprintf(fileID,' (s_%d_%d_%d) and ((s_%d_%d_%d));\n ', o(1), o(2), o(3), o(1), o(2), o(3));                 
                else 
                    fprintf(fileID,' (s_%d_%d_%d) and ((s_%d_%d_%d) xor', o(1), o(2), o(3), o(1), o(2), o(3));
                end
            elseif find_row+idx+1==R+1
            fprintf(fileID,' (s_%d_%d_%d));\n', o(1), o(2), o(3)); 

            elseif idx>0 && ((isempty(M{find_row+idx+1,find_col}))) %|| (find_row+idx+1==R+1))
             fprintf(fileID,' (s_%d_%d_%d)); \n', o(1), o(2), o(3));
            elseif idx>0 && ((~isempty(M{find_row+idx+1,find_col}))|| (find_row+idx+1<=R))  
            fprintf(fileID,' (s_%d_%d_%d) xor', o(1), o(2), o(3)); 
            elseif idx>0 && ((~isempty(M{find_row+idx+1,find_col})) && (find_row+idx+1>R+1))  
            fprintf(fileID,' (s_%d_%d_%d);\n', o(1), o(2), o(3)); 
            end
            idx=idx+1;
      
        end
        end
    end
end



for Colum_indx=(2*K-2):-1:K-1
    fprintf(fileID, '    s_(%d)<= ',Colum_indx);
    n_not_empty = nnz(~cellfun(@isempty, M(:, Colum_indx)));
    for Row_indx=(1:n_not_empty)
        o = M{Row_indx,Colum_indx};
        if Row_indx==1
                if isempty(M{Row_indx+1,Colum_indx}) %|| Row_indx+1<R
                    fprintf(fileID,' ((s_%d_%d_%d));\n ', o(1), o(2), o(3));                 
                else 
                    fprintf(fileID,'((s_%d_%d_%d) xor', o(1), o(2), o(3));
                end
            elseif Row_indx+1==R+1
                fprintf(fileID,' (s_%d_%d_%d));\n', o(1), o(2), o(3)); 
            elseif Row_indx>1 && ((isempty(M{Row_indx+1,Colum_indx}))) %|| (Row_indx+1==R+1))
                fprintf(fileID,' (s_%d_%d_%d)); \n', o(1), o(2), o(3));
            elseif Row_indx>1 && ((~isempty(M{Row_indx+1,Colum_indx}))|| (Row_indx+1<=R))  
                fprintf(fileID,' (s_%d_%d_%d) xor', o(1), o(2), o(3)); 
            elseif Row_indx>1 && ((~isempty(M{Row_indx+1,Colum_indx})) && (Row_indx+1>R+1))  
                fprintf(fileID,' (s_%d_%d_%d);\n', o(1), o(2), o(3)); 
       end
    end
end




fprintf(fileID, 'end Behavioral;\n');
fclose(fileID);

