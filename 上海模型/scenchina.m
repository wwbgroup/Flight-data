[t,x]=ode45('scen2019China_Fixed',(1:100),[24183300;250;150;0;1;0;0]);
close all
 D = [x(1,5);x(2:end,5)-x(1:end-1,5)+x(2:end,7)-x(1:end-1,7)];
plot(t,D)
