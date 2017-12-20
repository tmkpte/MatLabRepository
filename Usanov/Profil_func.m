function [ U ] = Profil_func( Eg1,Eg2,Eg3,z,a )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
e = 1.60217e-19;
t = size(z);
U = zeros(1,t(2));
for j = [1:t(2)]
    if z(j) < 0
        U(j) = Eg1;
    elseif z(j) > a
        U(j) = Eg3;
    else
        U(j) = Eg2;
    end
end


        


end

