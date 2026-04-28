clear;
clc;
close all;
format long
global lambda;

lambda = 10;
tspan = [0, 10]';
options2 = odeset('RelTol', 1e-4);
% x0 = rand(4,1);
x0 = zeros(8,1);
[t, x] = ode113(@znnright, tspan, x0, options2); 
E_fro = zeros(length(t), 1); 
for ind = 1:length(t)
    tind = t(ind);
    Mt = [exp(1i*8*tind), -1i*exp(-1i*8*tind); -1i*exp(1i*8*tind), exp(-1i*8*tind)];
    I = eye(2,2);
    temp = x(ind,:)';
    xt = temp(1:4) + temp(5:8)*1i;
    Yt = reshape(xt, [2,2]);
    Et = Mt * Yt - I;
    E_fro(ind) = norm(Et, 'fro');
end

save alldata x t E_fro  

invMt_11 = 0.5 * exp(-1i*8*t); 
invMt_12 = 0.5 * 1i * exp(-1i*8*t); 
invMt_21 = 0.5 * 1i * exp(1i*8*t);
invMt_22 = 0.5 * exp(1i*8*t);


x11_figure = figure;
x12_figure = figure; 
x21_figure = figure;
x22_figure = figure;
error_figure = figure;


figure(x11_figure)
plot3(real(invMt_11), imag(invMt_11), t, 'b--', 'LineWidth', 1);  
hold on
plot3(x(:,1), x(:,5), t, 'r', 'LineWidth', 1);   
xlabel('real')
ylabel('imaginary')
zlabel('$t$(s)','Interpreter','latex')
xticks(-1:0.25:1); 
yticks(-1:0.25:1)
zticks(0:1:10)
ggplotAxes2D([],'AxesTheme','own1','ColorOrder','set2','EdgeStyle','gray','LegendStyle','own1');
legend('$\mathbf{M}_{11}^{-1}(t)$','$\mathbf{Y}_{11}(t)$','Interpreter','latex')

set(gca, 'FontSize', 14);
xlabel('real', 'FontSize', 14);
ylabel('imaginary', 'FontSize', 14);
zlabel('$t$(s)', 'Interpreter','latex', 'FontSize', 14);


figure(x21_figure)
plot3(real(invMt_21), imag(invMt_21), t, 'b--', 'LineWidth', 1);  
hold on
plot3(x(:,2), x(:,6), t, 'r', 'LineWidth', 1);
xlabel('real')
ylabel('imaginary')
zlabel('$t$(s)','Interpreter','latex')
xticks(-1:0.25:1); 
yticks(-1:0.25:1)
zticks(0:1:10)
ggplotAxes2D([],'AxesTheme','own1','ColorOrder','set2','EdgeStyle','gray','LegendStyle','own1');
legend('$\mathbf{M}_{21}^{-1}(t)$','$\mathbf{Y}_{21}(t)$','Interpreter','latex')
set(gca, 'FontSize', 14);
xlabel('real', 'FontSize', 14);
ylabel('imaginary', 'FontSize', 14);
zlabel('$t$(s)', 'Interpreter','latex', 'FontSize', 14);


figure(x12_figure)
plot3(real(invMt_12), imag(invMt_12), t, 'b--', 'LineWidth', 1);  
hold on
plot3(x(:,3), x(:,7), t, 'r', 'LineWidth', 1);
xlabel('real')
ylabel('imaginary')
zlabel('$t$(s)','Interpreter','latex')
xticks(-1:0.25:1); 
yticks(-1:0.25:1)
zticks(0:1:10)
ggplotAxes2D([],'AxesTheme','own1','ColorOrder','set2','EdgeStyle','gray','LegendStyle','own1');
legend('$\mathbf{M}_{12}^{-1}(t)$','$\mathbf{Y}_{12}(t)$','Interpreter','latex')
set(gca, 'FontSize', 14);
xlabel('real', 'FontSize', 14);
ylabel('imaginary', 'FontSize', 14);
zlabel('$t$(s)', 'Interpreter','latex', 'FontSize', 14);

figure(x22_figure)
plot3(real(invMt_22), imag(invMt_22), t, 'b--', 'LineWidth', 1);  
hold on
plot3(x(:,4), x(:,8), t, 'r', 'LineWidth', 1);
xlabel('real')
ylabel('imaginary')
zlabel('$t$(s)','Interpreter','latex')
xticks(-1:0.25:1); 
yticks(-1:0.25:1)
zticks(0:1:10)
ggplotAxes2D([],'AxesTheme','own1','ColorOrder','set2','EdgeStyle','gray','LegendStyle','own1');
legend('$\mathbf{M}_{22}^{-1}(t)$','$\mathbf{Y}_{22}(t)$','Interpreter','latex')
set(gca, 'FontSize', 14);
xlabel('real', 'FontSize', 14);
ylabel('imaginary', 'FontSize', 14);
zlabel('$t$(s)', 'Interpreter','latex', 'FontSize', 14);


figure(error_figure)
plot(t, E_fro, 'LineWidth', 1);
box on;
xlabel('t')
ylabel('$\|E(t)\|_\mathbf{F}$','Interpreter','latex')
set(gca, 'FontSize', 14);
xlabel('t', 'FontSize', 14);
ylabel('$\|E(t)\|_\mathbf{F}$', 'Interpreter','latex', 'FontSize', 14);