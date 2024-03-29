%```````````````collect data and tabulate````````````````````````
clear all;
close all;
clc
data1=csvread('ex1data1.txt');
X=data1(:,1);
Y=data1(:,2);
m=length(Y);

%```````````````````````plot data``````````````````````````````````

figure;
plot(X,Y,'rx', 'MarkerSize', 10);
xlabel('population in 10000s');
ylabel('profits in $10,000s');
fprintf('program paused. Press space to continue. \n')
pause;

%```````````````````````gradient descent``````````````````````````

X=[ones(m,1), data1(:,1)];
theta=zeros(2,1);
predictions=X*theta;
alpha=0.01;
iterations=1000;
theta=gradientdescent(X,Y, theta, alpha, iterations);

%`````````````````````compute cost```````````````````````````````

predictions=X*theta;
J=(1/(2*m))*sum((predictions-Y).^2);
fprintf('theta1=%f and theta2=%f \n', theta(1), theta(2))
fprintf('the cost at these values of theta is %f \n', J)
fprintf('program paused. Press space to continue. \n')
pause;

%if J is greater than some value than again iterate for few more time

if J>1
    iterations=3500;
    theta=gradientdescent(X,Y, theta, alpha, iterations);
end
predictions=X*theta;
J=(1/(2*m))*sum((predictions-Y).^2);

%``````````````````printing the values of parameters and cost``````

fprintf('theta1=%f and theta2=%f \n', theta(1), theta(2))
fprintf('the cost at these values of theta is %f \n', J)
fprintf('program paused. Press space to continue. \n')
pause;
hold on;
plot(X(:,2), X*theta, '-');
hold off;
fprintf('program paused. Press space to continue. \n')
pause;

%````````````````````````visualizing J```````````````````````````

theta0_vals=linspace(-10,10,100);
theta1_vals=linspace(-1,4,100);
J_vals = zeros(length(theta0_vals), length(theta1_vals));
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
      predictions=X*t;
	  J_vals(i,j) = (1/(2*m))*sum((predictions-Y).^2);
    end
end
J_vals = J_vals';

% ```````````````````````Surface plot``````````````````````````

figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); 
ylabel('\theta_1');
fprintf('program paused. Press space to continue. \n')
pause;

% `````````````````````````Contour plot```````````````````````

figure;
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); 
ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);


