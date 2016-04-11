clear; close all; clc;
%% Graph : Zachary's karate club, a standard benchmark in community detection
% https://networkdata.ics.uci.edu/data.php?id=105
% http://www-personal.umich.edu/~mejn/netdata/karate.zip
addpath('../Datasets/ZKC');
% Adjacency Matrix, A, 34*34 matrix
% 34 nodes and 78 edges, vertices labelled from 1 to 34 in the figure
A = readKarateGML('karate.gml');
% A = readGML('karate.gml', 'undirected');
% No. of vertices
n = size(A, 1);
% Computes the Normalized Laplacian of the Graph
L_norm = calcLaplacian(A, n);
% Calculate the EigenValues and EigenVectors and order them in ascending
% order of EigenValues
[srtEigVec, srtEigVal] = compEigens(L_norm);
% No. of Clusters, k
k = 2;
% Matrix X, of k-smallest EigenVectors
% Each row of X represents a data point in R^k dim Euclidean Space
% Interpret each row as a node/vertex in the Original Graph
X = srtEigVec(:, 1:k);
disp('Results for Zachary''s karate club Graph ...');
% Cluster X into k clusters using K-means
disp('Peforming k-means Clustering on X ...');
clusterKmeans(X, k);

%Clear Screen
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all; clc;

disp('Results for Zachary''s karate club Graph ...');
% Hierarchical Agglomerative Clustering on X
disp('Peforming Hierarchical Agglomerative Clustering on X ...');
% Cutoff value for Clustering
cutoff = 0.2;
% Cutoff Criterion for Clustering : 'distance' / 'inconsistent'
cutoffCriterion = 'distance';
clusterHierarchy_X(X, k, cutoff, cutoffCriterion);

%Clear Screen
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all; clc;

disp('Results for Zachary''s karate club Graph ...');
% Hierarchical Agglomerative Clustering on Graph G based on Structural
% Equivalence
disp('Peforming Hierarchical Agglomerative Clustering on Graph G based on Structural Equivalence ...');
% Cutoff value for Clustering
cutoff = 0.2;
% Cutoff Criterion for Clustering : 'distance' / 'inconsistent'
cutoffCriterion = 'distance';
clusterHierarchy_G(A, n, k, cutoff, cutoffCriterion);

% Clear temporary variables
clearvars n;
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
clear; close all; clc;
