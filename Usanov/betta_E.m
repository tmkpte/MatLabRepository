function [ betta ] = betta_E(meff, E,U  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
hbar = 1.034e-34;
betta = sqrt(2*meff*(U-E))./hbar;


end

