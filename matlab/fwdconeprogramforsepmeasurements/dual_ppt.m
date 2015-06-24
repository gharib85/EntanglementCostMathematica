function [m]=dual_ppt(a,epsilon)

[rho,n] = shelby_setup( a, epsilon );

cvx_begin sdp
    variable H(n,n) hermitian
    minimize(trace(H))
    
    H-partial_transpose([1 1 0 0],rho{1}) == semidefinite(n);
    H-partial_transpose([1 1 0 0],rho{2}) == semidefinite(n);
    H-partial_transpose([1 1 0 0],rho{3}) == semidefinite(n);
    H-partial_transpose([1 1 0 0],rho{4}) == semidefinite(n);
    
    cvx_quiet true
cvx_end

m=trace(H);
end