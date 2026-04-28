    clear;
    clc;
    close all;
    format long
    global lambda;
    

    tspan=[0,1]';
    options2=odeset('RelTol',1e-4);
    % x0=rand(4,1);
    x0=zeros(8,1);
   
    
    lambda=2;
    [t1,x1]=ode45(@znnright,tspan,x0,options2); 
    E_fro1 = zeros(length(t1),1); 
    for ind = 1:length(t1)
        tind = t1(ind);
       Mt = [exp(1i*8*tind), -1i*exp(-1i*8*tind);-1i*exp(1i*8*tind),exp(-1i*8*tind)];
       I = eye(2,2);
       temp = x1(ind,:)';
       xt = temp(1:4)+temp(5:8)*1i;
       Yt =reshape(xt,[2,2]);
       Et1=Mt*Yt-I;
       E_fro1(ind) = norm(Et1,'fro');
    end

    lambda=10;
    [t2,x2]=ode45(@znnright,tspan,x0,options2); 
    E_fro2 = zeros(length(t2),1); 
    for ind = 1:length(t2)
        tind = t2(ind);
       Mt = [exp(1i*8*tind), -1i*exp(-1i*8*tind);-1i*exp(1i*8*tind),exp(-1i*8*tind)];
       I = eye(2,2);
       temp = x2(ind,:)';
       xt = temp(1:4)+temp(5:8)*1i;
       Yt =reshape(xt,[2,2]);
       Et2=Mt*Yt-I;
       E_fro2(ind) = norm(Et2,'fro');
    end

    lambda=50;
    [t3,x3]=ode45(@znnright,tspan,x0,options2); 
    E_fro3 = zeros(length(t3),1); 
    for ind = 1:length(t3)
        tind = t3(ind);
       Mt = [exp(1i*8*tind), -1i*exp(-1i*8*tind);-1i*exp(1i*8*tind),exp(-1i*8*tind)];
       I = eye(2,2);
       temp = x3(ind,:)';
       xt = temp(1:4)+temp(5:8)*1i;
       Yt =reshape(xt,[2,2]);
       Et3=Mt*Yt-I;
       E_fro3(ind) = norm(Et3,'fro');
    end



   lambda=100;
    [t4,x4]=ode45(@znnright,tspan,x0,options2); 
    E_fro4 = zeros(length(t4),1); 
    for ind = 1:length(t4)
        tind = t4(ind);
       Mt = [exp(1i*8*tind), -1i*exp(-1i*8*tind);-1i*exp(1i*8*tind),exp(-1i*8*tind)];
       I = eye(2,2);
       temp = x4(ind,:)';
       xt = temp(1:4)+temp(5:8)*1i;
       Yt =reshape(xt,[2,2]);
       Et4=Mt*Yt-I;
       E_fro4(ind) = norm(Et4,'fro');
    end


   lambda=1000;
    [t5,x5]=ode45(@znnright,tspan,x0,options2); 
    E_fro5 = zeros(length(t5),1); 
    for ind = 1:length(t5)
        tind = t5(ind);
       Mt = [exp(1i*8*tind), -1i*exp(-1i*8*tind);-1i*exp(1i*8*tind),exp(-1i*8*tind)];
       I = eye(2,2);
       temp = x5(ind,:)';
       xt = temp(1:4)+temp(5:8)*1i;
       Yt =reshape(xt,[2,2]);
       Et5=Mt*Yt-I;
       E_fro5(ind) = norm(Et5,'fro');
    end




 save alldatax x1 x2 x3 x4 x5
 save alldatat t1 t2 t3 t4 t5
 save alldataE E_fro1 E_fro2 E_fro3 E_fro4 E_fro5



figure;
plot(t1, E_fro1, 'LineWidth', 1,'LineStyle','-');  
hold on
plot(t2, E_fro2, 'LineWidth', 1,'LineStyle',':');  
plot(t3, E_fro3, 'LineWidth', 1,'LineStyle','--');  
plot(t4, E_fro4, 'LineWidth', 1,'LineStyle','-.');  
plot(t5, E_fro5, 'LineWidth', 1,'LineStyle','-'); 

xticks(0:0.1:1); 
yticks(0:0.1:1.5)

box on; 
xlabel('$t$(s)','Interpreter','latex', 'FontSize', 14)
ylabel('$\|\mathbf{E}(t)\|_\mathbf{F}$','Interpreter','latex','FontSize', 14)

set(gca, 'FontSize', 14);
ggplotAxes2D([],'AxesTheme','own1','ColorOrder','set2','EdgeStyle','gray','LegendStyle','own1');
legend('$\lambda=2$','$\lambda=10$','$\lambda=50$','$\lambda=100$','$\lambda=1000$','Interpreter','latex')
