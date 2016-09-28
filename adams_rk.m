function xh_funct = adams_rK_(predprey, t_0, t_End, x_0, h)
x_0 = x_0(:);
m = length(x_0);
ti_funct = t_0:h:t_End;
n = length(ti_funct)-1;
xh_funct = zeros(m, n+1);
funct = xh_funct;
xh_funct(:,1) = x_0;


for i=1:n
    K_1 = feval(predprey, ti_funct(i), xh_funct(:, i));
    K_2 = feval(predprey, ti_funct(i)+.5*h, xh_funct(:, i)+.5*h*K_1);
    K_3 = feval(predprey, ti_funct(i)+.5*h, xh_funct(:, i)+.5*h*K_2);
    K_4 = feval(predprey, ti_funct(i)+h, xh_funct(:, i)+h*K_3);
    xh_funct(:, i+1) = xh_funct(:, i) + 1/6*h * (K_1 + 2*(K_2 + K_3) +K_4);
end;

for i = 4:n
    funct(:, i) = feval(predprey, ti_funct(i), xh_funct(:,i));
        xh_funct(:, i+1) = xh_funct(:, i) + (55 * funct(:, i) - 59 * funct(:, i-1) + 37 * funct(:, i-2) - 9 * funct(:, i-3)) * h * 1/24;
    ti_funct(:, i+1) = ti_funct(i) + h;
        xh_funct(:, i+1) = xh_funct(:, i) + (9 * feval(predprey, ti_funct(i+1), xh_funct(:, i+1)) + 19 * funct(:, i) - 5 * funct(:, i-1) + funct(:, i-2))* h * 1/24;
end;

figure(1)
plot(xh_funct(1,:), xh_funct(2,:))
xlabel('x_1')
ylabel('x_2')





 