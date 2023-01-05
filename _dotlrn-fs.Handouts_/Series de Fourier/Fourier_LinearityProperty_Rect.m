%Serie de Fourier para una señal de dos escalones
%Periodo de 4 segundos
%Amplitud de 0.5 primer escalón y 2 el segundo 
%Tau= 2segundos
%Coeficientes con parte real a_k y parte imaginaria b_k
%Grafica una aproximación con 9999 coeficientes y luego superpone con el
%k-ésimo armónico. 

T=4;
w=(2*pi)/T;
t = -2*pi:pi/50000:2*pi;
c_0 = 3/4;
k =1;
x = c_0;

while k < 9999
    a = (sin((pi*k)/2)*cos((pi*k)/2))*(1/(pi*k))+4*(sin((pi*k)/4)*cos((5*pi*k)/4))*(1/(pi*k));
    b = (sin((pi*k)/2)*sin((pi*k)/2))*(1/(pi*k))+4*(sin((pi*k)/4)*sin((5*pi*k)/4))*(1/(pi*k));
    x = x + a*cos(k*w*t)+b*sin(k*w*t);
    k = k+1;
end

figure(1);
clf;
hold on;
grid on;
plot(t,x,'k','Linewidth',2);
text(t(200001),x(200001),num2str(9999));
title([ 'Serie de Fourier k= ',num2str(9999)]);
pause(1);


k =1;
x1 = c_0;

while k < 29
    a1 = (sin((pi*k)/2)*cos((pi*k)/2))*(1/(pi*k))+4*(sin((pi*k)/4)*cos((5*pi*k)/4))*(1/(pi*k));
    b1 = (sin((pi*k)/2)*sin((pi*k)/2))*(1/(pi*k))+4*(sin((pi*k)/4)*sin((5*pi*k)/4))*(1/(pi*k));
    x1 = x1 + a1*cos(k*w*t)+b1*sin(k*w*t);
    figure(1);
    clf;
    hold on;
    grid on;
    plot(t,x,'k','Linewidth',2);
    plot(t,x1,'r','Linewidth',2);
    text(t(200001),x1(200001),num2str(k));
    title([ 'Serie de Fourier k= ',num2str(k)]);
    pause(0.1);
    k = k+1;
end