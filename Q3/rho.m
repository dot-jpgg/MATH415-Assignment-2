function rho=rho(x,U,j,n,i)
%% rho 1
if i==1
% Cases
if j==1
    dUdx=(((3/2)*U(1))-(2*U(2))+((1/2)*U(3)))...
        /((3/2*x(1))-(2*x(2))+(1/2*x(3)));
elseif j==n+1
    dUdx=(((3/2)*U(n+1))-(2*U(n))+((1/2)*U(n-1)))...
        /(((3/2)*x(n+1))-(2*x(n))+((1/2)*x(n-1)));
else
    dUdx=(U(j+1)-U(j-1))...
        /(x(j+1)-x(j-1));
end

% Specifying rho
rho=(1+abs(dUdx)^2)^(1/2);
end

%% rho 2
if i==2
% Cases
if j==1
    d2Udx2=(2*(((x(2)-x(1))*(U(3)-U(1)))-((x(3)-x(1))*(U(2)-U(1)))))...
        /((x(3)-x(1))*(x(2)-x(1))*(x(3)-x(2)));
elseif j==n+1
    d2Udx2=(2*(((x(n)-x(n+1))*(U(n-1)-U(n+1)))-((x(n-1)-x(n+1))*(U(n)-U(n+1)))))...
        /((x(n-1)-x(n+1))*(x(n)-x(n+1))*(x(n-1)-x(n)));
else
    d2Udx2=(2/(x(j+1)-x(j-1)))...
        *(((U(j+1)-U(j))/(x(j+1)-x(j)))-((U(j)-U(j-1))/(x(j)-x(j-1))));
end

% Specifying rho
rho=(1+abs(d2Udx2)^2)^(1/4);
end

end

