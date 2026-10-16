function [t, x] = rk4(dynamics, tspan, x0, h)

% set t to vector spanning time interval, from t0 to tf
t = tspan(1):h:tspan(2).';
x = zeros(length(t), length(x0));

x(1,:) = x0.';

for i = 1:length(t)-1

    k1 = dynamics(t(i), x(i,:).');
    k2 = dynamics(t(i) + h/2, x(i,:).' + 0.5 * k1 *h);
    k3 = dynamics(t(i) + h/2, x(i,:).' + 0.5 * k2 * h);
    k4 = dynamics(t(i) + h, x(i,:).' + k3 * h);

    x(i+1,:) = x(i,:) + (1/6)*(k1.' + 2*k2.' + 2*k3.' + k4.')*h;

end