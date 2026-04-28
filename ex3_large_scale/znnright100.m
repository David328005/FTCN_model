function xdot = znnright100(t, X)
global lambda;


x = X(1:10000) + X(10001:20000)*1i;
Yt = reshape(x, [100, 100]);

i = 1i;
Mt = Matrix_Mt(t,100);

I = eye(100,100);  
Et = Mt * Yt - I;  
E_fro = norm(Et, 'fro');  


dotMt = Matrix_dotMt(t,100);


dotY = pinv(Mt) * (-dotMt * Yt - lambda * (Mt * Yt - I) / E_fro);

temp = reshape(dotY, [10000, 1]);
xdot = [real(temp); imag(temp)];


 t
end