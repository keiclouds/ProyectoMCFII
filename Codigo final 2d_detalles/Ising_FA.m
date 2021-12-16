%Modelo de Ising
clear all, close all
clc

%Dimensiones 
Lx = input('Ingrese filas, pref 5, 10, 100: ');
Ly = input('Ingrese filas, pref igual que anterior: ');

%Llamar matriz random
S = fun_lattice(Lx,Ly);

%Graficar matriz inicial
figure(1)
image(S*256)
colormap(gray)
title('Matriz aleatoria inicial')
xlabel('Filas')
ylabel('Columnas')

n = input('Ingrese pasos, pref 50, 100, 500, 1e3, 5e3: '); %Numero de pasos
T = input('Ingrese Temperatura, pref 1, 1e-1, 1e-2, 1-e3: '); %Temperatura
k = 1; % ""Cte. de Boltzmann""

for i=1:n
    for j=1:Lx*Ly
        
        ranx = randi([1 Lx]); %Posici�n random x
        rany = randi([1 Ly]); %Posici�n random y
        
        ran = S(ranx,rany); %Valor del esp�n random
        E1 = fun_energia(ranx,rany,Lx,Ly,ran,S); % Energ�a vecindad
        %Que en la pr�ctica es la de toda la matriz
        
        ranf = ran*-1; %Flip del spin
        E2 = fun_energia(ranx,rany,Lx,Ly,ranf,S); % Energ�a post-flip
        
        dE = E2-E1; %Diferencia de Energ�a
        W = exp(-dE/(k*T)); %Funci�n de peso
        r = rand(1); % Valor aleatorio para comparar con funci�n de peso
        
        if r < W
            S(ranx,rany) = S(ranx,rany) * -1;
        end   
    end
    
    %Gr�fico de actualizaci�n del sistema en cada intervalo o paso
    figure(2)
    title('Matriz en cada paso')
    image(S*256)
    colormap(gray)
    xlabel('Filas')
    ylabel('Columnas')
    
    m = 0;%Magnetizacion
    for x=1:Lx
        for y=1:Ly
            m = m+S(x,y);
        end
    end
    m(i) = m/(Lx*Ly);
    
    figure(3) %Gr�fico de Magnetizaci�n del sistema normalizado
    title('Magnetizaci�n normalizada')
    plot(i,m(i),'*'),drawnow
    xlabel('N� de pasos')
    ylabel('Magnetizaci�n')
    hold on
end