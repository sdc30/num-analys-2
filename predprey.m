   function y = predprey(t, x) 
   alpha=0.25;
   beta=0.01;
   gamma=1.0;
   delta = 0.01;
   y=[ x(1)*(alpha - beta*x(2)); x(2)*(-gamma + delta*x(1))];
