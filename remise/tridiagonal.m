function x = tridiagonal(D,I,S,b)
    n = length(D)
    y = zeros([1 n]);
    x = zeros([1 n]);
    y(1) = b(1)/D(1);
    for i = 2:n
        S(i-1)=S(i-1)/D(i-1);
        D(i)=D(i)-I(i-1)*S(i-1);
        y(i)=(b(i)-I(i-1)*y(i-1))/D(i);
    end
    x(n)=y(n);
    for i = (n-1):-1:1 
        x(i)=y(i)-S(i)*x(i+1);
    end
end
