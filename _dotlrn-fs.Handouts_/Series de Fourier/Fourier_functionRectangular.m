%Serie de Fourier para una señal rectangular
%Periodo de 4 segundos
%Amplitud de 0.5 
%Tau= 2segundos
%Centrada en el origen de tiempo, coeficientes solo con parte real a_k
%Grafica una aproximación con 9999 coeficientes y luego superpone una
%aproximación hasta un k-ésimo coeficiente. 

T=4;
w=(2*pi)/T;
t = -2*pi:pi/50000:2*pi;
c_0 = 1/T;
k =1;
x = c_0;

while k < 999
    a = ((-1)^((k-1)/2))*(1/(pi*k));
    x = x + a*cos(k*w*t);
    k = k+2;
end


figure(1);
clf;
hold all
grid on;
plot(t,x,'k','Linewidth',2);
text(t(200001),x(200001),num2str(9999));
title([ 'Serie de Fourier k= ',num2str(9999)]);
pause(1);


k =1;
x1 = c_0;

while k < 300
    a = ((-1)^((k-1)/2))*(1/(pi*k));
    x1 = x1 + a*cos(k*w*t);
    figure(1);
    clf;
    hold all;
    grid on;
    plot(t,x,'k','Linewidth',2);
    plot(t,x1,'r','Linewidth',2);
    text(t(200001),x1(200001),num2str(k));
    title([ 'Serie de Fourier k= ',num2str(k)]);
    pause(0.1);
    k = k+2;
end


