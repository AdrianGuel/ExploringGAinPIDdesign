clearvars;
close all;

options = optimoptions('ga','ConstraintTolerance',1e-6,'PlotFcn', @gaplotbestf);
rng default % For reproducibility
x = ga(@(gains) response(gains),3,[],[],[],[],[0;0;0],[30;50;20],[],options);

[RMSE,t,y,unitstep]=response(x);
figure
plot(t,unitstep,t,y)
xlabel('t (s)','Interpreter','Latex','FontSize', 12)
ylabel('$y(t)$','Interpreter','Latex','FontSize', 12)
set(gcf,'color','w');