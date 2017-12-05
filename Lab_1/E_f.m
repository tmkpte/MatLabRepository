function [ E ] = E_f( n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
hbar = 1.0546e-34; %Plank bar
m = 9.11e-31; %Mass of electron
k = 1.380e-23;
E = 1/(2*m)*hbar^2*(3*pi^2*n).^(2/3);

 
end

