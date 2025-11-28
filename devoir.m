close all
% ------ Q2 -----
% ------ a -----
p = @(x) x.^(-1);
q = @(x) 1.6*x.^(-4);
r = @(x) 0;

% interval [a,b]
a=0.9;
b=1;
alp=0; % y(a)
bet=1; % y(b)
h=1/30;
N=round((b-a)/h-1);
x = a*ones([1 N+2])+h*(0:(N+1));
x = x30;

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

y30 = problimite(N,P,Q,R,a,b,alp,bet);


h=1/50;
N=round((b-a)/h-1);
x = a*ones([1 N+2])+h*(0:(N+1));
x50 = x;

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

y50 = problimite(N,P,Q,R,a,b,alp,bet);

c = 1.4;
d = 0.9^2;
funcy = @(x) (c-0.4*x.^(-2))-(c-0.4/d)*log(x)/log(0.9);

figure(1);
plot(x30,y30,'-o');
hold on;
plot(x50,y50,'-o');
N = 10;
h=(b-a)/(N+1);
x = a*ones([1 N+2])+h*(0:(N+1));
plot(x,funcy(x),'LineWidth',2);
hold off;


% ------ b -----
E = zeros([1 4]);
for i = 2:5
    h=10^(-i);
    N=round((b-a)/h-1);
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

    E(i-1) = max(abs(problimite(N,P,Q,R,a,b,alp,bet)-funcy(x)));
end
figure(2);
semilogx(10.^(-(2:5)),E,'-o');
