%%
%Constants
k=2000; b=1200; m=100
%% 
%Initial Conditions
xs(1)=-0.02; vm(1)=0; t(1)=0; timestep=0.01; Ft(1)=0; spe(1)=0.5*k*(xs(1))^2
xanalytical(1)=0.02;

%%
%Forward Euler Method

for ii=1:(8/timestep)
   t(ii+1)=t(ii)+timestep;
 
   if t(ii+1)<=2
       Ft(ii+1)=75*t(ii+1)
       %Ft(ii+1)=0;
   elseif t(ii+1)<=4
       Ft(ii+1)=300-75*t(ii+1)
       %Ft(ii+1)=0;
   else
       Ft(ii+1)=0
   end
   
   a(ii)=Ft(ii)-k*xs(ii)-b*vm(ii)/m;
   vm(ii+1)=vm(ii)+a(ii)*timestep;
   xs(ii+1)=xs(ii)+vm(ii+1)^2;
   vs(ii)=vm(ii);
   vs(ii)=(Ft(ii)-k*xs(ii))/b;
   sp(ii)=k*xs(ii)*vs(ii);
   dp(ii)=b*vs(ii)^2;
   xs(ii+1)=xs(ii)+vs(ii)*timestep;
   spe(ii+1)=0.5*k*xs(ii+1)^2;
   deltsp(ii)=(spe(ii+1)-spe(ii))/timestep;
   xanalytical(ii+1)=-0.02*exp(-k/b.*t(ii+1));
end

%%
%Plotting
figure(1)
plot(t,xs,t,xanalytical,'--');
xlabel('Time (s)');
ylabel('Spring Displacement (m)');
legend('Euler Approximation (dt=0.01s)','Analytical Solution')
title('Spring Displacement');
%%%
figure(2)
plot(t(1:end-1),vs);
xlabel('Time (s)');
ylabel('Spring Velocity (m/s)');
legend('Spring Velocity (m/s)');
title('Spring Velocity');
%%%
figure(3)
plot(t,Ft);
xlabel('Time (s)');
ylabel('Force (N)');
legend('Force T (N)');
title('Force Applied');
%%%
figure(4)
plot(t,spe);
xlabel('Time (s)');
ylabel('Energy (J)');
legend('Energy (J)');
title('Spring Energy');
%%%
figure(5)
plot(t(1:end-1),sp);
xlabel('Time (s)');
ylabel('Power (W)');
legend('Power (W)');
title('Spring Power');
%%%
figure(6)
plot(t(1:end-1),dp);
xlabel('Time (s)');
ylabel('Power (W)');
legend('Damper Power (W)');
title('Damper Power');