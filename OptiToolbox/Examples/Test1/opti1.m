%% Example 1
% This is a simple two decision variable Linear Program (LP) which we will
% use for the next couple of examples.
clc
%Problem
f = @(x) -6*x(1)-5*x(2);                %Objective Function (min f'x)
A = [1,4; 6,4; 2, -5];      %Linear Inequality Constraints (Ax <= b)
b = [16;28;6];    
lb = [-pi;-pi];                 %Bounds on x (lb <= x <= ub)
ub = [pi;pi];

%Basic Setup
% Problems can be built using the opti constructor. Options from optiset are 
% always optional. If the user does not provide any options, OPTI will
% choose default ones for the problem being solved.
opts = optiset('solver','nlopt'); 
Opt = opti('fun',@f1,'x0',[1 1],'bounds',lb,ub,'options',opts)




%Call solve to solve the problem
[x,fval,exitflag,info] = solve(Opt)   