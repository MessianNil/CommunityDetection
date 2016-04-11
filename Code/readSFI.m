function A = readSFI(filename)
%READSFI Reads a file and returns the Adjacency Matrix
% Representation of a Graph

fid = fopen(filename, 'r');
data = textscan(fid, '%d %d %f');
v1 = data{1,1};
v1 = v1(2:end);
v2 = data{1,2};
v2 = v2(2:end);
E = [v1 v2];
% No. of vertices in the graph
n = size(union(E(:,1), E(:,2)), 1);
A = zeros(n);
for i=1:length(E)
    A(E(i,1), E(i,2)) = 1;
    A(E(i,2), E(i,1)) = 1;
end
fclose(fid);

end

