it1 = linspace(0,1,101);
Y = it1';
Z = zeros(101,1);
ZA = zeros(101,1);
ZB = zeros(101,1);
for i = 1:101
%     ZA(i) = 1/8*(1+it1(i)) ;
%    ZA(i) = 1/2*(1+sqrt(1-it1(i)^2));
    [a,b] = shelby_setup(it1(i),0);
    [x,y,z] = LocalDistinguishability(a);
    Z(i) = y{1}(16,16);
%     z = Swap(z, [2,3], [2,2,2,2]);
%     [a,b,c,d,e,f,g] = dpp(0.9,it1(i));
%     Z(i) = a(1,4);
%     ZA(i) = (g/2-1)^2;
%     ZB(i) = 1-(1-0.8^2)*it1(i)^2;
end
plot(Y,Z)