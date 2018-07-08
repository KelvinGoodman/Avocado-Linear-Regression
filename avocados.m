fprintf('Eating Avocados ...\n');
fprintf('Loading Data ...\n');
pkg load io;
data = xlsread('avocadoData.xlsx', 'Sheet1', 'B2:T38');

%Shuffle training data order
data = data(randperm(size(data,1)),:);

%Calculate X and y
X = data(:,[1:4,6:16]); %remove 5th feature
y = data(:,size(data, 2));
m = length(y);

%Convert day of year into a continuous function
X(:,2) = continuousDayOfYear(X(:,2));

%TODO: Normalize X
X = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];

%X into XTrain and XValidate
splitPoint = round(m * 2/3);
%disp("Splitpoint: ");
%disp(splitPoint);
XTrain = X(1:splitPoint, :);
XVal = X((splitPoint + 1):m, :);
yTrain = y(1:splitPoint, :);
yVal = y((splitPoint + 1):m, :);
%disp(XTrain);
%disp(yTrain);

% Choose some alpha value
alpha = 0.01;
num_iters = 100000;

% Init Theta and Run Gradient Descent 
theta = zeros(columns(XTrain), 1);
[theta, J_history] = gradientDescent(XTrain, yTrain, theta, alpha, num_iters);

printf('J training data: %f \n', costFunction(XTrain, yTrain, theta));
printf('J validation data: %f \n', costFunction(XVal, yVal, theta));