clear all
close all
clc
z = zeros(4,4);%Vector de zeros
s = [1 -2 3 -4; 5 -6 7 -8; 9 -1 2 -3; 4 -5 6 -7]

h = size(s)
a = h(1)+1;
b = fix(h(1) + (h(1)+1/2));
E0 = [];

T = [z s z; s s s; z s z] %Tensor
S = T(a:b,a:b);
for i=a:b
    for j=a:b
        E(j)=S(j)*S(j+1)*S(j-1)
        vecE=[E0,E] 
        E0=vecE
        j
    end
    E(i)=S(i)*S(i+1)*S(i-1)
    vecE=[E0;E] 
    E0=vecE
    i
end

Ising1D=vecE