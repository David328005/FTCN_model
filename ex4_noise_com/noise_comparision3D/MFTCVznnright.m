function xdot = MFTCVznnright(t, X)
global epsilon;


x = X(1:9) + X(10:18)*1i;
Yt = reshape(x, [3, 3]);



Mt = [2 + 1i*sin(5*t),   cos(3*t) + 1i*sin(5*t),   cos(5*t) + 2i;     
     cos(3*t) + 1i*sin(5*t),   3 + 1i*sin(5*t),   cos(2*t) - 3i;   
     3 - 1i*sin(4*t),   cos(3*t) + 5i,    -cos(4*t) + 1i*sin(t)];
I = eye(3,3); 
Et =  Yt*Mt - I;  
Rt=real(Et);
St=imag(Et);

dotMt = [1i*5*cos(5*t),-3*sin(3*t) + 1i*5*cos(5*t), -5*sin(5*t);
         -3*sin(3*t) + 1i*5*cos(5*t), 1i*5*cos(5*t),   -2*sin(2*t);
         -1i*4*cos(4*t),   -3*sin(3*t), 4*sin(4*t) + 1i*cos(t);];

noise=mixed_noise_bounded(t,3);

dotY = (noise-  Yt*dotMt - epsilon* (HFTAF(Rt)+1i*imag(St)))*pinv(Mt);

temp = reshape(dotY, [9, 1]);
xdot = [real(temp); imag(temp)];


 t
end