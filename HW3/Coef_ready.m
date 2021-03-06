clear all;
clc;

lambda_ksi = 0.01; %input('Enter lambda ksi interval: ');
lambda_eta = 0.01;%input('Enter lambda eta interval: ');
syms f_ksi f_eta t;

f_ksi(t) = lambda_ksi*exp(-lambda_ksi*t);
f_lap_ksi = laplace(f_ksi(t)); %,t,s);
P_ksi(t) = 1 - int(f_ksi(t), t, 0 ,t);
%P_ksi = 1 - F_ksi;
P_lap_ksi = laplace(P_ksi(t)); %t,s);



f_eta(t) = lambda_eta*exp(-lambda_eta*t);
f_lap_eta = laplace(f_eta(t)); %,t,s);
P_eta(t) = 1 - int(f_eta(t), t, 0 ,t);
%P_eta = 1 - F_eta;
P_lap_eta = laplace(P_eta(t)); %t,s);

Coef_of_ready = ilaplace(P_lap_ksi*(1+f_lap_ksi*f_lap_eta/(1-f_lap_ksi*f_lap_eta)));% t,s);
plot([0:1500], subs(Coef_of_ready,t,[0:1500]),'LineWidth',3);
%strmin = [' \lambda_{\ksi} = ',num2str(lambda_ksi)];
%text(1000,0.95,strmin,'HorizontalAlignment','left');
%strmin = ['\lambda_{\eta} = ',num2str(lambda_eta)];
%text(1000,0.94,strmin,'HorizontalAlignment','left');
title('Coef of ready, exp distrib');
xlabel('t, hours');
ylabel('Coef of ready');
grid on


