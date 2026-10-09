function test_ode(integrator, h, E)
    [t, x] = integrator(@test_dyn, [0 1], [1; 1], h);
    max_error = max(abs(x(:,1) - exp(t)));
    assert(max_error < E, '%s failed: max error %g is not below %g', ...
        func2str(integrator), max_error, E)
end