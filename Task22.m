% Task 2.2
% Aryan

clc, clear

r0 = [7000 * 10^3, 0, 0]';
rf = [0, 9000 * 10^3, 0]';

v0 = [2350, 7350, 0]'; % Guess
x0 = [r0; v0];

tspan = [0, 2400]; %s
h = 10;

[t, x] = rk4(@two_bp, tspan, x0, h);
r_end = x(end,1:3).';

miss_distance = norm(rf - r_end);

fprintf('Initial guess velocity: [%.2f, %.2f, %.2f] m/s\n', v0(1), v0(2), v0(3))

fprintf('Final position from guess velocity: [%.2f, %.2f, %.2f] m\n', r_end(1), r_end(2), r_end(3))

fprintf('Miss distance: %.3f m\n', miss_distance)
fprintf('Miss distance: %.3f km\n', miss_distance/1000)

% Plot the shooting result
plot_shooting(x, r0, rf, 'Task 2.2: Initial Shooting Guess');