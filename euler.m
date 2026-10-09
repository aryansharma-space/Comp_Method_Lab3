function [t, x] = euler(dynamics, tspan, x0, h)
% EULER Explicit Euler integration of dx/dt = dynamics(t, x).
%   Same conventions as ode45: t is a column vector and x(i,:) is the
%   state at t(i).
    t = (tspan(1):h:tspan(2)).';
    x = zeros(length(t), length(x0));
    x(1,:) = x0;
    for i = 1:length(t)-1
        xi = x(i,:).';                 
        xdot = dynamics(t(i), xi);     
        x(i+1,:) = (xi + h*xdot).';
    end
end
 