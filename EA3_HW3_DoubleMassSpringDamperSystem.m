%%
%Constants
g=9.8;k1=100000;b2=10000;m3=1000;k4=20000;b5=2000;m6=60;
%%
%Initial Condtions and Setup
T=[0:0.01:2];
x=zeros(4,length(T));
f6=zeros(1,length(T));
x6(1)=1;
a=[-0.104,0,0,-0.0294;-k1/m3,(-b2-b5)/m3,k4/m3,b5/m3;0,-1,0,1;0,b5/m6,-k4/m6,-b5/m6];
timestep=0.01;
vroad=0.1*cos(10.*T);
%%
%forward Euler method
for ii = 1:size(T,2)-1
    
    f6(ii)=m6*g+k4*x(3,ii)+b5*(x(4,ii)-x(2,ii));
    
    b(:,ii)=[-vroad(ii);b2/m3*vroad(ii)-g;0;f6(ii)/m6-g];
    
    dxdt(:,ii)=a*x(:,ii)+b(:,ii);
    
    x(:,ii+1) = x(:,ii)+dxdt(:,ii).*timestep;
    
    x6(ii+1)=x6(ii)+x(4,ii)*timestep;
end

%%
%plots

figure(1);
plot(T,x(4,:))
title('V6(t)')
xlabel('Time (Seconds)');
ylabel('M6 Velocity (m/s)');

figure(2)
plot(T,x6)
title('X6(t)')
xlabel('Time (Seconds)');
ylabel('M6 Displacement, (m/s)');

figure(3);
plot(T,f6)
title('F6(t)');
xlabel('T (seconds)');
ylabel('F6 (N)');
