function merged = mergeMat(source, dest)
% Actualiza matriz dest con contenidos de source

[Ms,Ns] = size(source);
[Md,Nd] = size(dest);
assert(Ns==Nd);

for is = 1:Ms
    currentKey = source(is,1);
   
    % Checar si la clave actual está en destino
    if keyInMat(currentKey,dest) == 0
        % Si no está, concatenar vector
        dest = cat(1,dest,source(is,:));
        
    else
        % Si está, sumar a valores previos
        
        % Buscar posición de clave en dest
        for id=1:Md
            if dest(id,1) == currentKey
                for jd=2:Nd
                    dest(id,jd) = dest(id,jd) + source(is,jd);
                end
            end
            
        end
        
    end
end

merged = dest;


end

