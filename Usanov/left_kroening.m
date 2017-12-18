function [ Fx ] = left_kroening( P,alphaA )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Fx = cos(alphaA) +P.*sin(alphaA)./alphaA;
a = size(alphaA);
b_1 = ones(1,a(2));
b_2 = ones(1,a(2))*(-1);
figure
plot(alphaA,Fx);
hold on
plot(alphaA,b_1);
plot(alphaA,b_2);
hold off

title('Sp in solid')
xlabel('a\cdot\alpha')
ylabel('F_x')
%legend('P =5')
grid on


end

