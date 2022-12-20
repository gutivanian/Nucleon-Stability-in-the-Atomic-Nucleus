function [X] = batas(X)
global mmin mmax
n=length(X);
for i = 1:n
    if X(1,i) > mmax
    X(1,i) = mmax;
    elseif X(1,i) < mmin;
    X(1,i) = mmin;
    else
    X(1,i)=X(i);
    end
end