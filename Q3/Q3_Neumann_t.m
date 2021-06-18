% MATH415 Assignment 2 Q3
% 2/06/21.

%% Resetting Matlab to default state
close all
clear all
clc
set(0,'defaultTextInterpreter','latex');

%% Setting up variables
% Equation parameters
epsilon=0.01;
tau=0.01;

% Step sizes
p=5;                      % To refine spatial grid
xii=0; xf=1;               % Spatial boundaries
ti=0; tf=1;               % Temporal boundaries
n=((xf-xii)/0.1)*(2^p);    % n = number of steps
                          % n+1 = number of points
m=n;                      % m = number of temporal steps
dxi=(xf-xii)/n;             % Spatial step size

% Axes
xi=linspace(xii,xf,n+1);
t=linspace(ti,tf,m+1);
tSpan=t;                  % tSpan is simply another name for t

% Boundary conditions
Uti=0; Utf=0;             % Neumann conditions

% Initial condition
U(1:n+1,1)=initialCondition(xi(1:n+1));

%% Solving with MoL interpretation
[t,U]=ode15s(@(t,V)dUdt(t,xi,V,n,dxi,Uti,Utf,epsilon,tau,tSpan),tSpan,U(:,1));

% %% Computing 'exact solution'
% m=0;
% u=pdepe(m,@heatpde,@initialCondition,@heatbc,xi,t);

%% Creating solution slices
% Filename encoding
if epsilon==0.01
    ep=2;
elseif epsilon==0.001
    ep=3;
elseif epsilon==0.0001
    ep=4;
end

% % Creating figures
% plotApprox(t,xi,U,1,sprintf("MoL Approximation to Weak Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("approx_to_weak_form__e%d_n%d",[ep,n]))
% plotApprox(t,xi,u,2,sprintf("Weak pdepe Approximation to Weak Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("weak_pdepe_approx_to_weak_form__e%d_n%d",[ep,n]))
% plotError(t,xi,abs(U-u),3,sprintf("Error Between Weak MoL Approximation and Weak pdepe Approximation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("error_between_weak_approxs__e%d_n%d",[ep,n]))

% Creating surface plot
plotSurf(t,xi,U,4,sprintf("MoL Approximation to Weak Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("approx_to_weak_form_surf__e%d_n%d",[ep,n]))