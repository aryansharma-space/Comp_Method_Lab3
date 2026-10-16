test_ode(@rk4,0.001,1e-5)

function test_ode(integrator, h, E)

    [t, x] = integrator(@test_dyn, [0 1], [1; 1], h);

    y_exact = exp(t(:));

    error = abs(y_exact - x(:,1));

    max_error = max(error);

    assert(max_error < E, '%s failed: max error %g is not below %g', ...
        func2str(integrator), max_error, E)
    disp('Integrator verification passed!')
end

function xdot = test_dyn(t, x)
xdot = [x(2); x(1)];
end