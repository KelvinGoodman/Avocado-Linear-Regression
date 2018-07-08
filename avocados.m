fprintf('Eating Avocados ...\n');
fprintf('Loading Data ...\n');
pkg load io;
data = xlsread('avocadoData.xlsx', 'Sheet1', 'B2:T38');

%Load data
X = data(:,[1:4,6:16]); %remove 5th feature
y = data(:,size(data, 2));
m = length(y);

%Convert day of year into a continuous function
X(:,2) = continuousDayOfYear(X(:,2));

%TODO: Normalize X
X = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];

%Shuffle training data orderfields
XShuffled = X(randperm(size(X,1)),:);

%X into XTrain and XValidate

% Choose some alpha value
alpha = 0.01;
num_iters = 100000;

% Init Theta and Run Gradient Descent 
theta = zeros(columns(X), 1);
gradientDescent(X, y, theta, alpha, num_iters)