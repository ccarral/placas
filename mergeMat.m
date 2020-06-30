function merged = mergeMat(source, dest)
% Actualiza matriz dest con contenidos de source

[Ms,Ns] = size(source);
[Md,Nd] = size(dest);

for i = 1:Ms
    currentKey = source(i,1);
    
    % Checar si la clave actual está en destino
    if keyInMat(currentKey,dest) == 0
        % Si no está, concatenar vector
        cat(1,dest,source(i));
        
    else
        % Si está, sumar a valores previos
        
        % Buscar posición de clave
        for k=1:Md
            if dest(k,1) == currentKey
                for l=2:Nd
                    dest(k,l) = dest(k,l) + source(k,l);
                end
            end
            
        end
        
    end
end

merged = dest;


end

