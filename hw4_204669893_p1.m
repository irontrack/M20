% HW 4 PROBLEM 1: THE PENDULUM

g = 9.81; %m/s
theta_0 = pi/3;
omega_0 = 0;
L = 1;
t_final = 20;
dt = 0.005;


omega = zeros(t_final/dt,1);
theta = zeros(t_final/dt,1);
e_total = zeros(t_final/dt,1);


k = 0;
while k < t_final/dt
   if k == 0;
     omega(k + 1) = omega_0 -(g/L)*sin(theta_0)*dt;
     theta(k + 1) = omega_0*dt;
     h = L*(1 - abs(cos(theta(k + 1))));
     e_total(k + 1) = 9.81*h + .5*(L*omega(k + 1))^2;
   else
     omega(k + 1) = omega(k) -(g/L)*sin(theta(k))*dt;
     theta(k + 1) = theta(k) + omega(k +1)*dt;
     h = L*(1-abs(cos(theta(k))));
     e_total(k) = 9.81*h + .5*(L*omega(k))^2;
   end
   k = k + 1;
   
   
end

time = dt:dt:t_final;
time = transpose(time);
y = L.*cos(theta);
alpha = -(g/L).*sin(theta);
plot(time,e_total)
grid on
xlabel('time (sec)')
ylabel('total specific energy (j/kg)')

figure (2)
plot(time,alpha)
hold on
plot(time,omega)
hold on
plot(time,theta)
grid on
legend('alpha','omega','theta')
xlabel('time (sec)')
ylabel('alpha,omega,theta')
title('plots for implicit method dt = 0.005 sec')

