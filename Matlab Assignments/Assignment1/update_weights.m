function [w] = update_weights(neg_examples, pos_examples, w_current)
%% 
% Updates the weights of the perceptron for incorrectly classified points
% using the perceptron update algorithm. This function makes one sweep
% over the dataset.
% Inputs:
%   neg_examples - The num_neg_examples x 3 matrix for the examples with target 0.
%       num_neg_examples is the number of examples for the negative class.
%   pos_examples- The num_pos_examples x 3 matrix for the examples with target 1.
%       num_pos_examples is the number of examples for the positive class.
%   w_current - A 3-dimensional weight vector, the last element is the bias.
% Returns:
%   w - The weight vector after one pass through the dataset using the perceptron
%       learning rule.
%%
w = w_current;
num_neg_examples = size(neg_examples,1);
num_pos_examples = size(pos_examples,1);
for i=1:num_neg_examples
    this_case = neg_examples(i,:);
    x = this_case'; %Hint
    activation = this_case*w;
    if (activation >= 0)
        %YOUR CODE HERE
		%If Activation is >= 1 that means you are working to target 0 from description
		learning_rate = 0.5
		target = 0
		w += learning_rate * (target - activation) * x
    end
end
for i=1:num_pos_examples
    this_case = pos_examples(i,:);
    x = this_case';
    activation = this_case*w;
    if (activation < 0)
        %YOUR CODE HERE
		%Here we are working to target 1
		learning_rate = 0.5
		target = 1
		w += learning_rate * (target - activation) * x
    end
end