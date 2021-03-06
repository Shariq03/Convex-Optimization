x = sdpvar(2,1);
Constraints = [sum(x)>=1, sum(x)<=2, x(1)+2*x(2)>=2];

for i = 1:2
   Constraints = [Constraints, x(i)>=0];
end

Objective = 2*x(1)+3*x(2);

options = sdpsettings('verbose',2,'solver','sedumi');

sol = optimize(Constraints, Objective, options);
opt_point = value(x)
opt_value = 2*opt_point(1)+3*opt_point(2)
plot(Constraints);
hold on;
plot(opt_point(1),opt_point(2),'b*');