% MATH415 Assignment 2 Q1
% 1/06/21.

%% Resetting Matlab to default state
close all
clear all
clc
set(0,'defaultTextInterpreter','latex');

%% Setting up variables
% Step sizes
p=4;                      % To refine spatial grid
xi=0; xf=1;               % Spatial boundaries
ti=0; tf=1;               % Temporal boundaries
n=((xf-xi)/0.1)*(2^p);    % n = number of steps
                          % n+1 = number of points
dx=(xf-xi)/n;             % Spatial step size

% Space axis
x=linspace(xi,xf,n+1);

% Boundary conditions
Uti=0; Utf=0;             % Neumann conditions

% Initial condition
U(1:n+1,1)=initialCondition(x(1:n+1));

%% Solving with MoL interpretation
tic
[t,U]=ode15s(@(t,V)dUdt(t,x,V,n,dx,Uti,Utf),[ti,tf],U(:,1));
toc

%% Computing 'exact solution'
m=0;
u=pdepe(m,@heatpde,@initialCondition,@heatbc,x,t);

%% Creating solution slices
plotApprox(t,x,U,1)
plotExact(t,x,u,2)
plotError(t,x,abs(u-U),3)