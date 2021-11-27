clear all
close all
clc

s = [1 2 3 4; 5 6 7 8; -1 -2 -3 -4; -5 -6 -7 -8]

h = size(s);
a = h(1);
b = h(2);
E0 = [];

for i=1+1:a-1
    for j=1+1:b-1
        E = s(i,j)*s(i,j+1)*s(i,j-1)*s(i+1,j)*s(i-1,j);
        vecE=[E0;E]; 
        E0=vecE;
    end
 
end

vecE = reshape(vecE,a-2,b-2) %Para toda matriz mayor o igual que 3x3
Ising2D=vecE' %De momento solo tengo el medio de la matriz hecho, de una 4x4, tengo (2,2),(2,3),(3,2) y (3,3)
