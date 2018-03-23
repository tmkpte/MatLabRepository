clear all;
clc;

%chooser = input('Enter 1 for Exp. distribution, 2 for norm and 3 for norm cutting:');
%Написать функции с запросами на ввод параметров и данных для
%соответсвующих распределений

%Отрисовка вбр, плотности и интенсивности
%Отрисовка параметра потока отказов \восстановлений и КГ.
%Повторять цикл пока не жмакнется -1
syms f g t
while true
    chooser = input('Enter 1 for Exp. distribution, 2 for norm and 3 for norm cutting distrib (-1  to exit):');
    
    if chooser == 1
        
        time_limit = input('Right Time Limit: ');
        lambda_1 = input('Enter lambda_ksi: ');
        lambda_2 = input('Enter lambda_eta: ');
        
        f(t) = lambda_1*exp(-lambda_1*t);
        g(t) = lambda_2*exp(-lambda_2*t);
    elseif chooser == 2
        time_limit = input('Right Time Limit: ');
        m1 = input('Enter M1 (ksi interval): ');
        sigma1 = input('Enter sigma1 (ksi interval): ');
        
        m2 = input('Enter M2 (eta interval): ');
        sigma2 = input('Enter sigma2 (eta interval): ');
        
        
        f(t) = 1/(sqrt(2*pi)*sigma1)*exp(-(t-m1).^2/(2*sigma1^2));
        g(t) = 1/(sqrt(2*pi)*sigma2)*exp(-(t-m2).^2/(2*sigma2^2));
        
        
%         syms f_ksi f_eta t;
% 
% f_ksi(t) = 1/sqrt(2*pi*s1^2) * exp(-(t-m1)^2/(2*s1^2));
% f_eta(t) = 1/sqrt(2*pi*s2^2) * exp(-(t-m2)^2/(2*s2^2));
% 
% f = laplace(f_ksi);
% g = laplace(f_eta);
% syms s;
% f(s) = f;
% g(s) = g;
% omega_f(s) = f(s)/(1 - f(s)*g(s));
% omega_g(s) = f(s)*g(s)/(1 - f(s)*g(s));
% 
% Coef_f_lap = (1 - f(s))/s*(1+omega_g(s));
% Coef(t) = ilaplace(Coef_f_lap);
    elseif chooser ==3
        time_limit = input('Right Time Limit: ');
        m1 = input('Enter M1 (ksi interval): ');
        sigma1 = input('Enter sigma1 (ksi interval): ');
        
        m2 = input('Enter M2 (eta interval): ');
        sigma2 = input('Enter sigma2 (eta interval): ');
        
        f_p(t) = 1/(sqrt(2*pi)*sigma1)*exp(-(t-m1).^2/(2*sigma1^2));
        g_p(t) = 1/(sqrt(2*pi)*sigma2)*exp(-(t-m2).^2/(2*sigma2^2));
        f_const = 1/int(f_p(t),t,0,Inf);
        g_const = 1/int(g_p(t),t,0,Inf);
        f(t) = f_p(t)*f_const;
        g(t) = g_p(t)*g_const;
    end 
    
    if chooser == -1
        disp('Ciao!');
        break;
        
    end
    
    
    while true
        move = input('plot...? (VBR (Press 1), density func ksi( Press 2), lambda( Press 3)) (-1 to exit): ');
        if move == -1
            break;
        end
        if move == 1
            
            P(t) = 1 - int(f(t),t,0,t);
            figure();
            fig = plot([0:10:time_limit], P([0:10:time_limit]),'LineWidth',3);
            grid on
            title('VBR');
            xlabel('t, hours');
            ylabel('Probab-ty.')
            saveas(fig,'VBR.png');
            
        end
        if move == 2
            figure();
            fig = plot([0:10:time_limit], f([0:10:time_limit]),'LineWidth',3);
            grid on
            title('Density function');
            xlabel('t, hours');
            ylabel('Probab-ty.')
            saveas(fig,'Density.png');
            
            
        end
        
        if move == 3
            
            P(t) = (1 - int(f(t),t,0,t));
            lambda_func(t)  = f(t)/P(t);
            figure();
            fig = plot([0:10:time_limit], lambda_func([0:10:time_limit]),'LineWidth',3);
            grid on
            title('\lambda(t)');
            xlabel('t, hours');
            ylabel('\lambda(t)')
            saveas(fig,'Lambda.png');
        end
        
        
            
        
    end
    
    
    
    
end