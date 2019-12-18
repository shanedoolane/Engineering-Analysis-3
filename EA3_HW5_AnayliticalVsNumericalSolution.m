%%
%matrix Allocation
t   = 0:.1:8;
x   = zeros(1,length(t));
vs  = zeros(1,length(t));
vm  = zeros(1,length(t));
am  = zeros(1,length(t));
x2  = zeros(1,length(t));
vs2 = zeros(1,length(t));
vm2 = zeros(1,length(t));
am2 = zeros(1,length(t));
xa  = zeros(1,length(t));
xa2 = zeros(1,length(t));
%%
%Constants
k1     = 1000;
m      = 250;
dt     = 0.1;
x(1)   = .3;
vm(1)  = 0;
x2(1)  = .3;
vm2(1) = .8;
%%
%Solutions
for ii= 1:(length(t)-1)
    vs(ii)=vm(ii);
    am(ii)=(-k1*x(ii))/m;
    x(ii+1)=x(ii)+vs(ii)*dt;
    vm(ii+1)=vm(ii)+am(ii)*dt;
end

for ii= 1:length(t)
    xa(ii)=.3*cos(sqrt(k1/m)*t(ii));
end

for ii= 1:(length(t)-1)
    vs2(ii)=vm2(ii);
    am2(ii)=(-k1*x2(ii))/m;
    x2(ii+1)=x2(ii)+vs2(ii)*dt;
    vm2(ii+1)=vm2(ii)+am2(ii)*dt;
end

for ii=1:length(t)
    xa2(ii)=(.3*cos(sqrt(k1/m)*t(ii)))+...
        (.8*(sqrt(m/k1))*sin(sqrt(k1/m)*t(ii)));
end

%%
%Plotting
figure(1)
plot(t,x,'r-',t,xa,'g-',t,x2,'b-',t,xa2,'y-')
title('Plot of Displacement of spring (m) ')
xlabel('Time (s)')
ylabel('Displacement (m)')
legend({'Euler''s Scenario 1','Analytical in Scenario 1',...
    'Euler''s in Scenario 2','Analytical in Scenario 2'},...
    'Location','northwest')