clear all;
clc;

%)1 ������� ��� ���������� �� 6 ��������� Omega, omega 1 ������ ++++
%2) ������� ��� ����������� ������������ �� 6 ��������� Omega, omega 1
%������+++
%3) �������� �� ���������� 2 �������+++
%4) ��������� ������� ����� ��������� ��� ���� 2 ������� ���?
%5) ��������� ����������� ������� �� i ��������� ��� ���� 2 ������� ++++
%6) �������� � ������������ ��� ����������� �� !!!!
%7) �������� ��� ��� ����������, ��� ����� ������, ��� f1 != f2 != f3 �
%�.�. !!!!
%8) ���������� Omega, omega, T, F ��� ����������� 1 + 1 + 1 �������� !!!!


syms F t F_sum tau arr;

lambda = 0.5;
eps = input('Enter epsilon for disequality:');
F(t) = 1 - exp(-lambda*rand(1)*.5*t);
%F_sum = F;
n = 6 ;
%input('Enter n: ');
for i = 1:n
     arr(i) = F(t);
     F(t) = int(F(t-tau)*lambda*rand(1)*.5*exp(-lambda*rand(1)*.5*tau)*rand(1), tau, 0,t);
end

    F1(t) = arr(1);
    F2(t) =arr(2);
    F3(t) =arr(3);
    F4(t) =arr(4);
    F5(t) =arr(5);
    F6(t) =arr(6);
    % % 
    hold on
    plot([0:5:400], F1([0:5:400]), 'LineWidth', 3);
    title('exp distrib; \lambda = 0.5;');
    grid on
    plot([0:5:400], F2([0:5:400]), 'LineWidth', 3);
    plot([0:5:400], F3([0:5:400]), 'LineWidth', 3);
    plot([0:5:400], F4([0:5:400]), 'LineWidth', 3);
    plot([0:5:400], F5([0:5:400]), 'LineWidth', 3);
    plot([0:5:400], F6([0:5:400]), 'LineWidth', 3);
    xlabel('t, hours')
    ylabel('probab.')
    legend('F1','F2','F3','F4','F5','F6');

Omega(t) = sum(arr);
figure();
plot([0:5:400], Omega([0:5:400]),'LineWidth', 3);
title('\Omega(t), f_1 != f_2 != ...!= f_i != \lambda\epsilon_ie^{(-\lambda\epsilon_it)}, \lambda = 0.5');
xlabel('t, hours');
ylabel('\Omega(t)');
grid on

figure();
omega(t) = diff(Omega(t),t);
plot([0:5:400], omega([0:5:400]),'LineWidth', 3);
title('exp distrib,\omega(t) = d\Omega(t)/dt, \lambda = 0.5');
xlabel('t, hours');
grid on






