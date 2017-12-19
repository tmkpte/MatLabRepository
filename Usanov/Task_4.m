e = 1.60217e-19;
x_a = 0;
x_b = 0.4;
m_a = meff(x_a);
m_b = meff(x_b);
Eg_a = Eg_x(x_a);
Eg_b = Eg_x(x_b);
a = 20*a0_x(x_a)*10^9;
%z = [-20*a:0.01*a:20*a];
z = [-2*a:0.005*a:2*a];

V = (Eg_b - Eg_a)/2;
U = Ec_step(z,V);
E = [0.1,0.2,V/e, 0.3,0.4]*e;
%gamma1
%gamma2
gamma1 = gamma_E(m_a,E);
gamma2 = gamma_E2(m_b,E,V);

%Psi
Psi1 = Psi_E_step(gamma1(1),gamma2(1),z);
Psi2 = Psi_E_step(gamma1(2),gamma2(2),z);
Psi3 = Psi_E_step(gamma1(3),gamma2(3),z);
Psi4 = Psi_E_step(gamma1(4),gamma2(4),z);
Psi5 = Psi_E_step(gamma1(5),gamma2(5),z);


plot(z, U, 'LineWidth',3);
grid on
hold on
plot(z, Psi1 +max(E(1))/e);
plot(z, Psi2 +max(E(2))/e);
plot(z, Psi3 +max(E(3))/e);
plot(z, Psi4 +max(E(4))/e);
plot(z, Psi5 +max(E(5))/e);
xlabel('z,nm')
ylabel('E,eV')
legend('Profile','E_1 = 0.1 eV','E_2 = 0.2 eV','E_3 = U_0','E_4 = 0.3 eV','E_5 = 0.4 eV');
hold off

%part 2
figure
E_rd = [E(1):0.01*E(1):E(end)+E(1)];
R = (gamma_E(m_a,E_rd) -gamma_E2(m_b,E_rd,V)).^2./((gamma_E(m_a,E_rd) +gamma_E2(m_b,E_rd,V)).^2);
plot(E_rd/e,abs(R),'LineWidth',3)
grid on
title('R and D vs E')
xlabel('E,eV')
ylabel('R (D), %')
hold on

t = size(E_rd);
D = zeros(1,t(2));
for j = [1:t(2)]
    if E_rd(j) < V
        D(j) = 0;
    else
        D(j) = (4*gamma_E(m_a,E_rd(j)).*gamma_E2(m_b,E_rd(j),V))./((gamma_E(m_a,E_rd(j)) +gamma_E2(m_b,E_rd(j),V)).^2);
    end
end
plot(E_rd/e,abs(D),'LineWidth',3)
hold off
legend('R','D')


