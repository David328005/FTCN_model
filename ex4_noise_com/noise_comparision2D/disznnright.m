function xdot = disznnright(t, X)


global s0; 
n = 2;    


offset = n^2;
H_real = X(1:offset);
H_imag = X(offset+1:2*offset);
Y_real = X(2*offset+1:3*offset);
Y_imag = X(3*offset+1:4*offset);
Z_real = X(4*offset+1:5*offset);
Z_imag = X(5*offset+1:6*offset);


H = reshape(H_real, n, n) + 1i * reshape(H_imag, n, n);
Y = reshape(Y_real, n, n) + 1i * reshape(Y_imag, n, n);
Z = reshape(Z_real, n, n) + 1i * reshape(Z_imag, n, n);


Mt = [exp(1i*8*t), -1i*exp(-1i*8*t);-1i*exp(1i*8*t),exp(-1i*8*t)];
dotMt = [8*1i*exp(8*1i*t), -8*exp(-8*1i*t); 8*exp(8*1i*t), -8*1i*exp(-8*1i*t)];
I = eye(n, n);


E = Mt * H - I;


noise=mixed_noise_bounded(t,2);
size(s0)
size(Z)
size(Y)
size(E)
size(dotMt)
size(H)
size(noise)



term = s0^3 * Z + 3 * s0^2 * Y + 3 * s0 * E + dotMt * H+noise;
dotH = - pinv(Mt) * term;


dotY = E;
dotZ = Y;


dotH_vec = dotH(:);
dotY_vec = dotY(:);
dotZ_vec = dotZ(:);

xdot = [real(dotH_vec); imag(dotH_vec); 
        real(dotY_vec); imag(dotY_vec);
        real(dotZ_vec); imag(dotZ_vec)];
t


end

