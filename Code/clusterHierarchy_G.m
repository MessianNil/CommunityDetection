function clusterHierarchy_G(A, n, k, cutoff, cutoffCriterion)
%CLUSTERHIERARCHY_G Perform Hierarchical Agglomerative Clustering on the
% Graph G based on Structural Equivalence given its Adjacency Matrix A

%% Structural Equivalence based on Adjacency Matrix
disp('..............................');
disp('Using Structural Equivalance as a measure of dissimilarity ...');
clusterHierarchy_G_A(A, n, k, cutoff, cutoffCriterion);

%Clear Screen
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all; clc;

%% Structural Equivalence based on Neighbourhood Overlap
disp('..............................');
disp('Using Neighbourhood Overlap as a measure of dissimilarity ...');
clusterHierarchy_G_N(A, n, k, cutoff, cutoffCriterion);

%Clear Screen
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all; clc;

%% Structural Equivalence based on Pearson Correlation
disp('..............................');
disp('Using Pearson Correlation as a measure of dissimilarity ...');
clusterHierarchy_G_P(A, n, k, cutoff, cutoffCriterion);

%Clear Screen
fprintf('Program Paused. Press Enter to Continue...\n');
pause;
close all; clc;

end