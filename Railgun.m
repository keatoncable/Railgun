clc
clear
close all

% Variables used for Discharging circuit of the railgun
global Vinit u0 ur lc lpr Wr hc hr rho Ac Ar c Staticfrictionconstant
global Massofprojectile g theta Vx0 Vy0 A Cd Rho Wpr

Vinit = 565; % Charging voltage
u0 = 4*3.14*10^(-7); % permeability
ur = 1; % Relative permeability
lc = 0.5; % Length of circuit
lpr = 0.05; % Length of projectile
Wr = 0.1; % Width of rail
hc = 0.01; % Height of circuit
hr = 0.01; % Height of rail
rho = 1.68*10^(-8); % Resistivity of conductor
Ac = (3.14*(1)^2/4)*(10^(-4)); % Area of circuit
Ar = 0.001; % Area of rail
c = 2.2*10^(-1); % Capacitance

Staticfrictionconstant = 0.5; % Static friction constant
Massofprojectile = 0.1; % Mass of projectile
g = 9.81; % Gravitational acceleration
theta = 45*pi/180; % Angle of launch

% Code for Discharging circuit of railgun
sim('Final_Railgun_discharging_model')

% Plots of discharging circuit important parameters
figure(1)
subplot(3,1,1)
plot(t,iLout,'Linewidth',1.5)
set(gca,'fontsize',12)
title('(a)')
xlabel('time (s)')
ylabel('I_{L} (A)')
grid on
subplot(3,1,2)
plot(t,Vcout,'Linewidth',1.5)
set(gca,'fontsize',12)
title('(b)')
xlabel('time (s)')
ylabel('V_{c} (V)')
grid on
subplot(3,1,3)
plot(t,xout,'Linewidth',1.5)
set(gca,'fontsize',12)
title('(c)')
xlabel('time (s)')
ylabel('x (m)')
grid on
figure(2)
set(gca,'fontsize',12)
subplot(2,1,1)
plot(t,aout,'Linewidth',1.5)
set(gca,'fontsize',12)
title('(a)')
xlabel('time (s)')
ylabel('a (m/s^2)')
grid on
subplot(2,1,2)
plot(t,vout,'Linewidth',1.5)
set(gca,'fontsize',12)
title('(b)')
xlabel('time (s)')
ylabel('v (m/s)')
grid on

%%

% Variables used for projectile trajectory with air drag
Wpr = 0.1; % Width of the projectile
A = 0.005; % Area of the projectile
Rho = 1.225; % Density of air
Cd = 0.1; % drag coefficient of bullet

% Code for projectile trajectory with air drag
%V = vout(end); % velocity of the projectile at start
V = 100;
theta = 45;
Vx0 = V*cos(theta); % x-axis component of velocity at start
Vy0 = V*sin(theta); % y-axis component of velocity at start

sim('trajectory')
% Plot of the trajectory with air drag
figure(3)
plot(x,y,'Linewidth',1.5)
set(gca,'fontsize',12)
xlabel('distance traveled by projectile (m)')
ylabel('height (m)')
ylim([0 710])
grid on

Target_location = x(end)
Copper_Loss = mean(CuLoss)