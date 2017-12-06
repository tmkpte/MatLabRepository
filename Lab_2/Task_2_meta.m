clear;
clc;
load ('const_here.mat');


n = 1e24;
m_eff = 0.067*m0;

E_f = FermiEnergy(n,m_eff);
T_f = E_f/k;
steps = 100;
count = 1000;
%count = 10000;
T = linspace(0.1, 1.2*T_f, steps);

%AnalyticalPart
%mu_2 = mu_analytical_2nd(T,m_eff,n);
%mu_4 = mu_analytical_4thbar(T,m_eff,n);




%NumericaPart
i = 1;
for t = linspace(0.1,1.2*T_f,steps)
mu_2(i) = E_f-pi^2/12.*(k*t).^2./(E_f); 
mu_4(i)= E_f-pi^2/12.*(k*t).^2./(E_f)-(7*pi^4)/(960)*(k.*t).^4./(E_f).^3;

mu_min=k*t*log(n/2*((2*pi*hbar^2)/(m_eff.*k.*t))^(3/2)); 
mu=linspace(mu_min,E_f,count); 

E_max=15*k*t+E_f; 
E=linspace(0,E_max,count)'; 
MU=repmat(mu,count,1); 
EB=repmat(E,1,count); 
delta=E(2)-E(1); %no matter which E(i) - E(i-1) was taken for this 

g_part=(sqrt(2*m_eff)*m_eff)/(pi^2*hbar^3); 
F=g_part*(sqrt(EB)./(1+exp((EB-MU)/(k*t)))); 
N=sum(F)*delta; 

[demp,indicator]=min(abs((N-n)/n)); 
mu_numeric(i)=mu(indicator); 
i=i+1; 
end 
%Plotting part
plot_mu(T,mu_numeric,mu_2,mu_4,E_f,steps);

T= 300;
n = 1e24;
solving300K(T,n,m_eff,count);