clc;
clear;

% Initialization
k = 1;                % Iteration counter
tol = 0.0001;         % Tolerance level
N = 100;              % Maximum number of iterations
P = [1.2; 1.2];         % Initial guess (x0 and y0)
error = 1;            % Initial error

% Define the nonlinear equations and Jacobian matrix
f = @(x, y) [x^2 + y^2 - 1; 2*x^2 + 3*y^2 - 2];  % System of nonlinear equations f1 and f2
J = @(x, y) [2*x, 2*y; 4*x, 6*y];               % Jacobian matrix

while error > tol && k <= N
    F = f(P(1), P(2));          % Evaluate the function at intial point x0 and y0
    Jac = J(P(1), P(2));        % Evaluate the Jacobian at intial point x0 and y0
    Q = P - Jac \ F;            % Update using Newton's method => 
    error = norm(P - Q);        % Calculate the error (difference between the new calculated jacobian matrix and the old one)
    P = Q;                      % Update P enter the next point for iteration (x1,x2,....)
    k = k + 1;                  % Increment iteration counter
end

% what we did here is that we calculated the value of the jacobian matrix at both the old points(x0,y0) and the new points(x1,y1) and then calculated the difference between both and checked it if its greater/lesser than the tolerance

% Display results
if error <= tol
    disp(['Solution converged in ', num2str(k - 1), ' iterations.']);
    disp(['Root is: P1 (x) = ', num2str(P(1)), ', P2 (y) = ', num2str(P(2))]);        
%P(2) is the second index of the vector P where we are storing the repeatedly iterating roots.
%Why Use num2str?
%MATLAB does not allow direct concatenation of strings and numeric values. Using num2str, you convert the numeric value into a string that can be combined with other text for clear output formatting.
else
    disp(['Solution did not converge within ', num2str(N), ' iterations.']);
end
