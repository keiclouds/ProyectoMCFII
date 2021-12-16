function S = fun_lattice(Lx,Ly) %Genera matriz random, pidiendo las dimensiones para crear la matriz
    for y = 1:Ly
        for x = 1:Lx
            if rand < 0.5
                S(x,y)=1;
            else
                S(x,y)=-1;
            end

        end
    end
end