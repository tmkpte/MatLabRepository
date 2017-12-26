function [ mu ] = mu_numeric( T,m_eff,g,n ,count)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
load('const_here.mat');
E_f = (3*n*pi^2*hbar^3)^(2/3)/(2*m_eff);
mu = zeros(size(T));
step = 200;
findif = round(length(T)/step);


for i= 1:findif
    start = 1 +(i-1)*step;
    finish = step*i;
    if (finish >length(T))
        finish = length(T);
    end
    T_ =T(start:finish);
    len = finish - start +1;
    
    min_mu = k*T_.*log(n/2*(2*pi*(hbar)^2./(m_eff*k.*T_)).^(3/2));
    mu_prop = zeros(1,len*count);
    for j = 1:len
        mu_prop(1+(j-1)*count:count*j) = linspace(min_mu(j), E_f, count);
    end
    
    E_max = E_f+15*k*T_;
    E = zeros(1,len*count);
    
    for j = 1:len
        E(1+(j-1)*count:count*j) = linspace(0, E_max(j), count);
    end
    
    muM = reshape((ones(count, 1)*mu_prop), count, count, []); 
    EM = permute(reshape((ones(count, 1)*E), count, count, []), [2, 1, 3]);
    
    kTM = reshape(ones(count, 1)*k*T_, count, 1, []).*ones(1, count);
    F = g*EM.^(1/2)./( 1 + exp((EM - muM)./kTM)) ;
    
    clear muM EM kTM E;
    
    
    EM = permute(reshape(ones(count, 1)*EM, count, 1, []), [2, 1, 3]);
    N = sum(F).*EM./(count-1);
    [muErr, muIndex] = min( abs((N-n)/n) );
    clear N muErr EM F
    
    mu = vec2mat( mu_prop, count);
    muIndex = reshape(muIndex, 1, []);
    mu(start:finish) = mu_prop(sub2ind(size(mu_prop), 1:len, muIndex));
    
    clear muIndex mu_prop 
end
    
        





end

