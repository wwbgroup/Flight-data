function y=scen2019China_Fixed(t,x)
a=0.7;%��1
%n0=0;%�人�����Ϻ�����%yy
%rate1=0.09;
%rate2=0.09;
%rate3=0.10;
%rate4=0.10;
%rate5=0.12;
%rate6=0.15;
%rate7=0.18;
%rate8=0.17;
%rate9=0.2;
%n_back=3200000;% 300��400��500��600��
%n_ordinary=300000;
%n_in=n0.*(t>8)+n_back.*(t>=0&t<1)*rate1+n_back.*(t>=1&t<2)*rate2+n_back.*(t>=2&t<3)*rate3+n_back.*(t>=3&t<4)*rate4+n_back.*(t>=4&t<5)*rate5+n_back.*(t>=5&t<6)*rate6+...
    %n_back.*(t>=6&t<7)*rate7+n_back.*(t>=7&t<8)*rate8;%yy
%n_in=n0.*(t>=0&t<12)+9879.*(t>=12&t<13)+9765.*(t>=13&t<14)+9921.*(t>=14&t<15)+9124.*(t>=15&t<16)+7649.*(t>=16&t<17)+7642.*(t>=17&t<18)+6781.*(t>=18&t<19)+8001.*(t>=19&t<20)+8007.*(t>=20&t<21)+5445.*(t>=21&t<22)+4031.*(t>=22&t<23)+4013.*(t>=23&t<24)+3504.*(t>=24&t<25)+3727.*(t>=25&t<26)+3786.*(t>=26&t<27)+4181.*(t>=27&t<28)+2696.*(t>=28&t<29)+2861.*(t>=29&t<30)+2500.*(t>=30&t<31)+2486.*(t>=31&t<32)+2935.*(t>=32&t<33)+2281.*(t>=33&t<34)+3083.*(t>=34&t<35)+2693.*(t>=35&t<36)+2146.*(t>=36&t<37)+2146.*(t>=37&t<38)+2146.*(t>=38&t<39)+2146.*(t>=39&t<40)+2146.*(t>=40&t<41)+2146.*(t>=41&t<42)+2146.*(t>=42&t<43);
%b=0.0239;%��2
c=0.3;%��3
d=1/14;%��չ��
e=1/7;%��2
f=1/14;%��1
g=0.0401;%������
k=1/5;%I to T
h1=0.5179;
h2=0.0977;
%q=0.3748;
%h1=��1
%h2=��2
% s=0.05+0.2/30.*t.*(t>=0&t<30)+0.2.*(t>=30); %������ 0.35,0.45��0.55,0.65,0.75,0.85
% s=0.05+0.4/30.*t.*(t>=0&t<30)+0.4.*(t>=30);
% s=0.05+0.6/30.*t.*(t>=0&t<30)+0.6.*(t>=30);
% s=0.05+0.8/30.*t.*(t>=0&t<30)+0.8.*(t>=30);
%s=0.85/20.*t.*(t>=0&t<20)+0.85.*(t>=20);  %����ϵ�������
%s=0.425/20.*t.*(t>=0&t<20)+0.425.*(t>=20);   %0.5
%s=0.51/20.*t.*(t>=0&t<20)+0.51.*(t>=20);      %0.6   
%s=0./20.*t.*(t>=0&t<20)+0.*(t>=20);      %0 
%s=1./20.*t.*(t>=0&t<20)+1.*(t>=20);      %1
s=0.*(t<21)+0.85/20.*t.*(t>=21&t<41)+0.85.*(t>=41);%�Ƴٸ����ʩ
 j=0.95/20*t*(t>=0&t<20)+0.95.*(t>=20);  %����ϵ�������
  %j=1/20*t*(t>=0&t<20)+1.*(t>=20); 

 y = [(0.*(t>=0&t<11)+1715.*(t>=11&t<12)+1927.*(t>=12&t<13)+1642.*(t>=13&t<14)+1817.*(t>=14&t<15)+1616.*(t>=15&t<16)+1272.*(t>=16&t<17)+1247.*(t>=17&t<18)+1405.*(t>=18&t<19)+1331.*(t>=19&t<20)+832.*(t>=20&t<21)+609.*(t>=21&t<22)+581.*(t>=22&t<23)+514.*(t>=23&t<24)+680.*(t>=24&t<25)+555.*(t>=25&t<26)+658.*(t>=26&t<27)+621.*(t>=27&t<28)+239.*(t>=28&t<29)+531.*(t>=29&t<30)+267.*(t>=30&t<31)+382.*(t>=31&t<32)+365.*(t>=32&t<33)+547.*(t>=33&t<34)+494.*(t>=34&t<35)+383.*(t>=35&t<36)+383.*(t>=36&t<37)+383.*(t>=37&t<38)+383.*(t>=38&t<39)+383.*(t>=39&t<40)+383.*(t>=40&t<41)+383.*(t>=41&t<42))-((h1*(1-s)*x(1)*(1-s)*(x(2)+x(3)))+h2*(1-s)*x(1)*(1-s)*x(4))/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6));
