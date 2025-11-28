function y = problimite(N,P,Q,R,a,b,alp,bet)

    h = (b-a)/(N+1);

    Pint = P(2:end-1);
    Qint = Q(2:end-1);
    Rint = R(2:end-1);

    Pint = Pint(:).';
    Qint = Qint(:).';
    Rint = Rint(:).';

    D = (2 + Qint*h^2);
    I = (-1 - (Pint(2:end)*h)/2);
    S = (-1 + (Pint(1:end-1)*h)/2);

    bvec = -(Rint*h^2);

    bvec(1)   = bvec(1)   + (1 + Pint(1)*h/2)*alp;
    bvec(end) = bvec(end) + (1 - Pint(end)*h/2)*bet;

    y_int = tridiagonal(D, I, S, bvec);

    y = [alp y_int bet];

end

