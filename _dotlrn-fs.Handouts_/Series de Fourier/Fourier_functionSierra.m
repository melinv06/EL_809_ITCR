%Serie de Fourier para una señal sierra
%Tiene simetría impar al considerar no tomar en cuenta el nivel CD
%Periodo de 2 segundos
%Amplitud de 0 a 2
%Coeficientes con solo parte imaginaria b_k
%Grafica una aproximación con 9999 coeficientes y luego superpone con el
%k-ésimo armónico.

T=2;
w=(2*pi)/T;
t = -1.5*pi:pi/50000:1.5*pi;
c_0 = 1;
k = 1;
x = c_0;

while k < 9999
    b = -2*(1/(pi*k));
    x = x + b*sin(k*w*t);
    k = k+1;
end
pause on;
figure(1);
clf;
hold on;
grid on;
plot(t,x,'k','Linewidth',2);
text(t(100001),x(100001),num2str(9999));
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
    b1 = -2*(1/(pi*k));
    x_1 = x_1 + b1*sin(k*w*t);
    plot(t,x_1,'r','Linewidth',2);
    text(t(100001),x_1(100001),num2str(k));
    title([ 'Serie de Fourier k= ',num2str(k)])
    k = k+1;
    pause(0.1);
end