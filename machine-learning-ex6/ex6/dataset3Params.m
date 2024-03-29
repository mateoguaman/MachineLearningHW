function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
C_opts = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigma_opts = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
combinations = zeros(length(C_opts), length(sigma_opts));
x1 = [1 2 1]; x2 = [0 4 -1];


for i = 1:length(C_opts)
   for j = 1:length(sigma_opts)
       model= svmTrain(X, y, C_opts(i), @(x1, x2) gaussianKernel(x1, x2, sigma_opts(j)));
       predictions = svmPredict(model, Xval);
       combinations(i, j) = mean(double(predictions ~= yval));
   end
end

min_val = min(min(combinations));
[C_index, sigma_index] = find(combinations == min_val);
C = C_opts(C_index);
sigma = sigma_opts(sigma_index);





% =========================================================================

end
