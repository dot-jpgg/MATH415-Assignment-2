function mainFunction(epsilon,p,i,movingMesh)

%% Setting latex as default
set(0,'defaultTextInterpreter','latex');

%% Setting up variables
% Equation parameters
tau=0.01;

% Step sizes
xii=0; xf=1;               % Spatial boundaries
ti=0; tf=1;               % Temporal boundaries
n=((xf-xii)/0.1)*(2^p);    % n = number of steps
                          % n+1 = number of points
m=n;                        % m = number of time steps
dxi=(xf-xii)/n;             % Spatial step size

% Axes
xi=linspace(xii,xf,n+1);
tSpan=linspace(ti,tf,m+1);

% Initial condition
U0(1:n+1,1)=initialCondition(xi);
x0(1:n+1,1)=xi;
Y0=[U0,x0];

%% Solving with MoL interpretation
[t,Y]=ode15s(@(t,Y)dYdt(t,Y,dxi,n,epsilon,tau,i,movingMesh),tSpan,Y0);

%% Unpacking Y
U=Y(:,1:n+1);
x=Y(:,(n+1)+1:2*(n+1));

%% Computing 'exact solution'
m=0;
u=pdepe(m,@heatpde,@initialCondition,@heatbc,xi,t);

%% Creating solution slices
% Filename encoding
if epsilon==0.01
    ep=2;
elseif epsilon==0.001
    ep=3;
elseif epsilon==0.0001
    ep=4;
end

% Creating figures
%plotApprox(t,x,U,1,sprintf("MoL Approximation to Weak Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$, $\\rho_{i} = \\rho_{%d}$)",[epsilon,n,i]),sprintf("approx_to_weak_form__e%d_n%d_i%d",[ep,n,i]))
%plotExact(t,xi,u,2,sprintf("Weak pdepe Approximation to Weak Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("weak_pdepe_approx_to_weak_form__e%d_n%d",[ep,n]))
%plotError(t,xi,abs(U-u),3,sprintf("Error Between Weak MoL Approximation and Weak pdepe Approximation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("error_between_weak_approxs__e%d_n%d",[ep,n]))
plotMovingMesh(x,4,sprintf("Moving Mesh ($\\epsilon = %f$, $n = %d$, $\\texttt{movingMesh} = %d$)",[epsilon,n,movingMesh]),sprintf("moving_mesh__e%d_n%d_mm%d",[ep,n,movingMesh]))

% Creating surface plot
%plotSurf(t,x,U,5,sprintf("MoL Approximation to Weak Form of Burgers' Equation ($\\epsilon = %f$, $n = %d$)",[epsilon,n]),sprintf("approx_to_weak_form_surf__e%d_n%d",[ep,n]))
end