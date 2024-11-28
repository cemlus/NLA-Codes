clc
i = 1;
syms x;                % Declare x as a symbolic variable
f = x.*log(x) - 1.2;          % Define the function symbolically
df = diff(f, x);       % Compute the derivative of f symbolically
f_numeric = matlabFunction(f); % Convert f to a numeric function
df_numeric = matlabFunction(df); % Convert df to a numeric function

tol = 0.00001;         % Tolerance level
N = 100;               % Maximum number of iterations
x0 = 4;                % Initial guess

while i <= N
    x1 = x0 - (f_numeric(x0) / df_numeric(x0)); % Use the numeric versions
    fprintf('Iteration %d: x1 = %.5f\n', i, x1);
    
    if abs(x1 - x0) < tol 
        fprintf('Converged after %d iterations.\n', i);
        break;
    end
    
    i = i + 1;
    x0 = x1;  
end

if i > N
    disp('Maximum iterations reached without convergence');
end

fprintf('Root is: %.5f\n', x1);
