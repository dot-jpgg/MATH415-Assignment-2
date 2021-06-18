function dYdt = dYdt(t,Y,dxi,n,epsilon,tau,i,movingMesh)
%% Splitting Y into U and x
% The first n+1 components are for U
U=Y(1:n+1);
% The next n+1 components are for x
x=Y(n+1+1:2*(n+1));

%% Defining boundary conditions
% Solution
dUdt(1,1)=0; dUdt(n+1,1)=0; % We have Neumann boundary conditions
dUdt(2:n,1)=zeros(n-1,1);     % Zeros for a placeholder

% Domain
dxdt(1,1)=0; dxdt(n+1,1)=0;
dxdt(2:n,1)=zeros(n-1,1);

%% Iterating over spatial domain
for j=2:n
    %% Getting current dxdt
    dxdt(j)=dxdtFunc(x,dxi,j,tau,U,n,i,movingMesh);
    
    %% Getting current dUdt
    dUdt(j,1)=(((U(j+1)-U(j-1))/(x(j+1)-x(j-1)))*dxdt(j))+...
        (((2*epsilon)/(x(j+1)-x(j-1)))*...
        (((U(j+1)-U(j))/(x(j+1)-x(j)))-...
        ((U(j)-U(j-1))/(x(j)-x(j-1)))))-...
        ((1/2)*((U(j+1)^2-U(j-1)^2)/(x(j+1)-x(j-1))));
end

%% Recombining to make dYdt
dYdt=[dUdt;dxdt];

end