function xdot = znnright50(t, X)
global lambda;

n = 50;             
N = n * n;            


x = X(1:N) + X(N+1:2*N)*1i;
Yt = reshape(x, [n, n]);


Mt = Matrix_Mt(t, n);

I = eye(n, n);  
Et = Mt * Yt - I;  
E_fro = norm(Et, 'fro');  


dotMt = Matrix_dotMt(t, n);


dotY = pinv(Mt) * (-dotMt * Yt - lambda * (Mt * Yt - I) / E_fro);


temp = reshape(dotY, [N, 1]);
xdot = [real(temp); imag(temp)];

t
end