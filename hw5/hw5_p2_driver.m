% hw 5 problem 2 test driver

dt = [1,.1,.01];
y0 = 1;
fprintf('  %s ','dt')
fprintf('       %s','RK1')
fprintf('       %s','RK2')
fprintf('       %s\n','RK2')
for i = 1:3
    
    t = 0:dt(i):15;
    
    L = length(t);
    y = y0.*exp(-(log(2)/2.45).*t);
    yrk1 = zeros(1,L);
    yrk2 = zeros(1,L);
    yrk4 = zeros(1,L);
    
    for k = 1:L
        if k == 1
            yrk1(k) = y0;
            yrk2(k) = y0;
            yrk4(k) = y0;
        else
            yrk1(k) = advanceRK(yrk1(k-1),dt(i),'RK1');
            yrk2(k) = advanceRK(yrk2(k-1),dt(i),'RK2');
            yrk4(k) = advanceRK(yrk4(k-1),dt(i),'RK4');
        end
        
    end
    averages = [0,0,0];
    temp = zeros(1,L);
    for j = 1:3
        temp = abs(y - yrk1);
        averages(1) = sum(temp)/L;
        temp = abs(y - yrk2);
        averages(2) = sum(temp)/L;
        temp = abs(y - yrk4);
        averages(3) = sum(temp)/L;
    end
    fprintf('%4.2f:',dt(i))
    fprintf('%10.2e',averages(1))
    fprintf('%10.2e',averages(2))
    fprintf('%10.2e\n',averages(3))
    figure(i)
    plot(t,y,'k',t,yrk1,'r',t,yrk2,'g',t,yrk4,'b')
    grid on
    legend('exact sol.','RK1','RK2','RK4')
    
end

figure(4)
plot(t,yrk4)
grid on

        