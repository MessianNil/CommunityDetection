function clusterHierarchy_G_A(A, n, k, cutoff, cutoffCriterion)
%CLUSTERHIERARCHY_G_A Perform Hierarchical Agglomerative Clustering on the
% Graph G based on Structural Equivalence given its Adjacency Matrix A

D = zeros(n);
% for i=1:n
%     for j=1:n
%         for k=1:n
%            if k == i || k == j
%                continue
%            else
%               D(i,j) = D(i,j) + (A(i,k)-A(j,k))^2;
%            end
%         end
%         D(i,j) = sqrt(D(i,j));
%     end
% end
for i=1:n
    for j=1:n
        D(i,j) = sqrt(sum((A(i,:)-A(j,:)).^2));
    end
end
disp('Using Single Linkage criterion ...');
linkageCluster(D, k, cutoff, 'single', cutoffCriterion);
disp('..............................');
disp('Using Complete Linkage criterion ...');
linkageCluster(D, k, cutoff, 'complete', cutoffCriterion);
disp('..............................');
disp('Using Average Linkage criterion ...');
linkageCluster(D, k, cutoff, 'average', cutoffCriterion);

end

