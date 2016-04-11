clear; close all; clc;
%% Graph : Collaboration network of 118 scientists at the Santa Fe Institute, 
% an interdisciplinary research center in Santa Fe, New Mexico, with the 
% largest component consisting of 118 scientists, a standard benchmark in community detection
% http://dsec.pku.edu.cn/~jliu/
% http://dsec.pku.edu.cn/~jliu/NetworkData/collaboration.zip
addpath('../Datasets/SFI');
% Adjacency Matrix, A, 118*118 matrix
% 118 nodes and 200 edges
A = readSFI('edge.d');
% No. of vertices
n = size(A, 1);
% Computes the Normalized Laplacian of the Graph
L_norm = calcLaplacian(A, n);
% Calculate the EigenValues and EigenVectors and order them in ascending
% order of EigenValues
[srtEigVec, srtEigVal] = compEigens(L_norm);
% No. of Clusters, k
k = 7;
% Matrix X, of k-smallest EigenVectors
% Each row of X represents a data point in R^k dim Euclidean Space
% Interpret each row as a node/vertex in the Original Graph
X = srtEigVec(:, 1:k);
disp('Results for SFI Scientists Collaboration Graph ...');
% Cluster X into k clusters using K-means
disp('Peforming k-means Clustering on X ...');
clusterKmeans(X, k);

%Clear Screen
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all; clc;

disp('Results for SFI Scientists Collaboration Graph ...');
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

disp('Results for SFI Scientists Collaboration Graph ...');
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
