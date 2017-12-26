function [ mu ] = mu_analytical_4th( T, E_f )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
load('const_here.mat')
%E_f = (3*n*pi^2*hbar^3)^(2/3)/(2*meff);
mu = E_f - (pi*k*T).^2./(12*E_f) -7*(pi*k*T).^4./(960*E_f^3);

end

