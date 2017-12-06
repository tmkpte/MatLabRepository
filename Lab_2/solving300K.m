function [ mu,mu2,mu4 ] = solving300K( T,n,m_eff,count )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
load('const_here.mat')
J2eV = 1/eV2J;




E_f = (3*n*(pi^2)*(hbar^3))^(2/3)/(2*m_eff); % 


% Analytical calculation. T = 300K;
mu_analytical_2nd = E_f - ((pi*k*T)^2)/(12*E_f);
mu_analytical_4th = mu_analytical_2nd - 7*(pi*k*T)^4/(960*E_f^3);

% Numerical calculation. T = 300K;
mu_min = k*T*log(n/2*(2*pi*(hbar)^2/(m_eff*k*T))^(3/2));
mu_max = E_f;
mu = linspace(mu_min, mu_max, count);

E_min = 0;
E_max = E_f+15*k*T;
E = linspace(E_min, E_max, count);

[muM, EM] = meshgrid(mu, E);

C = m_eff*(2*m_eff)^(1/2)/(pi^2*(hbar)^3);
F = C*EM.^(1/2)./( 1 + exp((EM - muM)/k*T) );

N = sum(F, 1)*E_max/(count); 
[demp, index] = min( abs((N-n)/n) );

fprintf('Analytical Solving for mu 2nd = %.7g eV\n', mu_analytical_2nd*J2eV);
fprintf('Analytical Solving for mu 4th = %.7g eV\n', mu_analytical_4th*J2eV);
fprintf('Numerical Solving mu = %.7g eV\n', mu(index)*J2eV);
%fprintf('Error (relation with 2nd) perc = %.7g \n', 100*abs(mu(index) - mu_analytical_2nd)/mu_analytical_2nd);
%fprintf('Error (relation with 4th) perc = %.7g \n', 100*abs(mu(index) - mu_analytical_4th)/mu_analytical_4th);


end

