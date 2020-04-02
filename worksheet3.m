addpath('nethelp3')
addpath('netlab3')

load 'sparrows.dat';
load 'sparrows_labels.dat';
sparrows_dataset_dim = size(sparrows);
sparrows_label_dataset_dim = size(sparrows_labels);

% Normalised the dataset to zero means and unit standard deviation.
normilizing_sparrows = (sparrows - repmat(mean(sparrows), size(sparrows,1), 1)) ./ repmat(var(sparrows), size(sparrows,1), 1);

% Taking the covarience of the normilised matrix
covarienced_normilized_sparrows = cov(normilizing_sparrows);

% Finding the eigen value and the eigen vector of the covarienced
% normilised sparrow dataset
[corrosponding_eigenvector_sparrows, eigenvalue_matrix] = eig(covarienced_normilized_sparrows);

% Sorting the eigen values for applying PCA
[sorted_sparrow_eigenvector, Index] = sort(diag(eigenvalue_matrix), 'desc');
sorted_sparrow_eigenvalues_matrix = eigenvalue_matrix(Index, Index);

% Sorted eigen vectors for rotation part in PCA
sorted_sparrows_eigenvector = corrosponding_eigenvector_sparrows(:,Index);
disp(sorted_sparrows_eigenvector)

% Multiplication of the eigen vector and the dataset
sparrows_matrix_multiplication = normilizing_sparrows * sorted_sparrows_eigenvector;
disp(sparrows_matrix_multiplication);

 dataset_i = sparrows_matrix_multiplication(:,1);
 dataset_j = sparrows_matrix_multiplication(:,2);
 dataset_x = sparrows_matrix_multiplication(:,3);
 dataset_y = sparrows_matrix_multiplication(:,4);
 
 scatter(dataset_i,dataset_j, 'b')
 hold on
 scatter(dataset_x,dataset_y, 'k')
 hold off
 
% Using the direct PCA function to compare the results with manual pca
% implemented
pca_transformation = pca(normilizing_sparrows);
disp(pca_transformation)



