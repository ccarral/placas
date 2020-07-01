function [A, smallest, biggest, y_prom] = EntrenarImagenPaso1(I)
%   Regresa un mapa de símbolos con sus propiedades

    smallest = 999999;
    biggest = 0;
    
    sizesFileID = fopen('data/acceptable_sizes.bin');

    
    y_sum = 0;

    % Matriz de suma de características
    key={};
    hu_1=[];
    hu_2=[];
    hu_3=[];
    hu_4=[];
    hu_5=[];
    hu_6=[];
    hu_7=[];
    Area=[];
    MajorAxisLength=[];
    MinorAxisLength=[];
    Count = [];
    A = table(key,hu_1,hu_2,hu_3,hu_4,hu_5,hu_6,hu_7,Area,MajorAxisLength,MinorAxisLength,Count);
   
    
    figure(1),
    imshow(I,[]);
    
    BW = Binarizar(I);
    BW2 = Limpiar(BW);
    
    [L, n] = Etiquetar(BW2);
    %figure(2),
    %imshow(L,[]);
    
    for i=1:n
        R = L==i;
        
        area_p = regionprops(R,'Area');
        area = area_p.Area;
        
        
        figure(2),
            imshowpair(L,L==i,'montage');
        
        while 1
            try
                k = input('Si es una región válida, digite el símbolo.\nCaso contrario, presione 0 y ENTER\n#>');
                break;
            catch
                fprintf('Error! Intentalo de nuevo')
            end
        end
        
        
        if k ~= 0
            P = Propiedades(R);
            % Si la región es válida, insertar o actualizar A
            
            % Actualizar biggest y smallest
            area = P(8);
            
            y = P(11);
            
            y_sum = y_sum + y;
            
            if area > biggest
                biggest = area;
            end
            
            if area < smallest
                smallest = area;
            
            end
            
            if keyInMat(k,A)
                % Si ya existe en la tabla, actualizar valores
                A = updateRow(k,A,P);
                
            else
                % Si no existe en la tabla, insertar nueva fila
                newRow = {k , P(1),P(2),P(3),P(4),P(5),P(6),P(7),P(8),P(9),P(10),1};
                A = [A;newRow];
            end
        end
        
 
    end

    num_keys = height(A);
    
    y_prom = y_sum/num_keys;


end

