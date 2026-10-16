%%

clc, clear
%%
% Task 2.1
% Aryan

x0 = [0, 13262854, 0, -5482, 5245, 0]';
tspan = [0, 200 * 3600]; % hrs converted to seconds
h = 100;

RelTol = 1e-12;
AbsTol = 1e-14;
options = odeset('RelTol', RelTol, 'AbsTol', AbsTol);

%% a)

[t,x] = rk4(@two_bp, tspan, x0, h);

[t_ode,x_ode] = ode45(@two_bp, tspan, x0, options);

%% b)
x_ode_interp = interp1(t_ode, x_ode(:, 1:3), t);

dr = x(:,1:3) - x_ode_interp;
position_difference = sqrt(sum(dr.^2, 2));

figure

plot(x(:,1)/1000, x(:,2)/1000, 'y-', 'LineWidth', 1.2)
hold on
plot(x_ode_interp(:,1)/1000, x_ode_interp(:,2)/1000, 'r--', 'LineWidth', 1.2)
plot(0, 0, 'bo', 'MarkerFaceColor', 'k')

axis equal
grid on
xlabel('r_x (km)')
ylabel('r_y (km)')
title('Task 2.1(b): RK4 and ode45 Trajectories')
legend('RK4, h = 100 s', 'ode45, interpolated', 'Earth center', 'Location', 'best')

%% c) Position difference and geocentric radius versus time

radius = sqrt(sum(x(:,1:3).^2, 2));

figure

subplot(2,1,1)
plot(t/3600, position_difference, 'b-', 'LineWidth', 1.2)
xlabel('Time (hours)')
ylabel('Position difference (m)')
title('RK4 vs. Interpolated ode45')
grid on

subplot(2,1,2)
plot(t/3600, radius/1000, 'y-', 'LineWidth', 1.2)
xlabel('Time (hours)')
ylabel('Geocentric radius (km)')
title('Distance from Earth''s Center (RK4)')
grid on