it1 = linspace(0,1,11);
it2 = linspace(0,1,11);
X = it1';
Y = it2';
Z = zeros(11);
for i = 1:11
    for j = 1:11
        Z(i,j) = run_ppt_sdp(X(i),Y(j));
    end
end
surf(X,Y,Z)