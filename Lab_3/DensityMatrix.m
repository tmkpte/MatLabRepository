clear all
clc


load('const_here.mat')
J2eV=1/eV2J;
kT =0;


mu = 0.02;
Np=100;
L=10e-9;
U=0;
n=[1:Np];
deltax=L/(Np+1);
x=(1:(Np))*deltax;
U=ones(Np,1)*U;
t0=hbar^2/(2*m0*deltax.^2);

H = diag(ones(Np,1)*2*t0+U)+diag(ones(Np-1,1)*(-t0),1)+diag(ones(Np-1,1)*(-t0),-1);
[psi,E]=eig(H);
E = diag(E)*J2eV;
I = ones((size(E)));

F_f_d = 1./((exp((E-mu*I)/kT))+1);
%plot(E,F_f_d)
%grid()
%axis([0 0.1 0 1.2])

ro_e = diag(F_f_d);
n = psi*ro_e*conj(psi');

%psi_2 = psi(2,:);
%plot(x*10e8,abs(psi_2).^2)

%plot(x*10e8,n(:,8))
%subplot(2,1,1)
%plot(x*10e8,n(:,2))
%axis([0 10 0 0.1])
%subplot(2,1,1)
%plot(x*10e8,n)
%grid()
%subplot(2,1,2)
%plot(E,F_f_d)
%grid()
%axis([0 0.1 0 1.2])


%subplot(2,1,2)

subplot(2,1,1)
plot(E*1000,F_f_d)
title('Fermi func')
xlabel('x,nm')
ylabel('F_{F-D}')
grid()
axis([0 100 0 1.2])

subplot(2,1,2)
plot(x*10e8, 2*diag(n));
grid()
xlabel('x,nm')
title('Electron Density')
figure
ro = 2*psi*ro_e*conj(psi');
a =mesh(x*10e8,x'*10e8,ro);
xlabel('x, nm')
ylabel('x`, nm')
zlabel('\rho')
title('Density Matrix')


