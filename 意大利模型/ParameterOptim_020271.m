function [result,ResultsT,ResultsI,ResultsU,ResultsT1,ResultsS,ResultsE,ResultsR]= ParameterOptim_020271
tic%意大利版本
close all
data = load('2311.mat');%起始时间2/21
xi = data.xi;
xi(3:end-2)=(xi(1:end-4)+xi(2:end-3)+xi(3:end-2)+xi(4:end-1))/4;%数据做了光滑处理
%xi=xi*0.4;
n_in=4715;
n_out=407;
x0 = [60430000;10;100;50;17;0;0];%S,E,I,U,T,R
tspan = linspace(0,39,40);
tspan2 = linspace(0,99,100);
a=0.7;%miu1
%b=0.03;%miu2  
c=0.3;%miu3  U的比例
d=1/7;% 潜伏期
e=1/7;%锟斤拷2
f=1/14;% T to R
g=0.1174;%死亡率
k=1/5;%I to T
%p=5e-5.*(t>=8)+2e-5.*(t>=0&t<8); %武汉人口流入全国的人群中潜伏者的比例
h1h2h30 = [0.01 0.01 0.02];
result = fminsearch(@ObjFun1,h1h2h30);
D = ObjFun2(result);
[ResultsT,ResultsI,ResultsU,ResultsT1,ResultsS,ResultsE,ResultsR]=(ObjFun2(result));
plot(xi,'b')
hold on
plot(D,'r')
legend('锟斤拷实锟斤拷锟????','模锟酵硷拷锟斤拷锟斤拷锟????')
    function D = ObjFun1(h1h2h3)
         h1 = h1h2h3(1);
          %q = h1(2);
         h2 = h1h2h3(2);
         h3 = h1h2h3(3);
 fun = @(t,x)[(n_in*2*(t>=0&t<18)+0.*(t>=18))*(1-0.000897461)-((n_out+25776*0.2)*(t>=0&t<18)+0.*(t>18))-((h1*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(2))+h3*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(4)+h2*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(3))/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6));
((h1*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(2))+h3*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(4)+h2*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(3))/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6))+(n_in*2*(t>=0&t<5)+0.*(t>5))*0.000897461-x(2)*d;
d*x(2)*a-(0.3/8*t*(t>=0&t<8)+(0.65/16*(t-8)+0.3)*(t>=8&t<23)+1.*(t>=23))*k*x(3);%检出率
d*x(2)*c-e*x(4);
(0.3/8*t*(t>=0&t<8)+(0.65/16*(t-8)+0.3)*(t>=8&t<23)+1.*(t>=23))*k*x(3)-x(5)*f-g*x(5);
e*x(4)+f*x(5);
x(5)*f];
        [~,x] = ode45(fun,tspan,x0);
        D = sqrt(sum(([x(1,5);x(2:end,5)-x(1:end-1,5)+x(2:end,7)-x(1:end-1,7)]-xi)'.^2))+1e7*(h1<0);
    end
     function [D,I,U,T1,S,E,R] = ObjFun2(h1h2h3)
         h1 = h1h2h3(1);
          %q = h1(2);
        h2 = h1h2h3(2);
        h3 = h1h2h3(3);
     fun = @(t,x)[(n_in*2*(t>=0&t<18)+0.*(t>=18))*(1-0.000897461)-((n_out+25776*0.2)*(t>=0&t<18)+0.*(t>18))-((h1*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(2))+h3*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(4)+h2*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(3))/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6));
((h1*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(2))+h3*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(4)+h2*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(1)*(1-(0.4/15.*t.*(t>=0&t<15)+(0.45/10*(t-15)+0.4)*(t>=15&t<25)+0.85.*(t>=25)))*x(3))/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6))+(n_in*2*(t>=0&t<5)+0.*(t>5))*0.000897461-x(2)*d;
d*x(2)*a-(0.3/8*t*(t>=0&t<8)+(0.65/16*(t-8)+0.3)*(t>=8&t<23)+1.*(t>=23))*k*x(3);%检出率
d*x(2)*c-e*x(4);
(0.3/8*t*(t>=0&t<8)+(0.65/16*(t-8)+0.3)*(t>=8&t<23)+1.*(t>=23))*k*x(3)-x(5)*f-g*x(5);
e*x(4)+f*x(5);
x(5)*f];
        [~,x] = ode45(fun,tspan,x0);
         D = [x(1,5);x(2:end,5)-x(1:end-1,5)+x(2:end,7)-x(1:end-1,7)];
        I = x(:,3);%实时的I
        U =x(:,4);%实时的U
        T1 =x(:,5);
        S = x(:,1);
        E = x(:,2);
        R = x(:,6);
    end
toc
end
%[a b c d e f g h]=ParameterOptim_020271
