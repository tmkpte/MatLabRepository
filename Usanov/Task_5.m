clc
clear all

me = 9.10938e-31;
e = 1.6021773e-19;
hbar = 1.034e-34;


x_1 = 0;
x_2 = 0.3;
x_3 = 0;
m1 = meff(x_1);
m2 = meff(x_2);
m3 = meff(x_3);

Eg1 = Eg_x(x_1);
Eg2 = Eg_x(x_2);
Eg3 = Eg_x(x_3);
a = a0_x(x_2)*20*10^9;
z = [-2*a:0.005*a:2*a];

E1 = 0.5*e;
E2 = 1.5*e;
dE = (E2-E1)/1000;
E = [E1:dE:E2];

gamma1 = sqrt(2*m1*(E -Eg1/2))./hbar;
gamma2 = sqrt(2*m2*(E - Eg2/2))./hbar;
gamma3 = sqrt(2*m3*(E-Eg3/2))./hbar;

[D,ksi,A3,A1] = D_E_func(gamma1,m1,gamma2,m2,gamma3,m3,a,E,Eg1);





plot(E./e,abs(D),'r', 'LineWidth',2);
grid on
xlabel('E,eV')
ylabel('D, %')

%min max in python folders
%min max result
E_max = [0.931,1.027]*e;
E_min = [0.964, 1.094]*e;

gamma1_1_max = sqrt(2*m1*(E_max -Eg1/2))./hbar;
gamma2_2_max = sqrt(2*m2*(E_max - Eg2/2))./hbar;
gamma3_3_max = sqrt(2*m3*(E_max-Eg3/2))./hbar;

gamma1_1_min = sqrt(2*m1*(E_min -Eg1/2))./hbar;
gamma2_2_min = sqrt(2*m2*(E_min - Eg2/2))./hbar;
gamma3_3_min = sqrt(2*m3*(E_min-Eg3/2))./hbar;

Psi = Psi_T(gamma1_1_min(1), gamma2_2_min(1),gamma3_3_min(1),m1,m2,m3,z,a);


%Psi drawing
figure
U = Profil_func(Eg1/2,Eg2/2,Eg3/2,z,a);
plot(z,U./e,'LineWidth',3);
grid on
hold on
plot(z, Psi +E_min(1)/e);
Psi2 = Psi_T(gamma1_1_min(2), gamma2_2_min(2),gamma3_3_min(2),m1,m2,m3,z,a);
plot(z,Psi2+E_min(2)/e);
xlabel('z,nm')
ylabel('E,eV')
title('Minimum transit 20 layers')
hold off


figure
U = Profil_func(Eg1/2,Eg2/2,Eg3/2,z,a);
plot(z,U./e,'LineWidth',3);
grid on
hold on
Psi1 = Psi_T(gamma1_1_max(1), gamma2_2_max(1),gamma3_3_max(1),m1,m2,m3,z,a);
plot(z, Psi1 +E_max(1)/e);
Psi2 = Psi_T(gamma1_1_max(2), gamma2_2_max(2),gamma3_3_max(2),m1,m2,m3,z,a);
plot(z,Psi2+E_max(2)/e);
xlabel('z,nm')
ylabel('E,eV')
title('Maximum transit 20 layers')
hold off




