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
C = [ 0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigma = [ 0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
k = 1;
for i = 1:length(C)
    for j = 1:length(sigma)
        model= svmTrain(X, y, C(i), @(x1, x2) gaussianKernel(x1, x2, sigma(j)));
        predictions = svmPredict(model, Xval);
        pred(k) = mean(double(predictions ~= yval));
        k = k+1 ;
    end
end
[a , b] = min(pred);

i = mod(b,length(C));
if(i == 0)
    i = 8;
end
 j = floor(b/length(C));
 j = j+1;
 C = C(j);
 sigma = sigma(i);




% =========================================================================

end