((h1*(1-s)*x(1)*(1-s)*(x(2)+x(3)))+h2*(1-s)*x(1)*(1-s)*x(4))/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6))+(0.*(t>=0&t<11)+0.063887.*(t>=11&t<12)+0.0679498.*(t>=12&t<13)+0.050311.*(t>=13&t<14)+0.048151.*(t>=14&t<15)+0.047521.*(t>=15&t<16)+0.40802.*(t>=16&t<17)+0.038306.*(t>=17&t<18)+0.039769.*(t>=18&t<19)+0.047210.*(t>=19&t<20)+0.037839.*(t>=20&t<21)+0.025810.*(t>=21&t<22)+0.020288.*(t>=22&t<23)+0.019649.*(t>=23&t<24)+0.020249.*(t>=24&t<25)+0.027252.*(t>=25&t<26)+0.032725.*(t>=26&t<27)+0.025894.*(t>=27&t<28)+0.008566.*(t>=28&t<29)+0.014349.*(t>=29&t<30)+0.009765.*(t>=30&t<31)+0.008978.*(t>=31&t<32)+0.011597.*(t>=32&t<33)+0.021730.*(t>=33&t<34)+0.030265.*(t>=34&t<35)+0.010857.*(t>=35&t<36)+0.010835.*(t>=36&t<37)+0.010757.*(t>=37&t<38)+0.010620.*(t>=38&t<39)+0.010420.*(t>=39&t<40)+0.010160.*(t>=40&t<41)+0.009841.*(t>=41&t<42))-x(2)*d;
d*x(2)*a-g*x(3)-j*k*x(3);%�����
d*x(2)*c-e*x(4);
j*k*x(3)-x(5)*f;
e*x(4)+f*x(5);
x(5)*f];


     %y = [(n_in.*(t>=0&t<8)+0.*(t>8))*(1-(0.00027.*(t>=0&t<1)+0.00032.*(t>=1&t<2)+0.00039.*(t>=2&t<3)+0.00047.*(t>=3&t<4)+0.00056.*(t>=4&t<5)+0.00068.*(t>=5&t<6)+0.00082.*(t>=6&t<7)+0.00097.*(t>=7&t<8)))-(h1*(1-s)*x(1)*(1-s)*(x(2)+x(3)+x(4))+2.5*h1*(1-s)*x(1)*(1-s)*x(5))/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6)+x(7));
%((h1*(1-s)*x(1)*(1-s)*(x(2)+x(3)+x(4))+2.5*h1*(1-s)*x(1)*(1-s)*x(5))/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6)+x(7)))+(n_in.*(t>=0&t<8)+0.*(t>8))*(0.00027.*(t>=0&t<1)+0.00032.*(t>=1&t<2)+0.00039.*(t>=2&t<3)+0.00047.*(t>=3&t<4)+0.00056.*(t>=4&t<5)+0.00068.*(t>=5&t<6)+0.00082.*(t>=6&t<7)+0.00097.*(t>=7&t<8))-x(2)*d;
%d*x(2)*a-g*x(3)-j*k*x(3);%�����
%d*x(2)*c-e*x(4);
%d*x(2)*b-j*k*x(5)-g*x(5);
%j*k*x(3)+j*k*x(5)-x(6)*f;
%e*x(4)+f*x(6);
%x(6)*f];