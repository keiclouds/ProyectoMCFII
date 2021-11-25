clear all, close all
%montecarlo ising
L=50;%largo red lineal {-1,1}
N=2e3;%numero de iteraciones (20mil)
%estado aleatorio inicial del sistema
s0=fun_randSpin(1,L);%NR de longitud L y valores s0={-1,1} con fn_ransSpin
Eis0=fun_Ising1D(s0);%energía ising lineal
Eis0=sum(Eis0); %energía del estado aleatorio inicial (ising)
M0=(1/L)*sum(s0); %magnetización del sistema aleatorio inicial
figure(1),plot(s0,'*')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% iteraciones
Ei=Eis0; Mi=M0; ps0=[];
Emc0=Ei; Mmc0=Mi;
for n=1:N
s=s0;
psr=round(random('uniform',1,L,1,1));%posición random de la red
ps=[ps0;psr]; ps0=ps;
%realizar un flip del spin en la posición random
if s(psr)==1
s(psr)=-1;
else
s(psr)=1;
end
Ej=fun_Ising1D(s);%energía ising lineal actual
Ej=sum(Ej); %energía del estado aleatorio actual
Mj=(1/L)*sum(s); %magnetización

%%%%%%%%%%%%%%%% algoritmo Metropolis

DeltaE=Ej-Ei;
if DeltaE<0 %se acepta el estado
Emc=[Emc0;Ej]; Emc0=Emc; %se guarda estado aceptado Ej
Mmc=[Mmc0;Mj]; Mmc0=Mmc; %se guarda magnetizacion
Ei=Ej; %para continuar la rutina con este dato
Mi=Mj; s0=s;

elseif DeltaE>=0
expE=exp(-DeltaE);
NR=rand; %numero random entre 0 y 1
if expE>=NR %se repite 'if' anterior
Emc=[Emc0;Ej]; Emc0=Emc;
Mmc=[Mmc0;Mj]; Mmc0=Mmc;
Ei=Ej;
Mi=Mj; s0=s;

elseif expE<NR
%el valor siguiente toma el valor anterior
Emc=[Emc0;Ei]; Emc0=Emc;
Mmc=[Mmc0;Mi]; Mmc0=Mmc;

end
end
n
end
figure, plot(1:n+1,Emc,'o')
figure, plot(1:n+1,Mmc,'o')
figure, plot(ps,'.')