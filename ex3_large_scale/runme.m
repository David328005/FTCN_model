   load allE 
   load allt 
   load allx

    clear;
    clc;
    close all;
    format long
    global lambda;
    
   
    tspan=0:0.001:5;
    options2=odeset('RelTol',1e-4);
    % x0=rand(4,1);
    x0_50=(rand(5000,1)-0.5)*0.2;
    x0_30=(rand(1800,1)-0.5)*0.2;
    x0_10=(rand(200,1)-0.5)*0.2;
     x0_100=(rand(20000,1)-0.5)*0.2;

    lambda=200;

     [t100,x100]=ode113(@znnright100,tspan,x0_100,options2); 
    [t50,x50]=ode113(@znnright50,tspan,x0_50,options2); 
    [t30,x30]=ode113(@znnright30,tspan,x0_30,options2); 
    [t10,x10]=ode113(@znnright10,tspan,x0_10,options2); 
    
 

    E_fro50 = zeros(length(t50),1); 
    E_fro30 = zeros(length(t30),1); 
    E_fro10 = zeros(length(t10),1); 
    E_fro100 = zeros(length(t100),1);
  



     for ind = 1:length(t50)
       tind = t50(ind);
       Mt = Matrix_Mt(tind,50);
       I = eye(50,50);
       temp = x50(ind,:)';
       xt = temp(1:2500)+temp(2501:5000)*1i;
       Yt =reshape(xt,[50,50]);
       Et=Mt*Yt-I;
       E_fro50(ind) = norm(Et,'fro');
    end


      for ind = 1:length(t30)
       tind = t30(ind);
       Mt = Matrix_Mt(tind,30);
       I = eye(30,30);
       temp = x30(ind,:)';
       xt = temp(1:900)+temp(901:1800)*1i;
       Yt =reshape(xt,[30,30]);
       Et=Mt*Yt-I;
       E_fro30(ind) = norm(Et,'fro');
     end


      for ind = 1:length(t10)
       tind = t10(ind);
       Mt = Matrix_Mt(tind,10);
       I = eye(10,10);
       temp = x10(ind,:)';
       xt = temp(1:100)+temp(101:200)*1i;
       Yt =reshape(xt,[10,10]);
       Et=Mt*Yt-I;
       E_fro10(ind) = norm(Et,'fro');
      end

      for ind = 1:length(t100)
       tind = t100(ind);
       Mt = Matrix_Mt(tind,100);
       I = eye(100,100);
       temp = x100(ind,:)';
       xt = temp(1:10000)+temp(10001:20000)*1i;
       Yt =reshape(xt,[100,100]);
       Et=Mt*Yt-I;
       E_fro100(ind) = norm(Et,'fro');
      end





save allx x10 x30 x50 x100
save allt t10 t30 t50 t100
save allE E_fro10 E_fro30 E_fro50 E_fro100
    
figure;
ggplotAxes2D([],'AxesTheme','own1','ColorOrder','set2','EdgeStyle','gray','LegendStyle','own1');

hold on
plot(t10, E_fro10, 'LineWidth', 1,'LineStyle','--');
plot(t30, E_fro30, 'LineWidth', 1,'LineStyle',':');
plot(t50, E_fro50, 'LineWidth', 1,'LineStyle','-.');
plot(t100, E_fro100, 'LineWidth', 1,'LineStyle','-');

box on;
xlabel('$t$(s)','Interpreter','latex', 'FontSize', 14)
ylabel('$\|\mathbf{E}(t)\|_\mathbf{F}$','Interpreter','latex','FontSize', 14)

set(gca, 'FontSize', 14);
legend('n=10','n=30','n=50','n=100')


main_ax = gca;
main_pos = get(main_ax, 'Position');
main_xlim = xlim;
main_ylim = ylim;


ax_inset = axes('Position',[0.25, 0.25, 0.15, 0.15]); 
plot(t10, E_fro10, 'LineWidth', 1,'LineStyle','--');  
ggplotAxes2D([],'AxesTheme','own1','ColorOrder','set2','EdgeStyle','gray','LegendStyle','own1');
set(gca, 'FontSize', 14);
axis([0.00 0.6 0 10]);  



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
hold off