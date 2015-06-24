it1 = linspace(0,1,51);
Y = it1';
Z = zeros(51,1);
ZA = zeros(51,1);
for i = 1:51
%     ZA(i) = 1/8*(1+it1(i)) ;
    ZA(i) = 1/2*(1+sqrt(1-it1(i)^2));
    [a,b,c] = shelby_setup(0,it1(i));
    [x,y,z] = LocalDistinguishability(b,'COPIES',1,'PPT',true);
    z = Swap(z, [2,3], [2,2,2,2]);
    Z(i) = x;
end
plot(Y,ZA)