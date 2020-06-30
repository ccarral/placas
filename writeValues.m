function success = writeValues(key, values)
%   Escribe características de símbolo 'key' a archivo caracteristicas.bin
%   key: caracter detectado
%   values: vector de len = 4 que almacena propiedades

    fileID = fopen('data/caracteristicas.bin','w');
    newValues = [key, values(1), values(2), values(3), values(4)];
    
    % Verificar si existe 'key'
    A = fread(fileID);
    
    foundKey = 0;
    [M, N] = size(A);
    for i=1:M
        if A(i,1) == key
            foundKey = 1;
            A(i,2) = values(1);
            A(i,3) = values(2);
            A(i,4) = values(3);
            A(i,5) = values(4);
            break;
        end
    end
    
    if foundKey == 0
        A = cat(1,A,newValues);
    end
    
    fwrite(fileID,A);
    fclose(fileID);
    % No news is good news
    success = 0;

end

