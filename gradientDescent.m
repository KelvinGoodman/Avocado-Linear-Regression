function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
  disp('Running gradient descent...');
  m = length(y); % number of training examples
  J_history = zeros(num_iters, 1);

  for iter = 1:num_iters
      theta = theta - ((alpha / m) * (X' * ((X * theta) - y)));   
      J_history(iter) = costFunction(X, y, theta);
  end
end