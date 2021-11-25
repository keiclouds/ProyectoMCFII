function Ising1D=fun_Ising2D(m,n)
E0=[];
for i=1:length(m)-1
    for j=1:length(n)-1
        E(i,j)=m(i)*m(i+1);
        vecE=[E0:E]; E0=vecE;
        
    end
end
Ising1D=vecE;

% 
% for i=1:length(x)  %Crear la matriz 
%   for j=1:length(x)
%     XX(j,i)= x(j)^(i-1);
%   end
% end
% XX;