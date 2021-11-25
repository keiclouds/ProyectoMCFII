function Ising1D=fun_Ising1D(S)
E0=[];
for j=1:length(S)-1
E=S(j)*S(j+1);
vecE=[E0;E]; E0=vecE;
end
Ising1D=vecE;