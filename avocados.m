fprintf('Eating Avocados ...\n');
fprintf('Loading Data ...\n');
pkg load io;
data = xlsread('avocadoData.xlsx', 'Sheet1', 'B2:T25');

%excluding 14-16
X = data(:,1:13);
y = data(:,19);
m = length(y);

%TODO: Normalize X
X = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];

% Choose some alpha value
alpha = 0.01;
num_iters = 1000000;

% Init Theta and Run Gradient Descent 
theta = zeros(columns(X), 1);
gradientDescent(X, y, theta, alpha, num_iters)