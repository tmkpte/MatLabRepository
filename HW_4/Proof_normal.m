clear all;
clc;

lambda_ksi = 0.01; %input('Enter lambda ksi interval: ');
lambda_eta = 0.01;%input('Enter lambda eta interval: ');
m1 = 1000; %a
s1 = 300; %s
m2 = 200;%b
s2 = 30;%r
syms f_ksi f_eta t;

f_ksi(t) = 1/sqrt(2*pi*s1^2) * exp(-(t-m1)^2/(2*s1^2));
f_eta(t) = 1/sqrt(2*pi*s2^2) * exp(-(t-m2)^2/(2*s2^2));

f = laplace(f_ksi);
g = laplace(f_eta);
syms s;
f(s) = f;
g(s) = g;
omega_f(s) = f(s)/(1 - f(s)*g(s));
omega_g(s) = f(s)*g(s)/(1 - f(s)*g(s));

Coef_f_lap = (1 - f(s))/s*(1+omega_g(s));
Coef(t) = ilaplace(Coef_f_lap);

% Coef_of_ready = ilaplace(P_lap_ksi*(1+f_lap_ksi*f_lap_eta/(1-f_lap_ksi*f_lap_eta)));% t,s);
% plot([0:100:1500], subs(Coef_of_ready,t,[0:100:1500]),'LineWidth',3);
% %strmin = [' \lambda_{\ksi} = ',num2str(lambda_ksi)];
% %text(1000,0.95,strmin,'HorizontalAlignment','left');
% %strmin = ['\lambda_{\eta} = ',num2str(lambda_eta)];
% %text(1000,0.94,strmin,'HorizontalAlignment','left');
% title('Coef of ready, norm distrib');
% xlabel('t, hours');
% ylabel('Coef of ready');
% grid on

