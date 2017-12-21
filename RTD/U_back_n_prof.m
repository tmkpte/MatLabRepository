function [ U ] = U_back_n_prof(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


U = [zeros(15,1); 0.3*ones(4,1); zeros(8,1); 0.3*ones(4,1); zeros(15,1)];
u = [zeros(15*100,1); 0.3*ones(4*100,1); zeros((8)*100,1); 0.3*ones(4*100,1); zeros(15*100,1)];
z = [1:length(u)];
plot (z./100,u,'LineWidth',3);
title('Potential Profile');
ylabel('E,eV');
xlabel('a');
grid on

end

