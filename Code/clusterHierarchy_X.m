function clusterHierarchy_X(X, k, cutoff, cutoffCriterion)
%CLUSTERHIERARCHY_X Perform Hierarchical Agglomerative Clustering on the data
% points X which is obtained after doing a metric embedding of Graph in R^k

%% Using Squared Euclidean distance
disp('..............................');
disp('Using Squared Euclidean distance as a measure of dissimilarity ...');
D = pdist(X, 'euclidean');
D = squareform(D);
disp('Using Single Linkage criterion ...');
linkageCluster(D, k, cutoff, 'single', cutoffCriterion);
disp('..............................');
disp('Using Complete Linkage criterion ...');
linkageCluster(D, k, cutoff, 'complete', cutoffCriterion);
disp('..............................');
disp('Using Average Linkage criterion ...');
linkageCluster(D, k, cutoff, 'average', cutoffCriterion);

%% Using Manhattan distance
disp('..............................');
disp('Using Manhattan distance as a measure of dissimilarity ...');
D = pdist(X, 'cityblock');
D = squareform(D);
disp('Using Single Linkage criterion ...');
linkageCluster(D, k, cutoff, 'single', cutoffCriterion);
disp('..............................');
disp('Using Complete Linkage criterion ...');
linkageCluster(D, k, cutoff, 'complete', cutoffCriterion);
disp('..............................');
disp('Using Average Linkage criterion ...');
linkageCluster(D, k, cutoff, 'average', cutoffCriterion);

%% Using Cosine Similarity measure distance
disp('..............................');
disp('Using Cosine Similarity as a measure of distance ...');
D = pdist(X, 'cosine');
D = squareform(D);
disp('Using Single Linkage criterion ...');
linkageCluster(D, k, cutoff, 'single', cutoffCriterion);
disp('..............................');
disp('Using Complete Linkage criterion ...');
linkageCluster(D, k, cutoff, 'complete', cutoffCriterion);
disp('..............................');
disp('Using Average Linkage criterion ...');
linkageCluster(D, k, cutoff, 'average', cutoffCriterion);

end

