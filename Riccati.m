function X=Riccati(A,B,Q,R)
%RICCATI  Solves an algebraic Riccati equation
%   X = Riccati(A,G,Q) solves the algebraic Riccati equation of the form:
%       A'*X + X*A' - X*G*X + Q = 0, where X is symmetric.

coder.extrinsic('ordschur');

n=size(A,1);

% G = (B/R)*B';

%% care Hamiltonian matrix
Z=[ A   -(B/R*B');
   -Q   -A'];

[U1,S1]=schur(Z);
[U,S]=ordschur(U1,S1,'lhp');
X=U(n+1:2*n,1:n)*U(1:n,1:n)^-1; % default : U(n+1: end ,1:n)*...


%% dare Hamiltonian matrix
% Z=[ (A+(B/R*B'/A'*Q)) -B/R*B'/A';
%    -(A^-1)'*Q         -(A^-1)'];
% 
% U1 = [(A+(B/R*B'/A'*Q)) -B/R*B'/A'];
% U2 = [-(A^-1)'*Q         -(A^-1)'];
% 
% P = U2/U1;
% 
% X = P;
