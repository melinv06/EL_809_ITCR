%Serie de Fourier para una señal seno 0 a 2 y 0 de 2 a 4
%Periodo de 4 segundos
%Amplitud de 1 
%Grafica una aproximación con 9999 coeficientes y luego superpone otra 
%aproximación donde va agregando el k-ésimo armónico.

T=4;
w=(2*pi)/T;
t = -2*pi:pi/50000:2*pi;
c_0 = 0;
k = 1;
x = c_0+(1/2)*sin(pi*t);
x_1 = c_0+(1/2)*sin(pi*t);

while k < 9999
    a = 4/(4*pi-pi*k.^2);
    x = x + a*cos(k*w*t);
    k = k+2;
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
while k < 29
    figure(1);
    clf;
    hold on;
    grid on;
    plot(t,x,'k','Linewidth',2);
    a = 4/(4*pi-pi*k.^2);
    x_1 = a*cos(k*w*t);
    plot(t,x_1,'r','Linewidth',2);
    text(t(200001),x_1(200001),num2str(k));
    title([ 'Serie de Fourier k= ',num2str(k)])
    k = k+2;
    pause(1);
end