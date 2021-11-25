clear all
close all
clc

a = [1 -2 3; 4 -5 6]
h = size(a)
E0 = [];
for i=1:h(1)
    for j=1:h(2)
        E(i,j) = a(i)+1
        vecE=[E0 E] 
        E0=vecE
        E(i,j) = a(j)+1
        vecE=[E0;E] 
        E0=vecE
    end
end

Ising1D=vecE