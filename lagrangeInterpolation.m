p=[4 7 9 13];      %given x coordinates
f=[18 63 90 182];      %corresponding y cooridunates (f(x))
x=11;                  %the x value from where we have to estimate f(x)
sum=0;      
n=4;                  %number of given points/coordinates(x,y)
l=ones(n,1);          %initializing a vector to store all the lagrange coeffecient's value so that in the end they can all be added up 
for i = 1:n
    for j=1:n
        if(j~=i)          % makes sure that i != j because then division by 0 might take place
            l(i)=l(i)*(x-p(j))/(p(i)-p(j));
        end
    end
    sum=sum+(l(i)*f(i));
end
fprintf("The sum is: %f\n",sum);
