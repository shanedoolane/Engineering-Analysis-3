k=4/3;
b=0.25;
k2=0.5;
b2=1
Xs=[];
Fd=[];
for ii=1:13
    if Fd(ii)<0
        Vd(ii)=Fd(ii)/b2;
    else
        Vd(ii)=Fd(ii)/b;
    end
    if Fs(ii)<-4
        Xs(ii)=-3;
    elseif Fs(ii)>4
        Xs(ii)=3+(Fs(ii)-4)/k2;
    else
        Xs(ii)=Fs(ii)/k;
    end
end
Vs=Vd;
figure(1);
plot(Xs,Fs)
xlabel('Displacement of sprint (mm)');
ylabel('Fs');
title('Spring Response to Fs');

figure(2);
plot(Vd,Fd);
xlabel('Velocity (mm/s)');
ylavel('Fd');
title('Damper Response to Fd');

figure(3)
plot(Xs,Vs);
ylabel('Spring Velocity (mm/s)');
xlabel('Spring Displacement');
title('Relationship Between Spring Speed and Xs');
