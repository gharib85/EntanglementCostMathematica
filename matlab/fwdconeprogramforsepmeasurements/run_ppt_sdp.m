% function [ P,rho_no_transpose,obj_value,cond ] = run_ppt_sdp( a,epsilon)
function [obj_value] = run_ppt_sdp( a,epsilon)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
trblk2=blkdiag(zeros(4),eye(4),-eye(4),zeros(4));
trblk2(1:4,13:16)=eye(4);
trblk2(13:16,1:4)=-eye(4);
trblk3=[zeros(4),eye(4);eye(4),zeros(4)];
trblk3=blkdiag(trblk3,trblk3);
trblk4a=blkdiag(eye(4),zeros(4),zeros(4),-eye(4));
trblk4a(5:8,9:12)=eye(4);
trblk4a(9:12,5:8)=-eye(4);
[rho_transpose,rho_no_transpose,n] = shelby_setup( a, epsilon );
%[rho_transpose,rho_no_transpose,n] = setup_1epr( a, epsilon );
ide=eye(16,16);
cvx_begin 
    variable P(16,16) hermitian
    maximize(trace(rho_no_transpose{1}*P)+trace(trblk3*rho_no_transpose{3}*trblk3*P)...
        +trace(trblk2*rho_no_transpose{2}*trblk2'*P)...
        +trace(rho_no_transpose{4}*trblk4a*trblk3*P*trblk3*trblk4a'))
    subject to %valid measurement condition
        %P+trblk3*P*trblk3+trblk2*P*trblk2'+trblk4a*trblk3*P*trblk3*trblk4a'==eye(16)
        P(1:4,1:4)+P(5:8,5:8)+P(9:12,9:12)+P(13:16,13:16)==eye(4,4)
        P(5:8,5:8)-P(9:12,9:12)==zeros(4)
        P(5:8,9:12)-P(9:12,5:8)==zeros(4)
        P(1:4,13:16)-P(13:16,1:4)==zeros(4)
        %P(5,5)*P(8,8)-P(5,8)^2==0
        %
        %P(1,1)==.58
        %
        P == semidefinite(16);
        partial_transpose([1 0 1 0],P) == semidefinite(16)
        cvx_quiet true
cvx_end

P(abs(P)<10^(-15))=0;

obj_value=0.25*(trace(rho_no_transpose{1}*P)+trace(trblk3*rho_no_transpose{3}*trblk3*P)...
        +trace(trblk2*rho_no_transpose{2}*trblk2'*P)...
        +trace(rho_no_transpose{4}*trblk4a*trblk3*P*trblk3*trblk4a'));
    
cond=P+trblk2*P*trblk2'+trblk3*P*trblk3+trblk4a*trblk3*P*trblk3*trblk4a';
end

