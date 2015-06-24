% function [H,r1,r2,r3,r4,relement,m]=run_sdp_dual(a,epsilon)
%%
function [m]=run_sdp_dual(a,epsilon)
[rho_no_transpose,n] = shelby_setup( a, epsilon );
%[rho_transpose,rho_no_transpose,n] = setup_1epr( a, epsilon );
cvx_begin sdp
    variable H(n,n) hermitian
    variable r1(n,n) hermitian
    variable r2(n,n) hermitian
    variable r3(n,n) hermitian
    variable r4(n,n) hermitian
    minimize(trace(H))
    
    H-rho_no_transpose{1}-partial_transpose([1 0 1 0],r1)==semidefinite(n)
    H-rho_no_transpose{2}-partial_transpose([1 0 1 0],r2)==semidefinite(n)
    H-rho_no_transpose{3}-partial_transpose([1 0 1 0],r3)==semidefinite(n)
    H-rho_no_transpose{4}-partial_transpose([1 0 1 0],r4)==semidefinite(n)
    r1==semidefinite(n)
    r2==semidefinite(n)
    r3==semidefinite(n)
    r4==semidefinite(n)
    cvx_quiet true
cvx_end
%disp(trace(H)/4);
%min(eig(H-rho_no_transpose{1}-partial_transpose([1 0 1 0],r1)))
%H(abs(H)<10^-5)=0;
%r1(abs(r1)<10^-5)=0;
%r2(abs(r2)<10^-5)=0;
%r3(abs(r3)<10^-5)=0;
%r4(abs(r4)<10^-5)=0;
%min(eig(H-rho_no_transpose{1}-partial_transpose([1 0 1 0],r1)))
m=trace(H);
relement=r1(find(r1,1));
end
