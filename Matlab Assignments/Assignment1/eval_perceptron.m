function [mistakes0, mistakes1] =  eval_perceptron(neg_examples, pos_examples, w)
%% 
% Evaluates the perceptron using a given weight vector. Here, evaluation
% refers to finding the data points that the perceptron incorrectly classifies.
% Inputs:
%   neg_examples - The num_neg_examples x 3 matrix for the examples with target 0.
%       num_neg_examples is the number of examples for the negative class.
%   pos_examples- The num_pos_examples x 3 matrix for the examples with target 1.
%       num_pos_examples is the number of examples for the positive class.
%   w - A 3-dimensional weight vector, the last element is the bias.
% Returns:
%   mistakes0 - A vector containing the indices of the negative examples that have been
%       incorrectly classified as positive.
%   mistakes0 - A vector containing the indices of the positive examples that have been
%       incorrectly classified as negative.
%%
num_neg_examples = size(neg_examples,1);
num_pos_examples = size(pos_examples,1);
mistakes0 = [];
mistakes1 = [];
for i=1:num_neg_examples
    x = neg_examples(i,:)';
    activation = x'*w;
    if (activation >= 0)
        mistakes0 = [mistakes0;i];
    end
end
for i=1:num_pos_examples
    x = pos_examples(i,:)';
    activation = x'*w;
    if (activation < 0)
        mistakes1 = [mistakes1;i];
    end
end

