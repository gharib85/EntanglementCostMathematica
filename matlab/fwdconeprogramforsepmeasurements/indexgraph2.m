it1 = linspace(0,1,51);
Y = it1';
Z = zeros(51,1);
ZA = zeros(51,1);
ZB = zeros(51,1);
for i = 1:51
%     ZA(i) = 1/8*(1+it1(i)) ;
%     ZA(i) = 1/2*(1+sqrt(1-it1(i)^2));
%     [a,b,c] = shelby_setup(0,it1(i));
%     [x,y,z] = LocalDistinguishability(b,'COPIES',1,'PPT',true);
%     z = Swap(z, [2,3], [2,2,2,2]);
    [a,b,c,d,e,f,g] = dpp(0.8,it1(i));
    Z(i) = a(1,4);
    ZA(i) = (g/2-1)^2;
    ZB(i) = 1-(1-0.8^2)*it1(i)^2;
end
plot(Y,Z)