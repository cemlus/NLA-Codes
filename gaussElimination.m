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

