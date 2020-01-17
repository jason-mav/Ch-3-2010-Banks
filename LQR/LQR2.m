clear all;
clc;
display('------------Linear Quadratic Regulator-----------------')
A=input('enter the A matrix = ');
B=input('enter the B matrix = ');
C=input('enter the C matrix = ');
D=input('enter the D matrix = ');
[b,a]=ss2tf(A,B,C,D);
sys1=tf(b,a)

W=input('if want to enter value of Q manually enter 1 else 2 = ')
if W==1
    Q=input('enter value of q = ')
else
    Q=transpose(C)*C
end

R=input('enter the matrix of R(no. of columns must be equal to B) = ');

Y=input('if want to enter value of N manually enter 1 else 2 = ')
if Y==1
    N=input('enter value of N = ')
else
    N=0
end
[K,S,e]=lqr(A,B,Q,R,N)
sys=ss(A,B,C,D)
subplot(311)
step(sys)
n=length(K);
AA=A - B * K
for i=1:n
    BB(:,i)=B * K(i);
end
display(BB)
CC=C
DD=D
for i=1:n
     sys(:,i)=ss(AA,BB(:,i),CC,DD);
end
subplot(312)
step(sys(:,1))
subplot(313)
step(sys(:,2))


