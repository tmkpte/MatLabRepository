hbar = 1.0546e-34; %Plank bar
m0 = 9.11e-31; %Mass of electron
k = 1.380e-23; %Bolzman Const
del_n = 2;
n = [10e24:10e24:10e28];
n_1 = [1e22,2e22,5e22];
J2eV = 1/(1.6e-19);


Ef = E_f(n);
%Ef*J2eV;
dE = del_E(Ef)*J2eV;


sprintf('dE : %2.3g eV\nConcetration: %2.3g m^-3\n', del_E(E_f(n_1(1)))*J2eV,n_1(1))
sprintf('dE : %2.3g eV\nConcetration: %2.3g m^-3\n', del_E(E_f(n_1(2)))*J2eV,n_1(2))
sprintf('dE : %2.3g eV\nConcetration: %2.3g m^-3\n', del_E(E_f(n_1(3)))*J2eV,n_1(3))


subplot(2,1,1)
loglog(n,dE)
title('lg(dE) VS lg(n)')
xlabel('$m^{-3}$','Interpreter','latex')
ylabel('eV')
grid on



subplot(2,1,2)
semilogx(n,Ef*J2eV)
title('Ef VS lg(n)')
xlabel('$m^{-3}$','Interpreter','latex')
ylabel('eV')
grid on


[x,y] = ginput;
h1 = text(x,del_E(E_f(x))*J2eV,'*','HorizontalAlignment','center', 'Color',[1 0 0], 'FontSize',10);
%Eprom= E_f(x)*J2eV;
h = msgbox(sprintf(' dE is equal to %2.3g eV\n n is equal to %2.3g m^-3 \n',del_E(E_f(x))*J2eV,x));


%sprintf('dE : %2.3g eV\nConcetration: %2.3g m^-3\n', del_E(E_f(x))*J2eV,x)


