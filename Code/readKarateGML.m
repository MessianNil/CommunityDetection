function A = readKarateGML(fileName)
%READKARATEGML Reads a GML file and returns the Adjacency Matrix
% Representation of a Graph

fID = fopen(fileName);
E = []; % m*2 edge matrix, each row is an edge
l = 0;
k = 1;
while 1
    % Get a line from the input file
    tline = fgetl(fID);
    % Quit if end of file
    if ~ischar(tline)
        break
    end
    nums = regexp(tline, '\d+', 'match'); %get number from string
    if ~isempty(nums)
        if l==1
            l=0;
            E(k,2) = str2num(nums{1});
            k = k+1;
            continue;
        end
        E(k,1) = str2num(nums{1});
        l = 1;
    else
        l = 0;
        continue;
    end
end
% No. of vertices in the graph
n = size(union(E(:,1), E(:,2)), 1);
A = zeros(n);
for i=1:length(E)
    A(E(i,1), E(i,2)) = 1;
    A(E(i,2), E(i,1)) = 1;
end
fclose(fID);

end
