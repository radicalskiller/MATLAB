syms u(x)
k = 0; k1 = 10;
x1 = linspace(k, k1, 1000);
l = randi([k k1]), l1 = randi([k k1])
u1 = diff(u,x);
uSol(x) = dsolve(diff(u,2,x) == -u + 4*sin(x), u(k) == l, u(k1) == l1);
disp(char(uSol(x)));
subplot(2,5,3);
plot(x1, uSol(x1));
title('Original');

razn(k,k1,5,l,l1,6);
razn(k,k1,10,l,l1,7);
razn(k,k1,50,l,l1,8);
razn(k,k1,100,l,l1,9);
razn(k,k1,500,l,l1,10);

function razn(k, k1, n, l, l1, i)
p = @(x) -1;
f = @(x) 4*sin(x);
h = (k1 - k)/(n - 1);
%net
for n1 = 1:n
    x(n1) = k + (n1 - 1)*h;
end
a(2) = 0;
%left edge
b(2) = l;
for n1 = 2:(n - 1)
    a(n1+1) = 1/(2+h*h*p(x(n1))-a(n1));
    b(n1+1)=(b(n1)-h*h*f(x(n1)))/(2+h*h*p(x(n1))-a(n1));
end
%right edge
y(n) = l1;
%result y
for n1 = (n - 1):-1:1
    y(n1)=a(n1 + 1)*y(n1 + 1) + b(n1 + 1);
end
subplot(2, 5, i);
plot(x,y);
title(['n = ' num2str(n) ', h = ', num2str(h)]);
end