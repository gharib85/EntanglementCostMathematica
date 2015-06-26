function [H,m]=dual_ppt(a,epsilon)

[rho,n] = shelby_setup( a, epsilon );

cvx_begin sdp
    variable H(n,n) hermitian
    minimize(trace(H))
    
    partial_transpose([1 0 1 0],H-rho{1}) == semidefinite(n);
    partial_transpose([1 0 1 0],H-rho{2}) == semidefinite(n);
    partial_transpose([1 0 1 0],H-rho{3}) == semidefinite(n);
    partial_transpose([1 0 1 0],H-rho{4}) == semidefinite(n);
    
    cvx_quiet true
cvx_end

m=trace(H);
end