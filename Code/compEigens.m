function [sortedEigenVectors, sortedEigenValues ] = compEigens(L_norm)
%COMPEIGENS Computes the eigen values and corresponding eigen vectors of
% the matrix L_norm and returns the eigenvectors in ascending order of the
% corresponding eigen values

% Computes the eigenvalues and eigenvectors of L_norm
% [eigVectors, eigValMatrix] = eig(L_norm);
[eigVectors, eigValues] = eig(L_norm, 'vector');
% Sort the eigenValues and corresponding eigenVectors in ascending order
[sortedEigenValues, indx] = sort(eigValues);
sortedEigenVectors = eigVectors(:, indx);

end

