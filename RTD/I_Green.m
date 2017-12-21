function [ I ] = I_Green( n_points,E,t0,U,U_prof,H,f1,f2,delta_E,n_E )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
hbar = 1.064e-34;
e = 1.6e-19;
magic_coef = (e^2)/(2*pi*hbar);
complex_small = 0 +i*1e-22;
I = 0;
for j = 1:n_E
        
        sig1 = zeros(n_points);
        sig2 = zeros(n_points);
        
        c = 1-((E(j)+complex_small -U(1) - U_prof(1))/(2*t0));
        ka = acos(c);
        
        sig1(1,1) = -t0*exp(i*ka);
        gam1 = i*(sig1 - sig1');
        
        c = 1-((E(j)+complex_small -U(n_points) - U_prof(n_points))/(2*t0));
        ka = acos(c);
        
        sig2(n_points,n_points) = -t0*exp(i*ka);
        gam2 = i*(sig2 - sig2');
        
        t = ((E(j) +complex_small)*eye(n_points)) -H -diag(U) -sig1 - sig2;
        G = inv(((E(j) +complex_small)*eye(n_points)) -H -diag(U) -sig1 - sig2);
        
        T(j) = real(trace(gam1/t*gam2*(G')));
        I = I +(delta_E*magic_coef*T(j)*(f1(j)-f2(j)));
end

end

