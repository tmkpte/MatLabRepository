me = 9.1e-31;
e = 1.6e-19;
hbar = 1.034e-34;
a0 = 0.563e-9;
a = 20*a0;
z = [-a/2:.001*a:a/2];

E_an = E_analyt([1:5],me*0.067,a);
E_an_eV = E_an./e;
Psi_1 = Psi_analyt(z,1,a);
Psi_2 = Psi_analyt(z,2,a);
Psi_3 = Psi_analyt(z,3,a);
Psi_4 = Psi_analyt(z,4,a);

%Plotting
plot(z*10^9,abs(Psi_1).^2);
hold on
plot(z*10^9,abs(Psi_2).^2);
plot(z*10^9,abs(Psi_3).^2);
plot(z*10^9,abs(Psi_4).^2);
legend('n = 1','n = 2','n = 3','n = 4');
title('|\psi(z)|^{2}')
xlabel('z, nm')
ylabel('|\psi|^{2}')
grid on
hold off
figure
t = size(z);
E_1 = ones(1,t(2))*E_an_eV(1);
plot(z*10^9,E_1);
hold on
plot(z*10^9,ones(1,t(2))*E_an_eV(2));
plot(z*10^9,ones(1,t(2))*E_an_eV(3));
plot(z*10^9,ones(1,t(2))*E_an_eV(4));
hold off
title('Energy levels');
legend('n = 1','n = 2','n = 3','n = 4');
xlabel('z,nm')
ylabel('E, eV')
grid on




