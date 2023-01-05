%Serie de Fourier para una señal de ventanas rectangulares

T=6;
w=(2*pi)/T;
t = -2*pi:pi/50000:2*pi;
c_0 = 0;
k = 1;
x = c_0;

while k < 9999
    a = 2/(pi*k);
    b = cos((2*pi*k)/(3))-cos((pi*k)/(3));
    x = x + a*b*sin(k*w*t);
    k = k+1;
end
pause on;
figure(1);
clf;
hold on;
grid on;
plot(t,x,'k','Linewidth',2);
text(t(200001),x(200001),num2str(9999));
title([ 'Serie de Fourier k= ',num2str(9999)])
pause(1);

k =1;
x_1=c_0;

while k < 21
    figure(1);
    clf;
    hold on;
    grid on;
    plot(t,x,'k','Linewidth',2);
    a1 = 2/(pi*k);
    b1 = cos((2*pi*k)/(3))-cos((pi*k)/(3));
    x_1 = x_1 + a1*b1*sin(k*w*t);
    plot(t,x_1,'r','Linewidth',2);
    text(t(200001),x_1(200001),num2str(k));
    title([ 'Serie de Fourier k= ',num2str(k)]);
    k = k+1;
    pause(0.1);
end