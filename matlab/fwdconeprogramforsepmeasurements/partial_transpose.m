function stateout=partial_transpose(A_bits, state)
%% A_bits are the bits of subsystem A, given as [1,0,0,..1] where A_bits(i)=1
% if i is one of the qubits that is transposed.
% state is the density matrix to be transposed.
% Vectors value 1 is [1 0 0 0 ..]

%stack columns to get a vector
vstate=vec(state);
len=length(vstate);
numbits=log2(len)/2;
% pt_transform will be the matrix that acts on vstate to transform into the
% partial transpose state.
pt_tranform=zeros(len);
% Check for errors
if numbits~=length(A_bits)
    error('Error! Length of A-bits incorrect','size')
end
if log2(size(state,1))~=numbits
    error('Error! Size of state incorrect','statesize')
end
pt_transform=sparse(len);
bin_rep=de2bi(0:len-1,2*numbits);
for idx=1:len
    vec_element_bin=bin_rep(idx,:);
    half1=vec_element_bin(1:numbits);
    half2=vec_element_bin(numbits+1:2*numbits);
    for bit_idx=1:numbits
        if A_bits(bit_idx)==1
            half1(bit_idx)=half2(bit_idx);
            half2(bit_idx)=vec_element_bin(bit_idx);
        end
    end
    bin_rep(idx,:)=[half1,half2];
end
bin_rep=bi2de(bin_rep);
for idx=1:len
       pt_transform(bin_rep(idx)+1,idx)=1;
end
stateout=reshape(pt_transform*vstate,2^numbits,2^numbits);
end