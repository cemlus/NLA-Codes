clear all
clc
p = [-4 -1 0 2 5];          % initialised known x-values
f = [1245 33 5 9 1355];          % initialised their known y-values (f(y))
x = 9;                          % the x-value at which the function is to be interpolated
n = 5;                       % number of data points (total number of coordinates)
d = zeros(n,n);              % a matrix to store divided differences
for i = 1:n                  
    d(i,1) = f(i);            % the first column is filled with the given y-values (f(x)) of the corresponding x values
end

% this nested loop calculates the higher-order divided differences, which are used in Newton’s interpolation
for j = 2:n                 % starts from second order cuz 1st column has f(x)'s values
    for i = 1:(n-j+1)          % computes each divided difference for the given order
        d(i,j) = (d(i+1,j-1) - d(i,j-1)) / (p(i+j-1) - p(i));                
        % d(i,j) is the divided difference starting from the i-th point
    end
end
disp(d);
a = 1;        %initialised for the cumalated product term of (pi)
s = d(1,1);    % The interpolated value, initialized with the 0th-order term d(1,1), which is the first y-value.

% this loop evaluates => f(x)=d(1,1)+(x−p1)d(1,2)+....
for i = 2:n
    a = a * (x - p(i-1));        
    s = s + (a * d(1,i));
end
disp(s);
