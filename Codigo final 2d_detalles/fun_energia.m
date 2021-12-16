function E = fun_energia(Randx,Randy,Lx,Ly,ran,s)
%Las variables son: posicion x e y del elemento random, las dimensiones de
%la matriz inicial, el valor del elemento random (+1 o -1) y la matriz inicial.

j = -1; %Constante 

der = Randx +1;
izq = Randx -1;
arr = Randy +1; 
aba = Randy -1;

%Se definen condiciones de borde periódicas
if der == Lx +1
    der = 1;
end

if izq == 0
    izq = Lx;
end

if arr == Ly +1
    arr = 1;
end

if aba == 0
    aba = Ly;
end

E = -ran*(s(der,Randy)+s(izq,Randy)+s(Randx,arr)+s(Randx,aba)); %Formula (2), Energía localizada 
E = E*-j; %Formula (1), Energía para todo el arreglo

end