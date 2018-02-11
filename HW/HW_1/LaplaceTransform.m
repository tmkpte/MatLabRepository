N = 8;

NoF = [0 260 431 421 306 351  369  546 363];
Time_in_Hours =   [1 2351 4066 4596 3381 2630 3665  4585 3158];

disp (length(NoF) == length(Time_in_Hours));

w_t = NoF./(Time_in_Hours*N);
Time = zeros(1,9);
sum_t = 0;

for a = 2:length(Time)
    Time(a) = Time_in_Hours(a)/2 + sum_t;
    sum_t = sum_t + Time_in_Hours(a);
end

Poly = polyfit(Time, w_t,2);
Poly_3 = polyfit(Time, w_t,3);
Poly_10 = polyfit(Time, w_t,10);
Poly_25 = polyfit(Time, w_t,25);

f = polyval(Poly, Time);

f_3 = polyval(Poly_3, Time);
f_10 = polyval(Poly_10, Time);
f_25 = polyval(Poly_25, Time);


[abs(w_t-f)]'

plot(Time,w_t,Time, f,Time,f_3, 'LineWidth', 2);
title('Polyfit ax^n +bx^{n-1}+...+k');
grid on
xlabel('Time, hour');
ylabel('W(t)');
legend('Data','Poly, n = 2','n = 3');

syms t s
disp (laplace(1,t,s));
disp(laplace(t,t,s));
disp(laplace(t^2,t,s));


%Data from maple_pdf
inverse_laplace = 0.6881130206*10^(-2)*exp(-0.6758063955*10^(-2)*Time)-0.3055157470*10^(-5)*exp(-0.1582409599*10^(-3)*Time)-4.197321955*10^(-8)*exp(0.3827183773*10^(-4)*Time);
lambda = (0.6881130206*10^(-2)*exp(-0.6758063955*10^(-2)*Time)-0.3055157470*10^(-5)*exp(-0.1582409599*10^(-3)*Time)-4.197321955*10^(-8)*exp(0.3827183773*10^(-4)*Time))/(3.*10^(-10)+1.018210282*exp(-0.6758063955*10^(-2)*Time)-0.1930699531*10^(-1)*exp(-0.1582409599*10^(-3)*Time)+0.1096712937*10^(-2)*exp(0.3827183773*10^(-4)*Time));
P = 3*10^(-10)+1.018210282*exp(-0.6758063955*10^(-2)*Time)-0.01930699531*exp(-0.1582409599*10^(-3)*Time)+0.1096712937*10^(-2)*exp(0.3827183773*10^(-4)*Time);

t = [0:1:28000];

inverse_laplace_t = 0.6881130206*10^(-2)*exp(-0.6758063955*10^(-2)*t)-0.3055157470*10^(-5)*exp(-0.1582409599*10^(-3)*t)-4.197321955*10^(-8)*exp(0.3827183773*10^(-4)*t);
lambda_t = (0.6881130206*10^(-2)*exp(-0.6758063955*10^(-2)*t)-0.3055157470*10^(-5)*exp(-0.1582409599*10^(-3)*t)-4.197321955*10^(-8)*exp(0.3827183773*10^(-4)*t))/(3.*10^(-10)+1.018210282*exp(-0.6758063955*10^(-2)*t)-0.1930699531*10^(-1)*exp(-0.1582409599*10^(-3)*t)+0.1096712937*10^(-2)*exp(0.3827183773*10^(-4)*t));
P_t = 3*10^(-10)+1.018210282*exp(-0.6758063955*10^(-2)*t)-0.01930699531*exp(-0.1582409599*10^(-3)*t)+0.1096712937*10^(-2)*exp(0.3827183773*10^(-4)*t);



%NewDataset
figure
plot(t,P_t,'LineWidth',2);
title('VBR, P(t)');
grid on
xlabel('Time, hours');
ylabel('Probability');


axis([0 700 0 1]);
