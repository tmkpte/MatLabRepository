function [ Psi ] = Psi_E_step( gamma1,gamma2,z )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
A1 = 0.08;
B1 = A1*(gamma1-gamma2)/(gamma1+gamma2);
A2 = A1*2*gamma1/(gamma1+gamma2);


psi_1 = A1.*exp(i*gamma1*z*10^-9) + B1.*exp(-1*i*gamma1*z*10^-9);
psi_2 = A2.*exp(i*gamma2*z*10^-9);

t = size(z);
Psi = zeros(1,t(2));
for j = [1:t(2)]
    if (z(j) < 0)
        Psi(j) = abs(psi_1(j)).^2;
    else
        Psi(j) = abs(psi_2(j)).^2;
    end
end
        


end

