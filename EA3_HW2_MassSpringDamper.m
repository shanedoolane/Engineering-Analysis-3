%%
%part 1
x=[];t=[];vs=[];timestep=0.5;x(1)=0.03;t(1)=0;
for ii=1:10
    vs(ii)=(-1500/1000)*x(ii);
    x(ii+1)=x(ii)+vs(ii)*timestep;
    t(ii+1)=t(ii)+timestep;
end
x2=[];t2=[];vs2=[];timestep2=0.1;x2(1)=0.03;t2(1)=0;
for ii=1:50
    vs2(ii)=(-1500/1000)*x2(ii);
    x2(ii+1)=x2(ii)+vs2(ii)*timestep2;
    t2(ii+1)=t2(ii)+timestep2;
end
%%
%part 2
numsolvetime = [0:0.0001:5];
numsolvedisp = exp(-1.5*numsolvetime)*0.03;
%%
%plot
plot(t,x,'red',t2,x2,'blue',numsolvetime,numsolvedisp,'black');
xlabel('T (seconds)')
ylabel('Displacement (m)');
legend('Timestep = 0.5s', 'Timestep = 0.1s', 'Analytical Solution');
title('Euler Approximation (dt = 0.1,0.5) vs Analytical Solution')

%%
%part 2
figure (2)
t=[];x=[];v3=[];timestep=0.01;t(1)=0;x(1)=-0.02;v3(1)=0
a=[];v2=[];
for ii=1:300
   v2(ii)=v3(ii);
   a(ii)=-(1/100)*(2000*x(ii)+1200*v3(ii));
   x(ii+1)=x(ii)+v2(ii)*timestep;
   v3(ii+1)=v3(ii)+a(ii)*timestep;
   t(ii+1)=t(ii)+timestep;
end
%%
%plot
plot(t,x)
title('Time vs Spring Displacement');
xlabel('Time (s)')
ylabel('Spring Displacement (m)');
figure(3)
plot(t,v3)
title('Time vs Mass 3 Velocity');
xlabel('Time (s)')
ylabel('Mass 3 Veolocity (m/s)');