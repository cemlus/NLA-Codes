f = @(x) x .* log(x) - 1.2; % Define the function
a = 1; b = 5; n = 50; % Increase resolution for more accuracy of the interval chosen
x = linspace(a, b, n); % Generate points (in our case 50 intervals)
fx = f(x); % Evaluate the function at these points

fprintf('Checking intervals for roots:\n');
for i = 1:length(x)-1
% prints value of every iteration and their respective values in the functions
    fprintf('x(i) = %2f, x(i+1) = %2f, f(x(i)) = %2f, f(x(i+1)) = %2f\n', x(i), x(i+1), fx(i), fx(i+1));

    if fx(i) * fx(i+1) < 0
    % when the sign changes this condition is executed and the interval where the root lies is printed
        fprintf('Root found in interval: [%2f, %2f] \n', x(i), x(i+1));
    end
end
