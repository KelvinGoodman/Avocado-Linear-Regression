%J all data if using mean of y as prediction
function J = costFunctionMean(y)
  m = length(y);
  yAvg = mean(y);
  J = (1/(2*m)) * sum((yAvg - y).^2);
end