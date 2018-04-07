dim = 3;
gamma1 = 3;
gamma2 = 2;
gamma3 = 1;
x1 = randn(dim,1);
x2 = randn(dim,1);
x3 = randn(dim,1);
Q = sdpvar(dim,dim);
Constraints = [Q>=0,x1'*Q*x1>=gamma1, x2'*Q*x2>=gamma2, x3'*Q*x3<=gamma3];

Objective = trace(Q);

options = sdpsettings('verbose',1,'solver','sedumi');

sol = optimize(Constraints, Objective, options);
opt_point = value(Q)
opt_value = trace(opt_point)
[eig_vectors, eig_values] = eig(opt_point)