% MATH415 Assignment 2 Q1
% 1/06/21.

%% Resetting Matlab to default state
close all
clear all
clc
set(0,'defaultTextInterpreter','latex');

%% Setting up variables
% Step sizes
p=4;                   % To refine spatial grid
xi=0; xf=1;            % Spatial boundaries
ti=0; tf=1;            % Temporal boundaries
n=((xf-xi)/0.1)*(2^p); % n = number of steps
                       % n+1 = number of points
dx=(xf-xi)/n;          % Spatial step size

% Space axis
x=linspace(xi,xf,n+1);

% Boundary conditions
dUidt=0; dUfdt=0;      % Neumann conditions

% Initial condition
U(1:n-1,1)=initialCondition(x(2:n));

%% Solving with MoL interpretation
[t,U]=ode15s(@(t,V)dUdt(t,x,V,n,dx,dUidt,dUfdt),[ti tf],U(:,1));

%% Adding boundary conditions
tempVec=ones(size(t)); % This is a vector of ones with length of t.
UL=U(:,1); UR=U(:,n-1);
U=[UL,U,UR];

%% Computing 'exact solution'
m=0;
u=pdepe(m,@heatpde,@initialCondition,@heatbc,x,t);

%% Creating solution slices
plotApprox(t,x,U,1)
plotExact(t,x,u,2)
plotError(t,x,abs(u-U),3)