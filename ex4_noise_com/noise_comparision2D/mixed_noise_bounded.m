function Delta = mixed_noise_bounded(t, n)


A1 = 1;
A2 = 2;

bias = 1;

omega1 = linspace(5,15,n);
omega2 = linspace(10,20,n);

[W1, W2] = meshgrid(omega1, omega2);




Delta = A1*sin(W1*t) ...
      + A2*cos(W2*t) ...
      + bias;

end