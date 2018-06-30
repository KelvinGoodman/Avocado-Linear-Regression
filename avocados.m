fprintf('Eating Avocados ...\n');
fprintf('Loading Data ...\n');
pkg load io;
data = xlsread('avocadoData.xlsx', 'Sheet1', 'B2:U25');

%excluding 15-17
X = data(:,1:14);
y = data(:,20);
m = length(y);

%Convert day of year into a continuous function
X(:,2) = continuousDayOfYear(X(:,2));
disp(X);

%TODO: Normalize X
X = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];

% Choose some alpha value
alpha = 0.01;
num_iters = 100000;

% Init Theta and Run Gradient Descent 
theta = zeros(columns(X), 1);
gradientDescent(X, y, theta, alpha, num_iters)