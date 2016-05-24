function  [f1 f2 N] = sweepOptiLastSample(f1,f2,N,fs)

clc
%x(1) = f1
%x(2)= f2
%x(3) = N
%x(4) = phase integer
%x(5) = integer N sample
%x(6) = u1
%X(7) = u2



%Problem
f = @(x) abs(x(6))+ abs(x(7));                %Objective Function (min f'x)

%constrains NL  
nlcon = @(x) [ (x(3)-1)*(x(2)-x(1))/(fs*log(x(2)/x(1)))-x(4)        % last sample error
x(3)-x(5)-x(7)
];
cl = [0 0];
cu = [0 0];



%bounds
lb=[f1(1); f2(1); N(1); 0; 0; -0.1; -0.1;];
ub=[f1(2); f2(2); N(2); inf; N(2)+1; 0.1; 0.1];

%type var

xtype = 'CCIIICC';

% init
x0 = [(f1(2)+f1(1))/2 (f2(2)+f2(1))/2 round((N(2)+N(1))/2) 0 0 0.1 0.1];
%Basic Setup
% Problems can be built using the opti constructor. Options from optiset are 
% always optional. If the user does not provide any options, OPTI will
% choose default ones for the problem being solved.
%opts = optiset('solver','nlopt'); 
%opts = optiset('solver','nomad','display','iter')
opts = optiset('solver','scip','tolint', 1e-9,'tolrfun',1e-9,'tolafun',1e-9);
Opt = opti('fun',f,'x0',x0,'nl',nlcon,cl,cu,'bounds',lb,ub,'xtype',xtype,'opts',opts);


%Call solve to solve the problem
[x,fval,exitflag,info] = solve(Opt) ;  

f1 = x(1);
f2 = x(2);
N = x(3);
