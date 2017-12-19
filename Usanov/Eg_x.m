function [ Eg ] = Eg_x( x )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
e = 1.60217e-19;
if x < 0.45
    Eg = (1.424 + 1.257*x)*e;
else
    Eg = (1.9 + 0.125*x + 0.143*x^2)*e;

end

