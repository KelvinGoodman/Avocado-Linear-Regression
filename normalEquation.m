function [theta] = gradientDescent(X, y)
  disp('Calculating theta with normal equation...');
  theta = (pinv(X'*X))*X'*y;
end