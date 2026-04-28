function xdot = CVVPRznn1right(t, X)
p=1;
r_1=1;
r_2=1;

q_4=p*exp(r_1*acot(t)+r_2*t);
x = X(1:9) + X(10:18)*1i;
Yt=reshape(x,[3,3]);

Mt = [2 + 1i*sin(5*t),   cos(3*t) + 1i*sin(5*t),   cos(5*t) + 2i;     
     cos(3*t) + 1i*sin(5*t),   3 + 1i*sin(5*t),   cos(2*t) - 3i;   
     3 - 1i*sin(4*t),   cos(3*t) + 5i,    -cos(4*t) + 1i*sin(t)];

I = eye(3,3);  
Et = Mt * Yt - I;  
A_t = abs(Et);    
B_t = angle(Et);





dotMt = [1i*5*cos(5*t),-3*sin(3*t) + 1i*5*cos(5*t), -5*sin(5*t);
         -3*sin(3*t) + 1i*5*cos(5*t), 1i*5*cos(5*t),   -2*sin(2*t);
         -1i*4*cos(4*t),   -3*sin(3*t), 4*sin(4*t) + 1i*cos(t);];
noise=mixed_noise_bounded(t,3);
dotY = pinv(Mt) * (-q_4*(phi(A_t)).*exp(1i*B_t)-dotMt*Yt+noise);
temp = reshape(dotY,[9,1]);
xdot = [real(temp);imag(temp)];
    t
end