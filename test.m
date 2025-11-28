close all
% ------ Q1 -----
% ------ a -----
D = [1 5 9 2];
I = [6 5 3];
S = [3 1 4];
M = diag(D) + diag(I,-1) + diag(S,1);
x0 = [1 1 1 1];
b = M*x0';
x = tridiagonal(D, I, S, b);
x0;
x;


% ------ b -----
p = @(x) 0;
q = @(x) 0;
r = @(x) 6*x;

% interval [a,b]
a=0;
b=1;
alp=0; % y(a)
bet=1; % y(b)
N = 10;
h=(b-a)/(N+1);
x = a*ones([1 N+2])+h*(0:(N+1));

P = p(x);
Q = q(x);
R = r(x);
if length(P) == 1
    P = P * ones([1 N+2]);
end
if length(Q) == 1
    Q = Q * ones([1 N+2]);
end
if length(R) == 1
    R = R * ones([1 N+2]);
end

y = problimite(N,P,Q,R,a,b,alp,bet)
