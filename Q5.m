t_a = 0:0.25:6;
t_b = 0.5:0.25:6;
c_a = 4 * exp(-0.8 * t_a);
c_b = 4 * exp(-0.8 * (t_b - 0.5));

t_b = [0.49, t_b];
c_b = [0, c_b];
% initiating plot with labels
figure;
plot(t_a, c_a);
hold on;

plot(t_b, c_b);
xlabel('Time (day)');
ylabel('Concentration (mg/m^3)');
legend('Point A', 'Point B');
hold off;

% part b
[t, c] = ode45(@(t, c) 4 * exp(-0.8 * t) - 2 * c, [0, 5], 1);
plot(t, c, '-o');
xlabel('Time (day) - 0.5');
ylabel('Concentration (mg/m^3)');

