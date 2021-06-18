% MATH411 Q3 (b)
% 9/06/21

%% Introduction
% This script coordinates the main function, which solves Burgers' equation
% for varying grid sizes and varying diffusion parameters. They're arranged
% in a script like this, because Miguel has said that they can take up to
% 12 hours to run.

%% Returning Matlab to its default state
close all
clear all
clc

% Recording commands.
diary logSimulations3.txt
diary on

p=2;
epsilon=0.001;
i=1;
movingMesh=1;
mainFunction(epsilon,p,i,movingMesh)
stop

% For rho 1
for p=1:4
% Iteration 1
epsilon=0.01;
i=1;
movingMesh=1;
tic
mainFunction(epsilon,p,i,movingMesh)
disp("-----------------")
disp(sprintf("p = %d, rho_i = %d, espilon = %f",p,i,epsilon))
toc
disp("-----------------")

% Iteration 2
epsilon=0.001;
i=1;
movingMesh=1;
tic
mainFunction(epsilon,p,i,movingMesh)
disp("-----------------")
disp(sprintf("p = %d, rho_i = %d, espilon = %f",p,i,epsilon))
toc
disp("-----------------")

% Iteration 3
epsilon=0.0001;
i=1;
movingMesh=1;
tic
mainFunction(epsilon,p,i,movingMesh)
disp("-----------------")
disp(sprintf("p = %d, rho_i = %d, espilon = %f",p,i,epsilon))
toc
disp("-----------------")
end

%% For rho 2
for p=1:4
% Iteration 1
epsilon=0.01;
i=2;
movingMesh=1;
tic
mainFunction(epsilon,p,i,movingMesh)
disp("-----------------")
disp(sprintf("p = %d, rho_i = %d, espilon = %f",p,i,epsilon))
toc
disp("-----------------")

% Iteration 2
epsilon=0.001;
i=2;
movingMesh=1;
tic
mainFunction(epsilon,p,i,movingMesh)
disp("-----------------")
disp(sprintf("p = %d, rho_i = %d, espilon = %f",p,i,epsilon))
toc
disp("-----------------")

% Iteration 3
epsilon=0.0001;
i=2;
movingMesh=1;
tic
mainFunction(epsilon,p,i,movingMesh)
disp("-----------------")
disp(sprintf("p = %d, rho_i = %d, espilon = %f",p,i,epsilon))
toc
disp("-----------------")
end

%% For a non-moving mesh
for p=1:9
% Iteration 1
epsilon=0.01;
i=3;
movingMesh=0;
tic
mainFunction(epsilon,p,i,movingMesh)
disp("-----------------")
disp(sprintf("p = %d, rho_i = %d, espilon = %f",p,i,epsilon))
toc
disp("-----------------")

% Iteration 2
epsilon=0.001;
i=3;
movingMesh=0;
tic
mainFunction(epsilon,p,i,movingMesh)
disp("-----------------")
disp(sprintf("p = %d, rho_i = %d, espilon = %f",p,i,epsilon))
toc
disp("-----------------")

% Iteration 3
epsilon=0.0001;
i=3;
movingMesh=0;
tic
mainFunction(epsilon,p,i,movingMesh)
disp("-----------------")
disp(sprintf("p = %d, rho_i = %d, espilon = %f",p,i,epsilon))
toc
disp("-----------------")
end

% Ending diary.
diary off