function xdot = MFTCVznnright(t, X)
global epsilon;


x = X(1:4) + X(5:8)*1i;
Yt = reshape(x, [2, 2]);


Mt = [exp(1i*8*t), -1i*exp(-1i*8*t);-1i*exp(1i*8*t),exp(-1i*8*t)];
I = eye(2,2); 
Et =  Yt*Mt - I;  
Rt=real(Et);
St=imag(Et);


dotMt = [8*1i*exp(8*1i*t), -8*exp(-8*1i*t); 8*exp(8*1i*t), -8*1i*exp(-8*1i*t)];
noise=mixed_noise_bounded(t,2);

dotY = (noise-  Yt*dotMt - epsilon* (HFTAF(Rt)+1i*imag(St)))*pinv(Mt);

temp = reshape(dotY, [4, 1]);
xdot = [real(temp); imag(temp)];


 t
end