% MATH415 Assignment 2
% 17/06/21

close all
clear all
clc
set(0,'defaultTextInterpreter','latex');

%% Plotting initial condition
% Setting up parameters.
x=linspace(0,1,500);
u=sin(2*pi*x)+0.5*sin(pi*x);
hline=0*x;

% Plotting.
figure(1)
grid on; hold on
plot(x,u)
plot(x,hline,"--r")
xlabel('$x$')
ylabel('$u(x,0)$')
title("Initial Condition to Burgers' Equation")
print("initial_condition", '-dpng', '-r300');