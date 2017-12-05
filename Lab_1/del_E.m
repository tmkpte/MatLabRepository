function [ dE ] = del_E( Ef  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 %Plank bar
hbar = 1.0546e-34; %Plank bar
m = 9.11e-31; %Mass of electron
k = 1.380e-23;


dE =2*pi^2*hbar^3./(sqrt(2*m^3*Ef));


end

