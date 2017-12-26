clc
clear all 

hbar=1.055e-34;
m=9.110e-31;
e=1.602e-19;
L=1e-9;


Lz1=5e-9;
E0_1=(hbar^2)*(pi^2)/(2*m*Lz1^2);
E0_1 = E0_1/e;
D_2d_1=zeros(1,101);
for p=1:25
E=linspace(0,0.25,101);
thet=(E+abs(E))./(2*E);
EE=E-(p*p*E0_1);
theta=(EE+abs(EE))./(2*EE);
D_2d_1=D_2d_1+((L^2)*e*m*theta./(2*pi*hbar^2));
D_max_3D_1=(L^3)*e*m*thet.*real((2*m*E*e).^0.5)./(2*pi^2*hbar^3);
end


clear thet
clear theta
Lz2=10e-9;
E0_2=(hbar^2)*(pi^2)/(2*m*Lz2^2);
E0_2 = E0_2/e;
D_2d_2=zeros(1,101);
for p=1:25
E=linspace(0,0.25,101);
thet=(E+abs(E))./(2*E);
EE=E-(p*p*E0_2);
theta=(EE+abs(EE))./(2*EE);
D_2d_2=D_2d_2+((L^2)*e*m*theta./(2*pi*hbar^2));
D_max_3D_2=(L^3)*e*m*thet.*real((2*m*E*e).^0.5)./(2*pi^2*hbar^3);
end

clear thet
clear theta
Lz3=25e-9;
E0_3=(hbar^2)*(pi^2)/(2*m*Lz3^2);
E0_3 = E0_3/e;
D_2d_3=zeros(1,101);
for p=1:25
E=linspace(0,0.25,101);
thet=(E+abs(E))./(2*E);
EE=E-(p*p*E0_3);
theta=(EE+abs(EE))./(2*EE);
D_2d_3=D_2d_3+((L^2)*e*m*theta./(2*pi*hbar^2));
D_max_3D_3=(L^3)*e*m*thet.*real((2*m*E*e).^0.5)./(2*pi^2*hbar^3);
end

subplot(1,3,1)
hold on
plot(D_2d_1,E);
plot(D_max_3D_1.*Lz1/L,E,'r');
axis([0 10 -0.1 0.25]);
legend('2D','3D');
xlabel(' D(E)')
ylabel(' E,eV')
grid on
title('L_z = 5 nm')

subplot(1,3,2)
hold on
plot(D_2d_2,E);
plot(D_max_3D_2.*Lz2/L,E,'r');
axis([0 20 -0.1 0.25]);
legend('2D','3D');
xlabel(' D(E)')
ylabel(' E,eV')
grid on
title('L_z = 10 nm')

subplot(1,3,3)
hold on
plot(D_2d_3,E);
plot(D_max_3D_3.*Lz3/L,E,'r');
axis([0 40 -0.1 0.25]);
legend('2D','3D');
xlabel(' D(E)')
ylabel(' E,eV')
grid on
title('L_z = 25 nm')

