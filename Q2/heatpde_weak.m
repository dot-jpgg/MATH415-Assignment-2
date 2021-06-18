% Defining functions for PDE solver.
function [c,f,s] = heatpde_weak(x,t,u,dudx)
epsilon=0.01;

c = 1/epsilon;
f = dudx-((0.5/epsilon)*u^2);
s = 0;
end