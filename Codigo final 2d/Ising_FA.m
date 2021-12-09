%Modelo de Ising
clear all, close all
clc

%Dimensiones 
Lx = input('Ingrese filas, pref 5, 10, 100: ');
Ly = input('Ingrese filas, pref igual que anterior: ');

%Llamar matriz random
S = fun_lattice(Lx,Ly);

%Falta energía inicial ??

%Graficar
figure(1)
image(S*256)
colormap(gray)

n = input('Ingrese pasos, pref 50, 100, 500, 1e3, 5e3: '); %Numero de pasos
T = input('Ingrese Temperatura, pref 1, 1e-1, 1e-2, 1-e3: '); %Temperatura
k = 1; % "Cte. de Boltzmann"

for i=1:n
    for j=1:Lx*Ly
        
        ranx = randi([1 Lx]); %Posición random x
        rany = randi([1 Ly]); %Posición random y
        
        ran = S(ranx,rany); %Valor del spin random
        E1 = fun_energia(ranx,rany,Lx,Ly,ran,S); % Energía vecindad
        %Que en la práctiva es la de toda la matriz
        
        ranf = ran*-1; %Flip del spin
        E2 = fun_energia(ranx,rany,Lx,Ly,ranf,S); % Energía post-flip
        
        dE = E2-E1; %Diferencia de Energía, está muy rara??
        W = exp(-dE/(k*T));
        r = rand(1); % ¿Cuando se refiere a entre 0 y 1 es continuo o discreto? Esto es continuo
        
        if r < W
            S(ranx,rany) = S(ranx,rany) * -1;
        end
        
    end
    
    figure(2) %Como va variando la Energia??
    plot(i,E1,'o'),drawnow
    hold on
    
    figure(3)
    image(S*256)
    colormap(gray)
    
    m = 0;%Magnetizacion
    for x=1:Lx
        for y=1:Ly
            m = m+S(x,y);
        end
    end
    m(i) = m/(Lx*Ly);
    
    figure(4) %Como va variando la Energia??
    plot(i,m(i),'*'),drawnow
    hold on
end


%Falta agregar magnetizacion? Formula = 1/(NxM) * Sigma (S_k), donde S_k
%son los estados 

%Última prueba que hice fue, 100x100, 50pasos, 1 Kelvin, y se magnetizaba 
