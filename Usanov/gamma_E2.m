function [ gamma ] = gamma_E2( meff,E,U )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
hbar = 1.034e-34;
gamma = sqrt(2*meff*(E-U))./hbar;


end

