D = [1 5 9 2];
I = [6 5 3];
S = [3 1 4];
M = diag(D) + diag(I,-1) + diag(S,1)
x0 = [1 1 1 1];
b = M*x0'
x = tridiagonal(D, I, S, b);
x0
x
