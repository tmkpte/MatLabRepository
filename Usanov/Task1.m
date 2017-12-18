p =5;
t = [-30:0.1:30];
% a = size(t);
% b_1 = ones(1,a(2));
% b_2 = ones(1,a(2))*(-1);

Fx = left_kroening(p,t);
p = 0;
Fx1 = left_kroening(p,t);
p = 100000;
Fx2 = left_kroening(p,t);

% plot(t,Fx);
% hold on
% plot(t,b_1);
% plot(t,b_2);
% hold off
% 
% title('Sp in solid P = 5')
% xlabel('a\cdot\alpha')
% ylabel('F_x')
% %legend('P =5')
% grid on
% 
% figure
% p =0;
% Fx = left_kroening(p,t);
% plot(t,Fx);
% hold on
% plot(t,b_1);
% plot(t,b_2);
% hold off
% 
% title('Sp in solid P = 0')
% xlabel('a\cdot\alpha')
% ylabel('F_x')
% %legend('P =0')
% grid on
% 
% figure
% p =1000000;
% Fx = left_kroening(p,t);
% plot(t,Fx);
% hold on
% plot(t,b_1);
% plot(t,b_2);
% hold off
% 
% title('Sp in solid P \rightarrow \infty')
% xlabel('a\cdot\alpha')
% ylabel('F_x')
% %legend('P \rightarrow \infty')
% grid on


