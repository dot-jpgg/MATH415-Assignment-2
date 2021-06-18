function dxdt = dxdtFunc(x,dxi,j,tau,U,n,i,movingMesh)
%% Returns dxjdt
% Are we moving the mesh?
% If so:
if movingMesh==1
dxdt=(1/(rho(x,U,j,n,i)*tau*dxi^2))*...
(((rho(x,U,j+1,n,i)+rho(x,U,j,n,i))/2)*(x(j+1)-x(j))-...
((rho(x,U,j,n,i)+rho(x,U,j-1,n,i))/2)*(x(j)-x(j-1)));
end
% If not:
if movingMesh==0
dxdt=0;
end
end