    % load allx
    % load allt
    % load allE
    clear;
    clc;
    close all;
    format long
    global lambda epsilon s0;
    epsilon=1;
    n=3;
    lambda=100;
    s0=20;

    tspan=[0,2]';
    options2=odeset('RelTol',1e-4);
    % x0=rand(4,1);
    x0=zeros(18,1);
    %%%%%for integral model
    %H0 = randn(n) + 1i*randn(n);
    H0 = zeros(n) + 1i*zeros(n);
    Y0 = zeros(n);
    Z0 = zeros(n);
    X0 = [real(H0(:)); imag(H0(:)); real(Y0(:)); imag(Y0(:)); real(Z0(:)); imag(Z0(:))];
   
    
   
    
    [t1,x1]=ode113(@CVVPRznn1right,tspan,x0,options2); 
      

     
     [t2,x2]=ode113(@MFTCVznnright,tspan,x0,options2);


   
   [t3,x3]=ode113(@disznnright,tspan,X0,options2); 
   
   
     [t4,x4]=ode113(@znnright,tspan,x0,options2); 
    

    E_fro1 = zeros(length(t1),1);
    for ind = 1:length(t1)
       tind = t1(ind);
      Mt = [2 + 1i*sin(5*tind),   cos(3*tind) + 1i*sin(5*tind),   cos(5*tind) + 2i;     
     cos(3*tind) + 1i*sin(5*tind),   3 + 1i*sin(5*tind),   cos(2*tind) - 3i;   
     3 - 1i*sin(4*tind),   cos(3*tind) + 5i,    -cos(4*tind) + 1i*sin(tind)];

       I = eye(3,3);
       temp = x1(ind,:)';
       xt = temp(1:9)+temp(10:18)*1i;
       Yt =reshape(xt,[3,3]);
       Et=Mt*Yt-I;
       E_fro1(ind) = norm(Et,'fro');
    end

    

    E_fro2 = zeros(length(t2),1);
    for ind = 1:length(t2)
       tind = t2(ind);
        Mt = [2 + 1i*sin(5*tind),   cos(3*tind) + 1i*sin(5*tind),   cos(5*tind) + 2i;     
     cos(3*tind) + 1i*sin(5*tind),   3 + 1i*sin(5*tind),   cos(2*tind) - 3i;   
     3 - 1i*sin(4*tind),   cos(3*tind) + 5i,    -cos(4*tind) + 1i*sin(tind)];
       I = eye(3,3);
       temp = x2(ind,:)';
       xt = temp(1:9)+temp(10:18)*1i;
       Yt =reshape(xt,[3,3]);
       Et=Mt*Yt-I;
       E_fro2(ind) = norm(Et,'fro');
    end

     

    E_fro3 = zeros(length(t3),1);
    for ind = 1:length(t3)
       tind = t3(ind);
         Mt = [2 + 1i*sin(5*tind),   cos(3*tind) + 1i*sin(5*tind),   cos(5*tind) + 2i;     
     cos(3*tind) + 1i*sin(5*tind),   3 + 1i*sin(5*tind),   cos(2*tind) - 3i;   
     3 - 1i*sin(4*tind),   cos(3*tind) + 5i,    -cos(4*tind) + 1i*sin(tind)];
       I = eye(3,3);
       temp = x3(ind,:)';
       xt = temp(1:9)+temp(10:18)*1i;
       Yt =reshape(xt,[3,3]);
       Et=Mt*Yt-I;
       E_fro3(ind) = norm(Et,'fro');
    end

     

    E_fro4 = zeros(length(t4),1);
    for ind = 1:length(t4)
       tind = t4(ind);
        Mt = [2 + 1i*sin(5*tind),   cos(3*tind) + 1i*sin(5*tind),   cos(5*tind) + 2i;     
     cos(3*tind) + 1i*sin(5*tind),   3 + 1i*sin(5*tind),   cos(2*tind) - 3i;   
     3 - 1i*sin(4*tind),   cos(3*tind) + 5i,    -cos(4*tind) + 1i*sin(tind)];

       I = eye(3,3);
       temp = x4(ind,:)';
       xt = temp(1:9)+temp(10:18)*1i;
       Yt =reshape(xt,[3,3]);
       Et=Mt*Yt-I;
       E_fro4(ind) = norm(Et,'fro');
    end




save allx x1 x2 x3 x4
save allt t1 t2 t3 t4
save allE E_fro1 E_fro2 E_fro3 E_fro4
    
figure;
plot(t1, E_fro1, 'LineWidth', 1,'LineStyle','--');  
hold on
plot(t2, E_fro2, 'LineWidth', 1,'LineStyle',':'); 
plot(t3, E_fro3, 'LineWidth', 1,'LineStyle','-.');  
plot(t4, E_fro4, 'LineWidth', 1,'LineStyle','-'); 
box on;  
xlabel('$t$(s)','Interpreter','latex', 'FontSize', 14)
ylabel('$\|\mathbf{E}(t)\|_\mathbf{F}$','Interpreter','latex','FontSize', 14)

xticks(0:0.2:2)
 yticks(0:0.7:7)

set(gca, 'FontSize', 14);
ggplotAxes2D([],'AxesTheme','own1','ColorOrder','set2','EdgeStyle','gray','LegendStyle','own1');

legend('CVVPRZNN','MFTCVZNN','DISZNN','our model')


main_ax = gca;
main_pos = get(main_ax, 'Position');
main_xlim = xlim;
main_ylim = ylim;


ax_inset = axes('Position',[0.4, 0.2, 0.15, 0.15]); 
plot(t1, E_fro1, 'LineWidth', 1,'LineStyle','--'); 
hold on
plot(t2, E_fro2, 'LineWidth', 1,'LineStyle',':'); 
plot(t3, E_fro3, 'LineWidth', 1,'LineStyle','-.');  
plot(t4, E_fro4, 'LineWidth', 1,'LineStyle','-')                                                                                       
axis([0.00 0.2 0 0.1]);  
ggplotAxes2D([],'AxesTheme','own1','ColorOrder','set2','EdgeStyle','gray','LegendStyle','own1');



inset_pos = get(ax_inset, 'Position');

main_point = [0.035, 0.05]; 

main_x_norm = (main_point(1) - main_xlim(1)) / diff(main_xlim);
main_y_norm = (main_point(2) - main_ylim(1)) / diff(main_ylim);
main_point_fig = [...
    main_pos(1) + main_x_norm * main_pos(3), ...
    main_pos(2) + main_y_norm * main_pos(4)];


inset_point_fig = [inset_pos(1), inset_pos(2)];

annotation('arrow',...
    [inset_point_fig(1), main_point_fig(1)],...
    [inset_point_fig(2), main_point_fig(2)],...
    'Color', 'k',...
    'LineWidth', 1.5,...
    'HeadWidth', 12,...
    'HeadLength', 10);