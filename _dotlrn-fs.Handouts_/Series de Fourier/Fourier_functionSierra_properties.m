%Serie de Fourier para una señal sierra utilizando propiedades
%Escalado de 2 del valor
%Inversión de tiempo
%Escalado de 0.5 de la variable de tiempo
%Desplazamiento de 1 segundo en retraso
%Grafica una aproximación con 9999 coeficientes y luego superpone con el
%k-ésimo armónico.

T=2;
w=(1/2)*(2*pi)/T;
t = -3*pi:pi/50000:3*pi;
c_0 = 2;
k = 1;
x = c_0;

while k < 9999
    a = (-4*sin((pi*k)/2))/(pi*k);
    b = (4*cos((pi*k)/2))/(pi*k);
    
    x = x + a*cos(k*w*t) + b*sin(k*w*t);
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
    a1 = (-4*sin((pi*k)/2))/(pi*k);
    b1 = (4*cos((pi*k)/2))/(pi*k);
    
    x_1 = x_1 + a1*cos(k*w*t) + b1*sin(k*w*t);
    
    plot(t,x_1,'r','Linewidth',2);
    text(t(200001),x_1(200001),num2str(k));
    title([ 'Serie de Fourier k= ',num2str(k)])
    k = k+1;
    pause(0.1);
end