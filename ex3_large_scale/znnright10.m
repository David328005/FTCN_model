function xdot = znnright10(t, X)
global lambda;


x = X(1:100) + X(101:200)*1i;
Yt = reshape(x, [10, 10]);

i = 1i;
Mt = Matrix_Mt(t,10);

I = eye(10,10);  
Et = Mt * Yt - I;  
E_fro = norm(Et, 'fro');  


dotMt = Matrix_dotMt(t,10);

dotY = pinv(Mt) * (-dotMt * Yt - lambda * (Mt * Yt - I) / E_fro);

temp = reshape(dotY, [100, 1]);
xdot = [real(temp); imag(temp)];


 t
end