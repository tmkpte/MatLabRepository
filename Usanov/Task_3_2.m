e = 1.6021e-19;
x_a = 0;
m_a = meff(x_a);
Eag_x = Eg_x(x_a);

x_b = 0.3;
m_b = meff(x_b);
Ebg_x = Eg_x(x_b);

V = (Ebg_x - Eag_x)/2;
a = 20*a0_x(x_a)*10^9;
z = [-1.5*a:0.01*a:2*a];
U_z = Ec(a,z,V);


E_z = [0.0236, 0.09266, 0.18521]*e;
gamma = gamma_E(m_a,E_z);
betta = betta_E(m_b,E_z,V);
[psi_1,p] = Psi_E(z,betta(1),gamma(1),m_a,m_b,a);
%plot(z,U_z)
%hold on
%plot(z, psi_1)

