%Serie de Fourier para una señal triangular con simetría par
%Periodo de 4 segundos
%Amplitud de 0 a 2 
%Coeficientes con solo parte real a_k
%Grafica una aproximación con 9999 coeficientes y luego superpone con el
%k-ésimo armónico.


T=4;
w=(2*pi)/T;
t = -2*pi:pi/50000:2*pi;
c_0 = 1;
k =1;
x = c_0;

while k < 9999
    a = 8/(pi.^2*k.^2);
    x = x - a*cos(k*w*t);
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
x_1=c_0;

while k < 21
    figure(1);
    clf;
    hold on;
    grid on;
    a1 =  8/(pi.^2*k.^2);
    x_1 = x_1 - a1*cos(k*w*t);
    plot(t,x,'k','Linewidth',2);
    plot(t,x_1,'r','Linewidth',2);
    text(t(200001),x_1(200001),num2str(k));
    title([ 'Serie de Fourier k= ',num2str(k)])
    k = k+2;
    pause(0.1);
end




