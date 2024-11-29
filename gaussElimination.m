A=input('Enter matrix A: ');
b=input('Enter Matrix B: ');
n=length(b);
x=zeros(1,n);
detA=det(A);      % Calculates the determinant of A. A zero determinant means A is singular, implying no unique solution.
if detA==0
    disp('Unsolvable');
    return;
end
a=[A b];            % Forms the augmented matrix by appending b as an extra column to A

% Eliminates the lower triangle of the augmented matrix to transform it into an upper triangular form.
% i -> signifies and iterates thorugh the columns containing the pivots
% j -> processes all the rows of the current pivot during the ongoing iteration
for i=1:n-1
    for j=i+1:n
        m=a(j,i)/a(i,i);
        a(j,:)= a(j,:)-m*a(i,:);
    end
end
disp(a)

% back substitution for the final variable
x(n)=a(n,n+1)/a(n,n);

% for rows above the last one, we solve each variable by substituting the values of variables that have already been computed
for k=n-1:-1:1
    x(k)=(a(k,n+1) - sum(a(k,k+1:n).*x(k+1:n)))/a(k,k);
end
disp(x)

% -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

format long
Info = [6 3 2; 6 4 3; 20 15 12]; % Given Matrix A
b = [6; 0; 0]; % R.H.S. of the system of equations
A = [Info b]; % Write Augmented matrix A|b

% Forward elimination
for i = 1:size(A, 1)
    for j = i + 1:size(A, 1)
        key1 = A(j, i) / A(i, i); % Find Pivot key element
        A(j, :) = A(j, :) - key1 * A(i, :); % Apply elementary row operations
    end
end

% Back substitution
n = size(A, 1); % Number of equations
x = zeros(n, 1); % Initialize solution vector

% Start back substitution from the last row
for i = n:-1:1
    x(i) = (A(i, end) - A(i, 1:end-1) * x) / A(i, i); % Calculate each variable
end

% Display the solution
disp('Solution:');
disp(x);
 gauss elimination
