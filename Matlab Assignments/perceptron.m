function predictions = predict(W1,W2, X)

% Your code goes here.
%For the hidden layer
z = X * W1;
hidden_y = 1.0 ./ (1.0 + exp(-z));

%Compute linear model on value of hidden_y
predictions = hidden_y * W2


end

% The above function will implement feedforward propagation  Coursera Course