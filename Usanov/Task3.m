x_a = 0;
m_a = meff(x_a);
x_b =  0.3;
m_b = meff(x_b);
a = 20*a0_x(x_a)*10^9;
e = 1.60217e-19;
U = (Eg_x(x_b) -Eg_x(x_a))/2; %Potetial Bar Hight
z = [-2*a:0.005*a:2*a];
U_profi = Ec(a,z,U);
E = [0.0236,0.09266, 0.18521]*e;
gamma = gamma_E(m_a,E);
betta = betta_E(m_b,E,U);
[Psi_1] = Psi_E(z,betta(1),gamma(1),m_a,m_b, a);
[Psi_2] = Psi_E(z,betta(2),gamma(2),m_a,m_b, a);
[Psi_3] = Psi_E(z,betta(3),gamma(3),m_a,m_b, a);




plot(z, U_profi, 'LineWidth', 1.2);
hold on
t = size(z);
E_1 = ones(1,t(2))*E(1);
plot(z, Psi_1+max(E_1)/e)
hold on
E_2 = ones(1,t(2))*E(2);
plot(z, Psi_2+max(E_2)/e)
%E_3 = ones(1,t(2))*E(3);
%plot(z, Psi_3+max(E_3)/e)


%plot(z*10^9,abs(Psi_1).^2./(sum(abs(Psi_1).^2)) +max(E_1)/e);
%plot(z*10^9,E_1./e)
grid on
xlabel('z,nm')
title('20 monolayers')
legend('Symmetric Profile','E_1','E_2')


