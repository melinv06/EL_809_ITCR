x = -6:0.04:6;
y = -2:0.04:2;
[X,Y]=meshgrid(x,y);
%f=1+0*(X+1i*Y);
%f=2*(X+1i*Y);%f(z)=2z
%f=(X+1i*Y);%f(z)=z
%f=2*(X+1i*Y)+1;%f(z)=2z+1
%f=sin(X+1i*Y);%f(z)=sin(z)
%f=cos(X+1i*Y);%f(z)=cos(z)
%f=exp(X+1i*Y);%f(z)=e^z
%f=(X+1i*Y).^2+1;%f(z)=z^2+1
%f=(X+1i*Y).^2-1;%f(z)=z^2-1
f= (2*(X+1i*Y).^2+2*(X+1i*Y)+2).^-1;%f(z)=2z^2+2z+2
%f=(X+1i*Y).^(-1);%f(z)=1/z
%f=(X+1i*Y+1).^(-1);%f(z)=1/(z+1)

figure(1);

clf;
subplot(1,2,1);
surfc(x,y,abs(f));
xlabel('Real');
ylabel('Imag');
colormap jet;


subplot(1,2,2);
surfc(x,y,angle(f));
xlabel('Real');
ylabel('Imag');
colormap winter;
