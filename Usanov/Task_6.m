clc
clear all

m0 = 9.10938e-31;
e = 1.6021773e-19;
hbar = 1.034e-34;
delta_z = 0.5e-11;


x_1=0;
m_eff = meff(x_1);
a = a0_x(x_1);
e = 1.6e-19;



U=[0.2 0.5 0.2]*e;
t = size(U);
N = t(2);
E = 0.45*e;



[D,E] = D_matrix_transp(ones(1,N)*m0,N,E,U,a,ones(1,N)*3,delta_z);
plot(E./e,D,'r','LineWidth', 3)
grid on
xlabel('E,eV')
ylabel('D, %')

