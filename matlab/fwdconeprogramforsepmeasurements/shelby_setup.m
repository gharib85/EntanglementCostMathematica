function [rho_transpose,rho_no_transpose,n] = shelby_setup( a, e )
%% Evaluates the PPT SDP
% a is the parameter that parametrizes the entanglement of the states to be
% distinguished: sqrt((1+a)/2)|00>+sqrt((1-a)/2)|11>. e is the parameter
% that parametrizes the entangled resource: sqrt((1+e)/2)|00>+sqrt((1-e)/2)|11>

psi_a{1}=[sqrt((1+a)/2),0,0,sqrt((1-a)/2)];
psi_a{2}=[sqrt((1-a)/2),0,0,-sqrt((1+a)/2)];
psi_a{3}=[0, sqrt((1+a)/2),sqrt((1-a)/2),0];
psi_a{4}=[0, sqrt((1-a)/2),-sqrt((1+a)/2),0];
psi_e=[sqrt((1+e)/2),0,0,sqrt((1-e)/2)];

for idx=1:4
    psi_temp=kron(psi_a{idx},psi_e);
    rho_temp=kron(psi_temp',psi_temp);
    rho_transpose{idx}=partial_transpose([1,0,1,0],rho_temp);
    rho_no_transpose{idx}=Swap(rho_temp, [1 3], [2 2 2 2]);
end
n=size(rho_transpose{1},1);
end

