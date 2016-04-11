function clusterHierarchy_G_N(A, n, k, cutoff, cutoffCriterion)
%CLUSTERHIERARCHY_G_N Perform Hierarchical Agglomerative Clustering on the
% Graph G based on Neighbourhood Overlap given its Adjacency Matrix A

D = zeros(n);
for i=1:n
    for j=1:n
        N_i_intersect_N_j = A(i, :) & A(j, :);
        N_i_union_N_j = A(i, :) | A(j, :);
        D(i,j) = sum(N_i_intersect_N_j) / sum(N_i_union_N_j);
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

