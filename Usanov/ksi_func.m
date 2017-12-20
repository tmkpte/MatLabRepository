function [ D ] = D_E_func( gamma1,m1,gamma2,m2,gamma3,m3 ,a,E,Eg1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

ksi = (gamma1./m1 + gamma2./m2).*(gamma2./m2 + gamma3./m3).*exp(i*(gamma3-gamma2)*a)...
    +(gamma1./m1 - gamma2./m2).*(gamma2./m2 - gamma3./m3).*exp(i*(gamma3+gamma2)*a);
A1 = 0.2;
A3 = 4*gamma1.*gamma2./(m1*m2)./(ksi)*A1;

t = size(E);
D = zeros(1,t(2));
for j = [1:t(2)]
    if E(j) >= Eg1/2
        D(j) = gamma3(j)/gamma1(j)*(m3/m1).*(abs(A3(j)).^2)./(A1^2);
    else
        D(j) = 0
    end
end


end

