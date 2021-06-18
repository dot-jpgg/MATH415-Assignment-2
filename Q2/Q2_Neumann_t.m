% MATH415 Assignment 2 Q2
% 2/06/21.

%% Resetting Matlab to default state
close all
clear all
clc
set(0,'defaultTextInterpreter','latex');

%% Setting up variables
% Equation parameter
epsilon=0.01;

% Step sizes
p=2;                      % To refine spatial grid
xi=0; xf=1;               % Spatial boundaries
ti=0; tf=1;               % Temporal boundaries
n=((xf-xi)/0.1)*(2^p);    % n = number of steps
                          % n+1 = number of points
m=n-10;                      % m = number of temporal steps
dx=(xf-xi)/n;             % Spatial step size

% Space axis
x=linspace(xi,xf,n+1);
t=linspace(ti,tf,m+1);

% Boundary conditions
Uti=0; Utf=0;             % Neumann conditions

% Initial condition
U(1:n+1,1)=initialCondition(x(1:n+1));

%% Solving with MoL interpretation
[t,U_weak]=ode15s(@(t,V)dUdt_weak(t,x,V,n,dx,Uti,Utf,epsilon),t,U(:,1));
[t,U_strong]=ode15s(@(t,V)dUdt_strong(t,x,V,n,dx,Uti,Utf,epsilon),t,U(:,1));

%% Computing 'exact solution'
m=0;
u_strong=pdepe(m,@heatpde_strong,@initialCondition,@heatbc,x,t);
u_weak=pdepe(m,@heatpde_weak,@initialCondition,@heatbc,x,t);

%% Creating solution slices
% Filename encoding
if epsilon==0.1
    ep=1;
elseif epsilon==0.01
    ep=2;
end

% % Creating figures
% plotApprox(t,x,U_weak,1,sprintf("MoL Approximation to Weak Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("approx_to_weak_form__e%d_n%d",[ep,n]))
% plotApprox(t,x,U_strong,2,sprintf("MoL Approximation to Strong Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("approx_to_strong_form__e%d_n%d",[ep,n]))
% plotApprox(t,x,u_weak,3,sprintf("Weak pdepe Approximation to Weak Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("weak_pdepe_approx_to_weak_form__e%d_n%d",[ep,n]))
% plotApprox(t,x,u_strong,3,sprintf("Strong pdepe Approximation to Strong Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("strong_pdepe_approx_to_strong_form__e%d_n%d",[ep,n]))
% plotError(t,x,abs(U_weak-u_weak),4,sprintf("Error Between Weak MoL Approximation and Weak pdepe Approximation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("error_between_weak_approxs__e%d_n%d",[ep,n]))
% plotError(t,x,abs(U_strong-u_strong),5,sprintf("Error Between Strong MoL Approximation and Strong pdepe Approximation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("error_between_strong_approxs__e%d_n%d",[ep,n]))
% plotError(t,x,abs(U_strong-U_weak),6,sprintf("Difference Between Strong MoL Approximation and Weak MoL Approximation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("diff_between_weak_and_strong_approxs__e%d_n%d",[ep,n]))
% 
% % Creating surface plot
% plotSurf(t,x,U_weak,7,sprintf("MoL Approximation to Weak Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("approx_to_weak_form_surf__e%d_n%d",[ep,n]))
% plotSurf(t,x,U_strong,8,sprintf("MoL Approximation to Strong Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("approx_to_strong_form_surf__e%d_n%d",[ep,n]))