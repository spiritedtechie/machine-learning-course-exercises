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
sigma = 0.1;

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

%{
params = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30 ];
params_length = size(params, 2)

lowest_error = 100000;

for i = 1:params_length
 for j = 1:params_length

   C_it = params(:, i);
   sigma_it = params(:, j);

   fprintf('*** Training SVM using C:%f and sigma:%f.\n', C_it, sigma_it);
   model = svmTrain(X, y, C_it, @(x1, x2) gaussianKernel(x1, x2, sigma_it));

   predictions = svmPredict(model, Xval);

   error = mean(double(predictions ~= yval));
   fprintf('Calculated error: %f.\n\n', error);

   if error < lowest_error
    C = C_it;
    sigma = sigma_it;
    lowest_error = error;
   end
 end
end
%}

fprintf(['Found parameters C: %f and sigma: %f.\n\n'], C, sigma);

% =========================================================================

end
