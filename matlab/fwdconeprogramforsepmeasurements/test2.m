it1 = linspace(0,1,11);
it2 = linspace(0,1,11);
X = it1';
Y = it2';
Z = zeros(11);
for i = 1:11
    for j = 1:11
        Z(i,j) = 1/2*(1+sqrt(1-Y(j)^2)/sqrt(1-X(i)^2*Y(j)^2));
    end
end
surf(X,Y,Z)