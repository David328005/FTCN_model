p=1;
r_1=0.2;
r_2=0.2;
t=0:0.01:1000;
q_4=p*exp(r_1*acot(t)+r_2*t);
semilogy(t,q_4,"LineWidth",1,"Color",'b');
ylabel('$q(t)$','Interpreter','latex')
xlabel('$t$(s)','Interpreter','latex')