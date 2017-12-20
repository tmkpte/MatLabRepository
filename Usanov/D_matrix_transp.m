function [ D,E] = D_matrix_transp( m,N,E,U,a0,L,dz )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

hbar = 1.034e-34;
e = 1.6021773e-19;
gamma = sqrt(2*m.*(E-U))/hbar;
dg = gamma(2:N)-gamma(1:(N-1));
gd = gamma(2:N)+gamma(1:(N-1));
gg = gamma(1:(N-1))./gamma(2:N);
mm = m(2:N)./m(1:(N-1));





for q = 1:(N-1)
    Zk(q) = sum(L(1:q))*a0;
    if(q-1 == 0)
        z(:,q)=[0:dz:Zk(q)];
    else
        z(:,q)=[Zk(q-1):dz:Zk(q)];
    end
end
z(:,N)=[Zk(N-1):dz:(sum(L)*a0)];


E = linspace(0,2,200)*e;
D = zeros(1,length(E));


for j = 1:length(E)
    gamma = sqrt(2*m.*(E(j)-U))/hbar;
    dg = gamma(2:N)-gamma(1:(N-1));
    gd = gamma(2:N)+gamma(1:(N-1));
    gg = gamma(1:(N-1))./gamma(2:N);
    mm = m(2:N)./m(1:(N-1));
    
    
    T11=exp(-1*i*dg.*Zk)*0.5.*(1+gg.*mm);
    T12=exp(-1*i*gd.*Zk)*0.5.*(1-gg.*mm);
    T21=exp(1*i*gd.*Zk)*0.5.*(1-gg.*mm);
    T22=exp(1*i*dg.*Zk)*0.5.*(1+gg.*mm);
    
    
    A = [1 zeros(1,N-1)];
    B = [zeros(1,N)];
    T = 1;
    for q = (N-1):-1:1
        T = T*[T11(q) T12(q);T21(q) T22(q)];
    end
    B(1)=-T(2,1)/T(2,2)*A(1);
    A(N)=(T(2,2)*T(1,1)-T(1,2)*T(2,1))/T(2,2)*A(1);
    
    
    for q=2:(N-1)
        C=[T11(q-1) T12(q-1);T21(q-1) T22(q-1)]*[A(q-1);B(q-1)];
        A(q)=C(1);B(q)=C(2);
    end
    D(j)=(abs(gamma(N))*m(1))/(abs(gamma(1))*m(N))*abs((T(2,2)*T(1,1)-T(1,2)*T(2,1))/T(2,2))^2;
end



end

