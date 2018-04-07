x = sdpvar(2,1);
Constraints = [sum(x)>=1, sum(x)<=2, x(1)+2*x(2)>=2];

for i = 1:2
   Constraints = [Constraints, x(i)>=0];
end

Objective = 0;

options = sdpsettings('verbose',0,'solver','sedumi');

sol = optimize(Constraints, Objective, options);
opt_point = value(x)
opt_value = 0
plot(Constraints);
hold on;
plot(opt_point(1),opt_point(2),'b*');