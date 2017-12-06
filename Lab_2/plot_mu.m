function [  ] = plot_mu( T, munum,mu2,mu4,E_f,steps )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
load('const_here.mat')
%steps = 100;


kT = k*T;

plot(kT/E_f,munum/E_f);
title('Chemical Potential (numeric,analytic 2nd and 4th)');
hold on 
plot(kT/E_f,mu2/E_f); 
hold on 
plot(kT/E_f,mu4/E_f); 
legend('Numeric','Analytic 2nd','Analytic 4th') 
x=linspace(0,1.2,steps); 
y=x*0; 
plot(x,y,'--') 
xlabel('\it kT/E_F')
ylabel('\mu/E_F') 
grid()


end

