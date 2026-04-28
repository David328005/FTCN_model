p=1;
r_1=0.2;
r_2=0.2;
t=0:0.01:1000;
q_4=p*exp(r_1*acot(t)+r_2*t);
semilogy(t,q_4,"LineWidth",1,"Color",'b');
ylabel('$q(t)$','Interpreter','latex','FontSize', 14)

xlabel('$t$(s)','Interpreter','latex', 'FontSize', 14)


set(gca, 'FontSize', 14);
ggplotAxes2D([],'AxesTheme','own1','ColorOrder','set2','EdgeStyle','gray','LegendStyle','own1');
