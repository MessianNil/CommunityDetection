function clusterKmeans(X, k)
%CLUSTERKMEANS Peform k-means Clustering on X to partition the data points
% into k clusters on Graph G

%% Using Squared Euclidean distance
% [cls_indcs, C] = kmeans(X, k, 'Display', 'iter', 'MaxIter', 500, 'Replicates', 5);
[cls_indcs, ~] = kmeans(X, k, 'Display', 'final', 'MaxIter', 500, 'Replicates', 5);
cls_nums = unique(cls_indcs);
disp('..............................');
disp('Using Squared Euclidean distance as a measure of dissimilarity ...');
for i=1:length(cls_nums)
    fprintf('Cluster # %d :', cls_nums(i));
    vertices = find(cls_indcs == cls_nums(i));
    fprintf('\nVertices belonging to it : \n');
    disp(vertices);
end
% Histogram Plot of Clusters and No. of vertices in each Cluster
histogram(cls_indcs);
pause;
close;
% if k == 2
%     visualizeClusters(X, cls_indcs, C, cls_nums);
% end
disp('..............................');

%% Using Manhattan distance
[cls_indcs, ~] = kmeans(X, k, 'Display', 'final', 'Distance', 'cityblock', 'MaxIter', 500, 'Replicates', 5);
cls_nums = unique(cls_indcs);
disp('..............................');
disp('Using Manhattan distance as a measure of dissimilarity ...');
for i=1:length(cls_nums)
    fprintf('Cluster # %d :', cls_nums(i));
    vertices = find(cls_indcs == cls_nums(i));
    fprintf('\nVertices belonging to it : \n');
    disp(vertices);
end
% Histogram Plot of Clusters and No. of vertices in each Cluster
histogram(cls_indcs);
pause;
close;
disp('..............................');

%% Using Cosine Similarity measure distance
[cls_indcs, ~] = kmeans(X, k, 'Display', 'final', 'Distance', 'cosine', 'MaxIter', 500, 'Replicates', 5);
cls_nums = unique(cls_indcs);
disp('..............................');
disp('Using Cosine Similarity as a measure of distance ...');
for i=1:length(cls_nums)
    fprintf('Cluster # %d :', cls_nums(i));
    vertices = find(cls_indcs == cls_nums(i));
    fprintf('\nVertices belonging to it : \n');
    disp(vertices);
end
% Histogram Plot of Clusters and No. of vertices in each Cluster
histogram(cls_indcs);
pause;
close;
disp('..............................');

end
