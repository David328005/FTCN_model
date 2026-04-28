function xdot = znnright(t, X)
global lambda;
x = X(1:4) + X(5:8)*1i;
Yt=reshape(x,[2,2]);
Mt = [exp(1i*8*t), -1i*exp(-1i*8*t);-1i*exp(1i*8*t),exp(-1i*8*t)];
I = eye(2,2);
Et=Mt*Yt-I;
E_fro=norm(Et, 'fro');


dotMt = [8*1i*exp(8*1i*t), -8*exp(-8*1i*t); 8*exp(8*1i*t), -8*1i*exp(-8*1i*t)];
dotY=pinv(Mt)*(-dotMt*Yt-lambda*(Mt*Yt-I)/E_fro);
temp = reshape(dotY,[4,1]);
xdot = [real(temp);imag(temp)];
    t
end