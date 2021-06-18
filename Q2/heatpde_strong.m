% Defining functions for PDE solver.
function [c,f,s] = heatpde_strong(x,t,u,dudx)
epsilon=0.01;

c = 1/epsilon;
f = dudx;
s = -(1/epsilon)*u*dudx;
end