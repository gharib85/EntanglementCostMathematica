%% 4 Bell states
%
%% States

Bell4Matrix = [Bell(0),Bell(1),Bell(2),Bell(3)];

%% Global Distinguishability

[v, MEAS] = Distinguishability(Bell(1))

[v, MEAS, DUAL_SOL] = LocalDistinguishability(Bell(1))

%% PPT measurements distinguishability

[v, MEAS, DUAL_SOL] = LocalDistinguishability(Bell4Matrix, 'COPIES', 1, 'PPT', true)

%% 2-copies BSE measurements
[v, MEAS, DUAL_SOL] = LocalDistinguishability(Bell4Matrix, 'COPIES', 2, 'PPT', false)

%% 2-copies PPT BSE measurements

[v, MEAS, DUAL_SOL] = LocalDistinguishability(Bell4Matrix, 'COPIES', 2, 'PPT', true)

%% 3 Bell states

Bell3Matrix = [Bell(0),Bell(1),Bell(2)];

%%

%% Global Distinguishability

Distinguishability(Bell3Matrix)

%% PPT measurements
%

LocalDistinguishability(Bell3Matrix)

%% 2-copies BSE measurements
%

LocalDistinguishability(Bell3Matrix, 'ppt', false)

%% 4-copies BSE measurements
%

LocalDistinguishability(Bell3Matrix, 'ppt', false, 'copies', 4)


