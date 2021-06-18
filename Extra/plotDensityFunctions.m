% MATH415 Assignment 2
% 18/06/21

close all
clear all
clc
set(0,'defaultTextInterpreter','latex');

%% Plotting density functions
% Setting up parameters.
x=linspace(-1,1,100);
U=@(n)(1-exp(n*x))./(1+exp(n*x));
Ux=@(n)(-2*n*exp(n*x))./((exp(n*x)+1).^2);
Uxx=@(n)((2*n^2)*(exp(n*x)-1).*exp(n*x))./((exp(n*x)+1).^3);
rho1=@(n)(1+abs(Ux(n)).^2).^(1/2);
rho2=@(n)(1+abs(Uxx(n)).^2).^(1/4);

% Plotting.
f=figure(1);
f.Units = 'inches';
f.OuterPosition = [0.25 0.25 6 10];
xlabel('$x$')
ylabel('$\rho_{i}$')
title("Comparing Density Functions")

legends=[];
for n=[5,10,15,25,50]
subplot(3,1,1);
title("$\frac{1-e^{nx}}{1+e^{nx}}$","fontsize",17.0)
hold on
grid on
plot(x,U(n));
leg=sprintf("$n=%d$",n);
legends=[legends,leg];
end
leg1=legend(legends);
set(leg1, "Interpreter", "latex")

for n=[5,10,15,25,50]
subplot(3,1,2);
title("$\rho_{1}$","fontsize",14.0)
hold on
grid on
plot(x,rho1(n));
end
% leg2=legend("$\rho_{1}$");
% set(leg2,"Interpreter","latex")

for n=[5,10,15,25,50]
subplot(3,1,3);
title("$\rho_{2}$","fontsize",14.0)
hold on
grid on
plot(x,rho2(n));
end
% leg3=legend("$\rho_{2}$");
% set(leg3,"Interpreter","latex")

print("density_functions", '-dpng', '-r300');