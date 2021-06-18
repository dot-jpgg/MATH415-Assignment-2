function dUdt = dUdt(t,x,V,n,dx,Uti,Utf)
%% Defining our solution
U(1:n+1)=V;

%% Defining our derivative
dUdt(1,1)=Uti; dUdt(n+1,1)=Utf; % We have Neumann boundary conditions
dUdt(1:n+1,1)=zeros(n+1,1);     % Zeros for a placeholder

%% Using central difference
for j=2:n
    dUdt(j,1)=(1/dx^2)*(U(j-1)-2*U(j)+U(j+1));
end
end