function [X_norm, mu, sigma] = featureNormalize(X)
  disp('Normalizing features...');
  X_norm = X;
  mu = zeros(1, size(X, 2));
  sigma = zeros(1, size(X, 2));

  for i = 1 : size(X, 2)
    mu(i) = mean(X(:,i));
    X_norm(:,i) = X(:,i) - mu(i);
    
    sigma(i) = std(X(:,i));
    X_norm(:,i) = X_norm(:,i) / sigma(i);
  endfor
end