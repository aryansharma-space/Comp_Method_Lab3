%% Task 1.2: Propagate a circular orbit
% Aryan

clear, clc

mu = 3.986e14;
R = 1e8;
h = 10;

% Circular speed and orbital period
vcirc = sqrt(mu/R);
T = 2*pi*sqrt(R^3/mu);

fprintf('Circular speed: %.6f m/s\n', vcirc)
fprintf('Orbital period: %.6f s\n', T)
fprintf('Orbital period: %.6f hours\n', T/3600)

% Initial state: [rx; ry; rz; vx; vy; vz]
x0 = [R; 0; 0; 0; vcirc; 0];

% Propagate one orbital period
[t, x] = euler(@two_bp, [0 T], x0, h);

%% Trajectory plot

% Reference circle for comparison
theta = linspace(0, 2*pi, 500);

figure
plot(x(:,1), x(:,2), 'y-', 'LineWidth', 1.5)
hold on
plot(0, 0, 'bo', 'MarkerFaceColor', 'k')

xlabel('r_x (km)')
ylabel('r_y (km)')
title('Task 1.2: Euler Orbit, h = 10 s')
legend('Euler trajectory of S/C', 'Earth center', 'Location', 'best')
grid on

%% Specific orbital energy

% Distance and speed squared at every saved time
radius = sqrt(sum(x(:,1:3).^2, 2));
speed_squared = sum(x(:,4:6).^2, 2);

energy = 0.5*speed_squared - mu./radius;

% Exact energy for the circular initial conditions
E0 = -mu/(2*R);

figure
plot(t/3600, energy, 'y-', 'LineWidth', 1.5)
hold on

plot(t/3600, E0*ones(size(t)), ...
    'w-o', 'LineWidth', 1)

xlabel('Time (hours)')
ylabel('Specific orbital energy (J/kg)')
title('Task 1.2: Specific Orbital Energy')
legend('Euler energy', 'Exact constant energy',kioinm'Location', 'best')
grid on