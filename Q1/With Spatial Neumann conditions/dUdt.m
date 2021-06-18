function dUdt = dUdt(t,x,V,n,dx,dUidt,dUfdt)
%% Defining our solution
U(2:n,1)=V;
% U(1,1)=Ui;
% U(2:n,1)=V;                % Dummy variable for ODE solver
% U(n+1,1)=Uf;

%% Defining our derivative
dUdt(1,1)=dUidt;
dUdt(2:n,1)=zeros(n-1,1);  % Zeros for a placeholder
dUdt(n+1,1)=dUfdt;

%% Using central difference
for j=2:n
    if j==2
        dUdt(j,1)=(1/dx^2)*(-U(j)+U(j+1));
    elseif j==n
        dUdt(j,1)=(1/dx^2)*(U(j-1)-U(j));
    else
        dUdt(j,1)=(1/dx^2)*(U(j-1)-2*U(j)+U(j+1));
    end
end

% for j=2:n
%     dUdt(j,1)=(1/dx^2)*(U(j-1)-2*U(j)+U(j+1));
% end

dUdt=dUdt(2:n);            % Because we have boundary conditions
end

