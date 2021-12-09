clear all, close all
clc

%Dimensiones 
Lx = 5;
Ly = 5;

%Llamar matriz random
S = fun_lattice(Lx,Ly)

figure(1)
image(S*256)
colormap(gray)

n = 50; %Numero de pasos
T = 30; %Temperatura

for i=1:n
    for j=1:Lx*Ly
        
        ranx = randi([1 Lx]); %Posici�n random x
        rany = randi([1 Ly]); %Posici�n random y
        ran = S(ranx,rany); %Posicion random
        
        E1 = fun_energia(ranx,rany,Lx,Ly,ran,S); % Energ�a vecindad
        ran = ran*-1;
        
        E2 = fun_energia(ranx,rany,Lx,Ly,ran,S);
    end
    
end



