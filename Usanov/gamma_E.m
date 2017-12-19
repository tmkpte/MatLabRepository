function [ gamma ] = gamma_E( meff,E )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
hbar = 1.034e-34;
gamma = sqrt(2*meff*E)./hbar;


end

