lakeVolume = 2.9 * (10 ^ 9); % m^3
lakeMeanDepth = 33; % m
outputRiverDischarge = 1.25 * (10 ^ 9); % m^3/yr
sedimentRate = 12; % m/yr
initConcentration = 17.4; % ppb
eigenValue = (outputRiverDischarge/lakeVolume) + (sedimentRate/lakeMeanDepth);  % 1/yr
concentrations = zeros(1, 62); % from SOY 1930 through EOY 1990
concentrations(1) = initConcentration;
timeStep = 1; % year
loads = zeros(1, 62); % metric tons per year

% assign given loads (this is so fun :))
loads(2) = 40; % 1930
loads(12) = 40; % 1940
loads(13) = 55; % 1941
loads(21) = 55; % 1949
loads(22) = 84.8; % 1950
loads(23) = 81; % 1951
loads(28) = 81; % 1956
loads(29) = 93.2; % 1957
loads(30) = 104.3; % 1958
loads(31) = 115.3; % 1959
loads(32) = 126.4; % 1960 
loads(33) = 137.4; % 1961
loads(34) = 148.5; % 1962
loads(35) = 156.5; % 1963
loads(36) = 204.2; % 1964
loads(37) = 142.8; % 1965
loads(38) = 124.8; % 1966
loads(39) = 54.3; % 1967
loads(40) = 59.1; % 1968
loads(41) = 48.2; % 1969
loads(42) = 59; % 1970
loads(43) = 53.8; % 1971
loads(44) = 103.4; % 1972
loads(45) = 42.9; % 1973
loads(46) = 58.5; % 1974
loads(47) = 99.3; % 1975
loads(48) = 42.9; % 1976
loads(49) = 60.3; % 1977
loads(50) = 48.6; % 1978
loads(51) = 60.5; % 1979

for i = 52:62
    loads(i) = 60.5; % 1980 through 1990
end
% end of assignment

for i = 2:timeStep:length(concentrations)
    % euler method
    concentrations(i) = concentrations(i - 1) + (((loads(i) * (10 ^ 9))/lakeVolume) - (eigenValue * concentrations(i - 1))) * timeStep;
end

x = 1930:1:1991;
% initiating plot with labels
figure;
plot(x, concentrations);
xlabel('EOY');
ylabel('Concentration (ppb)');