% Task 1.1
% Aryan

%%

function xdot = two_bp(t, x)

    mu = 3.986 * 10^14; % m^3/s^2

    position = x(1:3);
    velocity = x(4:6);

    r = norm(position);

    acceleration = -mu/r^3 * position;

    xdot = [velocity; acceleration];

end