clear all
close all
clc

S = [1 -1 -1 ]
E0=[]
for j=1:length(S)-1
E=S(j)*S(j+1)
vecE=[E0;E] 
E0=vecE
j
end
Ising1D=vecE