function clusterHierarchy_G_P(A, n, k, cutoff, cutoffCriterion)
%CLUSTERHIERARCHY_G_P Perform Hierarchical Agglomerative Clustering on the
% Graph G based on Pearson Correlation between columns of Adjacency Matrix
% A

D = zeros(n);
for i=1:n
    mu_i = mean(A(i, :));
    sigma_i = std(A(i, :), 1);
    for j=1:n
        mu_j = mean(A(j, :));
        sigma_j = std(A(j, :), 1);
        D(i,j) = sum((A(i,:)-mu_i).*(A(j,:)-mu_j)) / (n*sigma_i*sigma_j);
    end
end
% D is high for vertices in same cluster, but in computing distances D
% should ideally be small for intra-cluster vertices
D = 1 - D;
disp('Using Single Linkage criterion ...');
linkageCluster(D, k, cutoff, 'single', cutoffCriterion);
disp('..............................');
disp('Using Complete Linkage criterion ...');
linkageCluster(D, k, cutoff, 'complete', cutoffCriterion);
disp('..............................');
disp('Using Average Linkage criterion ...');
linkageCluster(D, k, cutoff, 'average', cutoffCriterion);

end

