function E = fun_energia(Randx,Randy,Lx,Ly,ran,s) %Est? bien?
j = -1;

der = Randx +1;
izq = Randx -1;
arr = Randy +1; 
aba = Randy -1;

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

E = -ran*(s(der,Randy)+s(izq,Randy)+s(Randx,arr)+s(Randx,aba)); %Formula (2), Energ?a localizada 
E = E*-j; %Formula (1), Energ?a para todo el arreglo

end