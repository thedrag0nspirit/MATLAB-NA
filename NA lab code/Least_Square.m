%Least Square 
clc;
clear all;

xvec = [1 2 3 4 5 6 7 8 9 10];
[~, n] = size(xvec);
yvec = [1.3 3.5 4.2 5.0 7.0 8.8 10.1 12.5 13.0 15.6];

degree = 6;
X = zeros(degree+1, n);
for i = 1:degree+1
    X(i, :) = xvec.^(i-1);
end

A = X * X';
b = X * yvec';
A = [A b];

x = Ge(A);  % Solving the system using Gaussian elimination (function not defined)

scatter(xvec, yvec)
hold on

x = flip(x);
poly2sym(x)  % Displaying the polynomial expression

Approx = polyval(x, xvec);  % Evaluating the polynomial at each xvec point
Error = sum((Approx - yvec).^2, 2);  % Calculating the squared error

plot(xvec, Approx)
hold off