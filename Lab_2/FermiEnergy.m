function [ E ] = FermiEnergy( n,m )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
load ('const_here.mat');

E =(hbar^2.*(3*pi^2.*n).^(2/3))/(2*m);

end

