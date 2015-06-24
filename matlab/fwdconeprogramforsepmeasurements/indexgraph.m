it1 = linspace(0,1,11);
it2 = linspace(0,1,11);
X = it1';
Y = it2';
Z = zeros(11);
for i = 1:11
    for j = 1:11
        [a,b,c] = shelby_setup(it1(i),it2(j));
        [x,y,z] = LocalDistinguishability(b,'COPIES',1,'PPT',true);
        Z(i,j) = z(1,1);
    end
end
surf(X,Y,Z)