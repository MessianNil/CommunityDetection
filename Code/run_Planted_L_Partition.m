clear; close all; clc;
%% Graph 3 : Computer Generated Graph built using the Planted l-partition model
% Community detection in graphs - Santo Fortunato
% Girvan and Newman considered a special case of the planted l-partition
% model with n=g*l vertices, g = 32 and l = 4 i.e. 4 groups of 32 vertices
% each
% No. of Groups
l = 4;
% No. of vertices in each Group
g = 32;
% No. of vertices in G
n = g*l;
% Data points (node permutation)
x = randperm(n);
x = x';
% Groups (clusters) g*l, each column is a group
G = zeros(g,l);
grp = 0;
for i=1:l
    st = grp*g + 1;
    fin = g*i;
    G(:,i) = x(st:fin);
    grp = grp + 1;
end
% Probability of intra-cluster edges, pin
pin = 15/31;
% Probability of inter-cluster edges, pout
pout = 1/96;
% Fill up the Adjacency Matrix using this planted l-partition model
A = zeros(n);
for i=1:l
    grp_i = G(:,i);
    for j=1:l
        if i == j
            A(grp_i, grp_i) = rand(g, g) < pin;
        else
           grp_j = G(:,j);
           A(grp_i, grp_j) = rand(g, g) < pout;
        end
    end
end
% Extract Upper-triangular part above the main diagonal
A = triu(A, 1);
% Making A symmetric
A = A + A';
% Computes the Normalized Laplacian of the Graph
L_norm = calcLaplacian(A, n);
% Calculate the EigenValues and EigenVectors and order them in ascending
% order of EigenValues
[srtEigVec, srtEigVal] = compEigens(L_norm);
% No. of Clusters, k
k = l;
% Matrix X, of k-smallest EigenVectors
% Each row of X represents a data point in R^k dim Euclidean Space
% Interpret each row as a node/vertex in the Original Graph
X = srtEigVec(:, 1:k);

% Visualize the Sparsity Pattern of A
spy(A);
title('Adjacency Matrix of the Planted l-parition Graph');
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

%Clear Screen
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all; clc;

disp('Results for Planted l-partition Benchmark Graph ...');
% Cluster X into k clusters using K-means
disp('Peforming k-means Clustering on X ...');
clusterKmeans(X, k);

%Clear Screen
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all;clc;

disp('Results for Planted l-partition Benchmark Graph ...');
% Hierarchical Agglomerative Clustering on X
disp('Peforming Hierarchical Agglomerative Clustering on X ...');
% Cutoff value for Clustering
cutoff = 0.5;
% Cutoff Criterion for Clustering : 'distance' / 'inconsistent'
cutoffCriterion = 'distance';
clusterHierarchy_X(X, k, cutoff, cutoffCriterion);

%Clear Screen
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all; clc;

disp('Results for Planted l-partition Benchmark Graph ...');
% Hierarchical Agglomerative Clustering on Graph G based on Structural
% Equivalence
disp('Peforming Hierarchical Agglomerative Clustering on Graph G based on Structural Equivalence ...');
% Cutoff value for Clustering
cutoff = 0.5;
% Cutoff Criterion for Clustering : 'distance' / 'inconsistent'
cutoffCriterion = 'distance';
clusterHierarchy_G(A, n, k, cutoff, cutoffCriterion);

% Clear temporary variables
clearvars grp grp_i grp_j st fin x i j srtVec indx;
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all; clc;