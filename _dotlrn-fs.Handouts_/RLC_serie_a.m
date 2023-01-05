%Circuito RLC serie. Análisis de resonancia. Respuesta en Frecuencia 
%R_1: valor de la resistencia
%C_1: valor de la capacitancia
%L_1: valor de la inductancia

deltaw = 0.5;
steps = 20000/0.5;  
w = zeros(1,steps);%Frecuencia
Z = zeros(1,steps);%Impedancia equivalente
Zmag = zeros(1,steps);%Magnitud de Zeq
Zang= zeros(1,steps);%Fase de Zeq
H = zeros(1,steps); %Con señal de la salida VR(w) y entrada Vs(w)
A = zeros(1,steps); 
B = zeros(1,steps); 
Hmag = zeros(1,steps);
Hang= zeros(1,steps);
H2 = zeros(1,steps); %Con señal de salida VLC(w) y entrada Vs(w)
A2 = zeros(1,steps); 
B2 = zeros(1,steps); 
Hmag2 = zeros(1,steps);
Hang2= zeros(1,steps);
R_1 = 1; 
L_1 = 0.01;
C_1 = 0.000001;

clf

for n = 1:steps
    w(n) = 0 + deltaw*(n-1);
end

for n=2:steps
    Z(n) = R_1 + (1/(1i*w(n)*C_1))+1i*w(n)*L_1; %Z(w) impedancia del circuito serie
    Zmag(n) = abs(Z(n));
    Zang(n) = angle(Z(n))*(180/pi);
    
    %Primera respuesta en frecuencia
    A(n) = 1i*w(n)*R_1;
    B(n) = (1i*w(n)).^2*L_1+1i*w(n)*R_1+1/C_1;
    H(n) = A(n)/B(n);
    Hmag(n) = abs(H(n));
    Hang(n) = angle(H(n))*(180/pi);
    
    %Segunda respuesta en frecuencia
    A2(n) = (1i*w(n)).^2*L_1+(1/C_1);
    B2(n) = (1i*w(n)).^2*L_1+1i*w(n)*R_1+1/C_1;
    H2(n) = A2(n)/B2(n);
    Hmag2(n) = abs(H2(n));
    Hang2(n) = angle(H2(n))*(180/pi);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Impedancia del circuito RLC Serie
figure(1);
clf;
subplot(2,1,1);
hold on;
grid on;
plot(w,Zmag,'k','Linewidth',2);
title('Magnitud de Z');
xlabel('Frecuencia (krad/s)');
ylabel('Magnitud');
xlim([0 20000]);
set(gca,'XTick',0:1000:20000) 
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'})

subplot(2,1,2);
hold on;
grid on;
plot(w,Zang,'k','Linewidth',2);
title('Fase de Z');
xlabel('Frecuencia (krad/s)');
ylabel('Fase (grados)');
xlim([0 20000]);
set(gca,'XTick',0:1000:20000) 
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'})

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Respuesta en frecuencia H(w). Salida VR(w) y entrada Vs(w)
figure(2);
clf;
subplot(2,1,1);
hold on;
grid on;
plot(w,Hmag,'k','Linewidth',2);
title('Magnitud de H');
xlabel('Frecuencia (krad/s)');
ylabel('Magnitud');
xlim([0 20000]);
set(gca,'XTick',0:1000:20000) 
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'})

subplot(2,1,2);
hold on;
grid on;
plot(w,Hang,'k','Linewidth',2);
title('Fase de H');
xlabel('Frecuencia (krad/s)');
ylabel('Fase (grados)');
xlim([0 20000]);
set(gca,'XTick',0:1000:20000) 
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'})

%Bode
figure(3);
clf;

a = L_1;
b = R_1;
c = 1/C_1;
d = 0;
e = R_1;
f = 0;
Func=tf([d e f],[a b c]);
Func2=Func^1;
bode(Func2,{0.1,1000000},'k');
legend('H(w)=VR(w)/Vs(w)')
hold on;
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Respuesta en frecuencia H2(w). Salida VLC(w) y entrada Vs(w)
figure(4);
clf;
subplot(2,1,1);
hold on;
grid on;
plot(w,Hmag2,'k','Linewidth',2);
title('Magnitud de H');
xlabel('Frecuencia (krad/s)');
ylabel('Magnitud');
xlim([0 20000]);
set(gca,'XTick',0:1000:20000) 
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'})

subplot(2,1,2);
hold on;
grid on;
plot(w,Hang2,'k','Linewidth',2);
title('Fase de H');
xlabel('Frecuencia (krad/s)');
ylabel('Fase (grados)');
xlim([0 20000]);
set(gca,'XTick',0:1000:20000) 
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'})

%Bode
figure(5);
clf;

a = L_1;
b = R_1;
c = 1/C_1;
d = L_1;
e = 0;
f = 1/C_1;
Func=tf([d e f],[a b c]);
Func2=Func^1;
bode(Func2,{0.1,1000000},'k');
legend('H(w)=VLC(w)/Vs(w)')
hold on;
grid on;