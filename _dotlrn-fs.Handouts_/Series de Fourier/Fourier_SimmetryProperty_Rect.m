%Serie de Fourier para una señal rectangular impar
%Periodo de 4 segundos
%Amplitud de -0.5 a 0.5 
%Tau= 2segundos
%Coeficientes con solo parte imaginaria b_k
%Grafica una aproximación con 9999 coeficientes y luego superpone con el
%k-ésimo armónico. 

T=4;
w=(2*pi)/T;
t = -2*pi:pi/50000:2*pi;
c_0 = 0;
k =1;
x = c_0;

while k < 9999
    b = 2/(pi*k);
    x = x + b*sin(k*w*t);
    k = k+2;
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
    b1 = 2/(pi*k);
    x1 = x1 + b1*sin(k*w*t);
    figure(1);
    clf;
    hold on;
    grid on;
    plot(t,x,'k','Linewidth',2);
    plot(t,x1,'r','Linewidth',2);
    text(t(200001),x1(200001),num2str(k));
    title([ 'Serie de Fourier k= ',num2str(k)]);
    pause(0.1);
    k = k+2;
end