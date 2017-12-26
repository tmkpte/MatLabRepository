clear all;
clc;
hbar = 1.054e-34; 
m0 = 9.1e-31;  
meff = 0.1;  
melec =	meff*m0; 
eV2J = 1.6e-19;  
J2eV = 1/eV2J; 


U = [1 1]*eV2J;
a=1e-9; 


if (U(1)~=0 && U(2)~=0) 
     k_max = sqrt(2*melec*min(U))/hbar;
     k = linspace(0,k_max);
     F_1 = pi-asin(k*hbar/sqrt(2*melec*U(1)))-asin(k*hbar/sqrt(2*melec*U(2)));
     F_2 = k*a;
     difference = abs(F_2-F_1);
     difference1 =min(difference);
     inDex = 0;
     for i = 1:length(k)
         if difference(i) == difference1
             inDex = i;
         end
     end
     k_find = k(inDex);   
     %[x,y]=max(difference1);
     %k_fin=k(y);
     E = hbar^2*k_find^2/(2*melec)*J2eV;
else

    E = pi^2*hbar^2/(2*melec*a^2)*J2eV;
end

