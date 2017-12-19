function [ Psi ] = Psi_analyt( z,n,a )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if (mod(n,2)==0)
    Psi = sin(pi*n.*z./a);
else
    Psi = cos(pi*n.*z./a);
end

