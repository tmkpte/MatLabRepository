function [ D,ksi,A3,A1 ] = D_E_func( gamma1,m1,gamma2,m2,gamma3,m3 ,a,E,Eg1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

ksi = (gamma1/m1 + gamma2/m2).*(gamma2/m2 + gamma3/m3).*exp(i*(gamma3-gamma2).*a*10^-9)+(gamma1/m1 - gamma2/m2).*(gamma2/m2 - gamma3/m3).*exp(i*(gamma3+gamma2).*a*10^-9);
A1 = 0.2;
A3 = A1*4*gamma1.*gamma2./(m1*m2)./ksi;

t = size(E);
D = zeros(1,t(2));
for j = [1:t(2)]
    if E(j) >= Eg1/2
        D(j) = (abs(A3(j)).^2)/(A1^2);
    else
        D(j) = 0;
    end
end


end

