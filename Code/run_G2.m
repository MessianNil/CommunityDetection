clear; close all; clc;
%% Graph 2 : Figure 9 (Page 17) from Fortunato's Survey Paper
% Community detection in graphs - Santo Fortunato
% Adjacency Matrix, A, 14*14 matrix
% 14 nodes and 50 edges, vertices labelled from 1 to 14 in the figure
v1 = [0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0];
v2 = [1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0];
v3 = [1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0];
v4 = [0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0];
v5 = [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
v6 = [1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0];
v7 = [0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0];
v8 = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1];
v9 = [0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0];
v10 = [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1];
v11 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1];
v12 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1];
v13 = [0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1];
v14 = [0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0];
A = [v1; v2; v3; v4; v5; v6; v7; v8; v9; v10; v11; v12; v13; v14];
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

% Visualize the Sparsity Pattern of A
spy(A);
title('Adjacency Matrix of Graph 2');
pause;
close;
% Plot the k^th smallest Eigen Vector
plot(srtEigVec(:,k), '.-');
title(sprintf('%d^{th} smallest Eigen Vector',k));
pause;
close;
% Sort the K^th smallest Eigen Vector and plot it
[srtVec, indx] = sort(srtEigVec(:, k));
plot(srtVec, '.-');
title(sprintf('%d^{th} smallest Eigen Vector after being sorted',k));
pause;
close;
% Visualize the Sparsity Pattern of A, now to reveal Group Structure
spy(A(indx, indx));
title('Adjacency Matrix permuted to reveal Group Strcuture');

disp('Results for Graph 2 ...');
% Cluster X into k clusters using K-means
disp('Peforming k-means Clustering on X ...');
clusterKmeans(X, k);

%Clear Screen
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all; clc;

disp('Results for Graph 2 ...');
% Hierarchical Agglomerative Clustering on X
disp('Peforming Hierarchical Agglomerative Clustering on X ...');
% Cutoff value for Clustering
cutoff = 0.8;
% Cutoff Criterion for Clustering : 'distance' / 'inconsistent'
cutoffCriterion = 'distance';
clusterHierarchy_X(X, k, cutoff, cutoffCriterion);

%Clear Screen
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all; clc;

disp('Results for Graph 2 ...');
% Hierarchical Agglomerative Clustering on Graph G based on Structural
% Equivalence
disp('Peforming Hierarchical Agglomerative Clustering on Graph G based on Structural Equivalence ...');
% Cutoff value for Clustering
cutoff = 0.8;
% Cutoff Criterion for Clustering : 'distance' / 'inconsistent'
cutoffCriterion = 'distance';
clusterHierarchy_G(A, n, k, cutoff, cutoffCriterion);

% Clear temporary variables
clearvars v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 n;
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
clear; close all; clc;
