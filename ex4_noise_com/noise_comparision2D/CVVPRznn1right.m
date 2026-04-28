function xdot = CVVPRznn1right(t, X)
p=1;
r_1=1;
r_2=1;

q_4=p*exp(r_1*acot(t)+r_2*t);
x = X(1:4) + X(5:8)*1i;
Yt=reshape(x,[2,2]);
Mt = [exp(1i*8*t), -1i*exp(-1i*8*t);-1i*exp(1i*8*t),exp(-1i*8*t)];

I = eye(2,2);  
Et = Mt * Yt - I;  
A_t = abs(Et);    
B_t = angle(Et);


dotMt = [8*1i*exp(8*1i*t), -8*exp(-8*1i*t); 8*exp(8*1i*t), -8*1i*exp(-8*1i*t)];
noise=mixed_noise_bounded(t,2);
dotY = pinv(Mt) * (-q_4*(phi(A_t)).*exp(1i*B_t)-dotMt*Yt+noise);
temp = reshape(dotY,[4,1]);
xdot = [real(temp);imag(temp)];
    t
end