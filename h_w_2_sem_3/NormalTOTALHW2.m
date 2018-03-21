clear all;
clc;

sigma = 100;
average = 50;

syms F_n t_n F_sum_n tau_n arr_n;


n = 4; 

F_n(t_n) = (14373410442865825*2^(1/2)*pi^(1/2)*(erf(20000^(1/2)/400) + erf((20000^(1/2)*(t_n - 50))/20000)))/72057594037927936;

%int(1/(sqrt(2*pi*sigma^2))*exp(-((t_n -average)^2)/(2*sigma^2)), t_n,0,t_n);
%F_sum = F;
%n = input('Enter n: ');
for i = 1:n
     arr_n(i) = F_n(t_n);
     F_n(t_n) = int(F_n(t_n-tau_n)*1/(sqrt(2*pi*sigma^2))*exp(-(((t_n-tau_n) -average)^2)/(2*sigma^2)), tau_n, 0,t_n);
end


F1(t_n) =arr_n(1);
F2(t_n) =arr_n(2);
F3(t_n) =arr_n(3);
F4(t_n) =arr_n(4);
%F5(t_n) =arr_n(5);
%F6(t_n) =arr_n(6);


hold on
plot([0:10:800], F1([0:10:800]), 'LineWidth', 3);
title('normal distrib; \sigma = 100, Mt = 50;');
grid on
plot([0:10:800], F2([0:10:800]), 'LineWidth', 3);
plot([0:10:800], F3([0:10:800]), 'LineWidth', 3);
plot([0:10:800], F4([0:10:800]), 'LineWidth', 3);
%plot([0:10:800], F5([0:10:800]), 'LineWidth', 3);
%plot([0:10:800], F6([0:10:800]), 'LineWidth', 3);
xlabel('t, hours')
ylabel('probab.')
legend('F1','F2','F3','F4');%,'F5','F6');
% 
% 
Omega(t_n) = sum(arr_n);
figure();
plot([0:10:800], Omega([0:10:800]),'LineWidth', 3);
title('\Omega(t), f_1 = f_2 = ...= f_i = normal distrib, \sigma = 100, Mt = 50');
xlabel('t, hours');
ylabel('\Omega(t)');
grid on
% 
% 
figure();
omega(t_n) = diff(Omega(t_n),t_n);
plot([0:10:800], omega([0:10:800]),'LineWidth', 3);
title('normal distrib,\omega(t) = d\Omega(t)/dt, \sigma = 100, Mt = 50');
xlabel('t, hours');
grid on
