fprintf('Eating Avocados ...\n');
fprintf('Loading Data ...\n');
pkg load io;
data = xlsread('avocadoData.xlsx', 'Sheet1', 'B2:T64');

%Shuffle training data order
data = data(randperm(size(data,1)),:);

%Calculate X and y
X = data(:,[1:4,6:16]); %remove 5th feature (rough/smooth)
y = data(:,size(data, 2));
m = length(y);

%Convert day of year into a continuous function
X(:,2) = continuousDayOfYear(X(:,2));

%Normalize X
%X = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];

%Split X into XTrain and XValidate
splitPoint = round(m * 2/3);
XTrain = X(1:splitPoint, :);
XVal = X((splitPoint + 1):m, :);
yTrain = y(1:splitPoint, :);
yVal = y((splitPoint + 1):m, :);

% Choose some alpha value
alpha = 0.01;
num_iters = 10000;

% Init Theta and Run Gradient Descent 
theta = zeros(columns(XTrain), 1);
[theta, J_history] = gradientDescent(XTrain, yTrain, theta, alpha, num_iters);

printf('J all data if using mean of y as prediction: %f \n', costFunctionMean(y));
printf('J training data: %f \n', costFunction(XTrain, yTrain, theta));
printf('J validation data: %f \n\n\n', costFunction(XVal, yVal, theta));

% train with all data for use in API
thetaAPI = normalEquation(X, y);
fprintf('\n%f', thetaAPI);
%disp(thetaAPI);