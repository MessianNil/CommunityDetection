function [A, node_id] = readGML(filename, orientation)
%READGML Processes a GML file and returns the Adjacency Matrix and the id
% of the vertices in the original Graph as vertex i has node_id at location
% i in the node_id vector
%
% e.g: A = readGML('karate.gml', 'undirected');
%
% Indranil Bhattacharya
% 26/11/2015

gmlS = gml2struct(filename);
[S, node_id] = gmlstruct2mat(gmlS.graph);
A = full(S);
n = size(A,1);
if strcmp(orientation,'undirected')
    for i=1:n
        for j=1:n
            if i == j
                continue
            end
            if A(i,j) == 1 || A(j,i) == 1
                A(i,j) = 1;
                A(j,i) = 1;
            end
        end
    end
end

end

