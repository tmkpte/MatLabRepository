function [ E ] = Ec_step( z,V )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
t = size(z);
E = zeros(1,t(2));
e = 1.60217e-19;

for j = [1:t(2)]
    if (z(j) < 0)
        E(j) = 0;
    else
        E(j) = V/e;
    end
end

end

