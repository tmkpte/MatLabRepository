clear all;
clc;

hbar = 1.064e-34;
e = 1.6e-19;
m0 = 9.1e-31;
m = 0.067*m0;
k = 8.617e-5;
T = 300;
kT = k*T;
Ef = 0.15;
magic_coef = (e^2)/(2*pi*hbar);
a = 5e-10;
t0 = (hbar^2)/(2*m*(a^2)*e);

n_points = 46; %LEFTx2 +center of profile
U_prof = U_back_n_prof();
% z = [1:length(u)];
% plot (z./100,u,'LineWidth',3);
% title('Potential Profile');
% ylabel('E,eV');
% grid on
H = Hamiltonian(t0,U_prof,n_points);
step_V = 100;
V_final = linspace(0,2,step_V);
I = 0;


for t = 1:step_V
    V = V_final(t);
    n_E = 201;
    E =linspace(-0.9, 0.9, n_E);
    mu_1 =Ef + V/2;
    mu_2= Ef - V/2;
    f1 = 1./(1+exp((E-mu_1)./kT));
    f2 = 1./(1+exp((E-mu_2)./kT));
    U = V/2*[ones(1,15), linspace(1, -1, 16), -1*ones(1,15)]';
    delta_E = E(2)-E(1);
    I_final(t) = I_Green(n_points,E,t0,U,U_prof,H,f1,f2,delta_E,n_E);
    I = 0;
end


%Drawing
figure
plot(V_final,I_final*10^6, 'r','LineWidth',3);
title('m_{eff} = 0.067\cdotm_e   a = 0.5 nm')
grid on
xlabel('Voltage,V')
ylabel('Current, \muA')
