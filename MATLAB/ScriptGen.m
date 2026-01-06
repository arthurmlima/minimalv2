










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
fprintf(fileID, '    Port ( a : in std_logic_vector(%d downto 0);\n', K-1);
fprintf(fileID, '           B : in std_logic;\n');
fprintf(fileID, '           Y : out std_logic);\n');
fprintf(fileID, 'end example;\n\n');
fprintf(fileID, 'architecture Behavioral of example is\n');
fprintf(fileID, 'begin\n');




for x = 0:K-1
    for y = x+1:K-1
        fprintf(fileID, 'signal s_1_%d_%d : std_logic;\n', x+1, y+1);
    end
end




for x = 0:K-1
    for y = x+1:K-1
        fprintf(fileID, '    s_1_%d_%d <= a(%d) xor (not a(%d));\n', x+1, y+1, x, y);
    end
end
fprintf(fileID, 'end Behavioral;\n');

% Close the file
fclose(fileID);

disp(['VHDL code written to ', vhdlFileName]);


% Inputs
k = 8; 
Cl=2*k-3;


idx = 0;
M = cell(0, 0);   % start with 0 rows

for cl = 1:Cl
    if (cl >= 0) && (cl <= k-1)
        M{1,(Cl+1-cl)}=[1 (k-cl) k];
    elseif (cl >= (k)) && (cl <= (2*k - 3))
        M{1,(Cl+1-cl)}=[1 1 (2*k-cl-1)];
    else
        error("cl=%d is outside the defined ranges.", cl);
    end
end
% 
% while M{j,i} diff null 
%     [a ax ay] = M{j,i}
%     if ax >= ay 
%         M{j+1,i} = [1 ax ay]
%     end
% 
% end


clear M

M = cell(1, Cl);   % 1 row, Cl columns

for cl = 1:Cl
    col = Cl + 1 - cl;   % your reversed column index

    if cl <= (k-1)
        M{1, col} = [1 (k-cl) k];
    elseif cl <= (2*k - 3)
        M{1, col} = [1 1 (2*k - cl - 1)];
    else
        error("cl=%d is outside the defined ranges.", cl);
    end
end

% --- Iterate for each column ---
for i = 1:Cl
    j = 1;

    while true
        % stop if cell doesn't exist yet, is empty, or is all zeros
        if j > size(M,1) || isempty(M{j,i}) || all(M{j,i} == 0)
            break
        end

        v = M{j,i};
        if numel(v) ~= 3
            error("M{%d,%d} must be a 1x3 vector.", j, i);
        end

        a  = v(1);
        ax = v(2);
        ay = v(3);

        if ax+1 < ay-1
            M{j+1,i} = [1 ax+1 ay-1];   % your rule (replace with your update if needed)
        else
            break   % stop this column if condition fails (optional, but usually makes sense)
        end

        j = j + 1;
    end
end