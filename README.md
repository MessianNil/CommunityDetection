# CommunityDetection
Comparative Analysis of Data Clustering and Hierarchical Agglomerative Clustering algorithms for identifying the connected components in a graph

# Brief statement of the problem : 
Given a Graph G=(V,E),(V= Set of Nodes, E= Set of Edges), parition G into components i.e. subset of nodes, such that each subset is strongly interconnected with comparatively fewer edges across subsets.
I have worked on a relaxation of the problem where I want to find a fixed number (say k) of connected components in G.
In this context, I have done a comparative analysis of 2 classical algorithms - 
(a) Spectral Clustering of Graphs with Normalized Laplacian
(b) Hierarchical Agglomerative Clustering of Graphs
Algorithm (a) basically does a metric embedding of the graph into a K-dimensional subspace and run any standard data clustering algorithm(e.g K-means clustering) to identify the clusters in that subspace, and the nodes corresponding to those data points in each cluster are infact the nodes belonging to the same component in the original graph.
Algorithm (b) also does a metric embedding of the graph into a K-dimensional subspace and then keep on merging clusters which are highly "similar" into one larger cluster. The procedure is bottom-up and keeps on running until all data points are merged into a giant cluster. There are some popular notions of "similarity" measure that one can adopt to cluster points.

# Datasets analyzed :
(a) Figure 1 of Fortunato's Paper & Figure 9 of the same paper
(b) Planted l-partition model of a Graph
(c) Zachary's karate club, a standard benchmark in community detection
(d) Collaboration network between scientists working at the Santa Fe Institute

# Goal : 
I wanted to study the behavior of these 2 algorithms on some benchmark datasets and find out on which set of graphs their outcome/performance will be same and on which other set their outcome/performance differs.

# References : 
(1) Fortunato, Santo. "Community detection in graphs." Physics Reports 486.3 (2010): 75-174.

