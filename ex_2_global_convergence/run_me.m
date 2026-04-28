    clear;
    clc;
    close all;
    format long
    global lambda;
    
    lambda=100;
    tspan=(0:0.0001:10)';
    options2=odeset('RelTol',1e-4);
    % x0=rand(18,1);
     % x0=rand(18,100);
     x0=50*(2*rand(18,100)-1);
   figure;
   hold on; 
   box on;
  all_t=zeros(100001,100) ;     
  all_x=zeros(100001,18,100) ;     
  all_E_fro=zeros(100001,100); 


   for k=1:100
     k  
   
    [t,x]=ode45(@znnright,tspan,x0(:,k),options2); 
    E_fro = zeros(length(t),1); 
    
    
    for ind = 1:length(t)
        
        tind = t(ind);
        Mt = [2 + 1i*sin(5*tind),   cos(3*tind) + 1i*sin(5*tind),   cos(5*tind) + 2i;
     cos(3*tind) + 1i*sin(5*tind),   3 + 1i*sin(5*tind),   cos(2*tind) - 3i;
     3 - 1i*sin(4*tind),   cos(3*tind) + 5i,            -cos(4*tind) + 1i*sin(tind)];

       I = eye(3,3);
       temp = x(ind,:)';
       xt = temp(1:9)+temp(10:18)*1i;
       Yt =reshape(xt,[3,3]);
       Et=Mt*Yt-I;
       E_fro(ind) = norm(Et,'fro');
    end

  all_t(:,k)=t ;     
   all_x(:,:,k)=x ;     
  all_E_fro(:,k)=E_fro;
 

  plot(t, E_fro, 'LineWidth', 1,'Color','r');  
  box on; 
  hold on
 
  end

    xlabel('t')
 ylabel('$\|E(t)\|_\mathbf{F}$','Interpreter','latex')
 
 save  variable all_t   all_x  all_E_fro


 

load variable
picture = figure;
figure(picture)
ggplotAxes2D([],'AxesTheme','own1','ColorOrder','set2','EdgeStyle','gray','LegendStyle','own1');
for k=1:100
 plot(all_t(:,k), all_E_fro(:,k), 'LineWidth', 1,'Color','r');  
  box on;  
  hold on
end
xlabel('$t$(s)','Interpreter','latex', 'FontSize', 14)
ylabel('$\|\mathbf{E}(t)\|_\mathbf{F}$','Interpreter','latex','FontSize', 14)

set(gca, 'FontSize', 14);
xticks(0:1:10);