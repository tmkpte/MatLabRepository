function [Psi,psi_1 ] = Psi_E( z,betta,gamma,meff_a,meff_b,a )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
A1 = 3;
A2 = A1*1/2*(1-i*betta/gamma*(meff_a/meff_b))*exp((i*gamma - betta)*a/2*10^-9);
B2 = A1*1/2*(1+i*betta/gamma*(meff_a/meff_b))*exp((-i*gamma -betta)*a/2*10^-9);
B3 = A1*1/2*(1-i*betta/gamma*(meff_a/meff_b))*exp(i*gamma*a*10^-9) +A1*1/2*(1+i*betta/gamma*(meff_a/meff_b))*exp(-i*gamma*a*10^-9);


psi_1 = A1.*exp(betta.*z*10^-9);
psi_2 = A2.*exp(i*gamma*z*10^-9) +B2.*exp(-i*gamma*z*10^-9);
psi_3 = B3.*exp(-betta*z*10^-9);

t = size(z);
Psi = zeros(1,t(2));
for j = [1:t(2)]
    if z(j) < -a/2
        Psi(j) = abs(psi_1(j)).^2;
    elseif z(j) >a/2
        Psi(j) = abs(psi_3(j)).^2;
    else
        Psi(j) = abs(psi_2(j)).^2;
    end
end
      

end

