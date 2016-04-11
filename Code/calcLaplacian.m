function L_norm = calcLaplacian(A, n)
%CALCLAPLACIAN Computes the Normalized Laplacian Matrix L_norm of a Graph
% given its adjacency Matrix A only

% Degreee Matrix, D, n*n matrix whose ith diagonal entry represents
% degree of a vertex v_i
D = zeros(n);
for i=1:n
    D(i,i)= sum(A(i, :));
end
% Laplacian Matrix, L
L = D - A;
% Normalized Laplacian Matrix, L_norm
% L_norm = inv(D)*L;
L_norm = pinv(D)*L;
% L_norm = D \ L;

end

