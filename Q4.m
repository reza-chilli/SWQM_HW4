initConcentration = 0; % at start
q_w = 0.5 * 3600 * 24; % m^3/day
q_r = 0.5 * 3600 * 24; % m^3/day
k = 0.1; % 1/day
u_1 = 3600;
u_2 = 3600;
u_3 = 4800;
c_3At25000 = 13; % c_3 at 25000m (ppm)
c_2At25000 = ((c_3At25000 * (q_r + q_w)) - 10000)/q_r; % c_2 at 25000m (ppm)
c_1At10000 = c_2At25000/exp(-k * 15000/3600); % ppm
w = (c_1At10000 * k)/(1 - exp(-k * 10000/3600));

x_1 = 0:10:10000;
x_2 = 10:10:15000;
x_3 = 10:10:10000;

c_1 = (initConcentration * exp(-k * x_1./u_1)) + ((w/k) * (1 - exp(-k * x_1./u_1)));
c_2 = c_1(length(c_1)) * exp(-k * x_2./u_2);
c_3 = c_3At25000 * exp(-k * x_3./u_3);

x = 0:10:35000;
c = [c_1 c_2, c_3];
% initiating plot with labels
figure;
plot(x, c);

xlabel('X (m)');
ylabel('Concentration (ppm)');

