function [ E ] = E_analyt( n,meff,a )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
hbar = 1.034e-34;
E = hbar^2/(2*meff)/(a^2).*(n*pi).^2;

end

