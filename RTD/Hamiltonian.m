function [ H ] = Hamiltonian( t0,U ,n)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

H = diag(ones(n,1)*2*t0 + U) + diag(ones(n-1,1)*(-t0),1) + diag(ones(n-1,1)*(-t0),-1);
end

