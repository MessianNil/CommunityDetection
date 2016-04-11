function linkageCluster(D, k, cutoff, linkCriterion, cutoffCriterion)
%LINKAGECLUSTER Perform Hierarchical Clustering based on distance metric
% and linkage criterion

% Using Linkage Criterion for mesauring Similarity during merging Clusters
Z = linkage(D, linkCriterion);
figure;
dendrogram(Z, 0, 'ColorThreshold', 'default');
pause;
close;
% Create Clusters based on criterion and cutoff values
if strcmp(cutoffCriterion, 'inconsistent')
    cls_indcs = cluster(Z, 'cutoff', cutoff, 'criterion', cutoffCriterion);
elseif strcmp(cutoffCriterion, 'distance')
    cls_indcs = cluster(Z, 'maxclust', k, 'criterion', cutoffCriterion);
end
cls_nums = unique(cls_indcs);
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

end

