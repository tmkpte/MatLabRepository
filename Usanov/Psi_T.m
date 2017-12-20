function [ Psi ] = Psi_T( gamma1,gamma2,gamma3, m1,m2,m3,z,a )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

ksi = (gamma1/m1 + gamma2/m2)*(gamma2/m2 + gamma3/m3)*exp(i*(gamma3-gamma2)*a*10^-9)+(gamma1/m1 - gamma2/m2)*(gamma2/m2 - gamma3/m3)*exp(i*(gamma3+gamma2)*a*10^-9);
A1 = 0.2;
A3 = A1*4*gamma1*gamma2/(m1*m2)/ksi;

A2 = (gamma2/m2+gamma3/m3)/(2*gamma2/m2)*A3*exp(i*(gamma3-gamma2)*a*10^-9);
B2 = (gamma2/m2-gamma3/m3)/(2*gamma2/m2)*A3*exp(i*(gamma3+gamma2)*a*10^-9);
B1 = A2+B2 - A1;

psi_1 = A1.*exp(i*gamma1*z*10^-9) +B1.*exp(-1*i*gamma1*z*10^-9);
psi_2 =A2.*exp(i*gamma2*z*10^-9) +B2.*exp(-1*i*gamma2*z*10^-9);
psi_3 = A3.*exp(i*gamma3*z*10^-9);


t = size(z);
psi = zeros(1,t(2));
for j = [1:t(2)]
    if z(j) < 0
        psi(j) = psi_1(j);
    elseif z(j) > a
        psi(j) = psi_3(j);
    else
        psi(j) = psi_2(j);
    end
end

Psi = abs(psi).^2;




end

