function [A, S, smallest, biggest] = EntrenarImagenPaso1(fname)
%   Regresa un mapa de símbolos con sus propiedades

    smallest = 999999;
    biggest = 0;
    

    % Matriz de suma de características
    A = 0;
    
    % Matriz de Conteo de mediciones
    % El número de filas en S es el mismo que en A.
    S = 0;
    
    
    I = imread(fname);
    
    figure(1),
    imshow(I,[]);
    
    BW = Binarizar(I);
    BW2 = Limpiar(BW);
    
    [L, n] = Etiquetar(BW2);
    figure(2),
    imshow(L,[]);
    
    for i=1:n
        R = L==i;
        figure(3),
        imshow(L==i);
        k = input('Si es una región válida, digite el símbolo.\nCaso contrario, presione 0 y ENTER\n#>');
        
        if k ~= 0
            P = Propiedades(R);
            % Si la región es válida, insertar o actualizar A y S
            
            % Actualizar biggest y smallest
            area = P(8);
            
            if area > biggest
                biggest = area;
            end
            
            if area < smallest
                smallest = area;
            end
            
            if A == 0
                A = [k P(1) P(2) P(3) P(4) P(5) P(6) P(7) P(8) P(9) P(10)];
                S = [k 1];
            else
                % Si el valor ya está en la matriz, actualizar
                if keyInMat(k,A) == 1
                    [M,N] = size(A);
                    for i=1:M
                        if A(i,1) == k
                            for j=2:N
                                A(i,j) = A(i,j) + P(j-1);
                            end
                            S(i,2)  = S(i,2) + 1;
                        end
                    end
                else
                    % Si el valor no está en A, concatenar a A y S
                    newVecA = [k P(1) P(2) P(3) P(4) P(5) P(6) P(7) P(8) P(9) P(10)];
                    A = cat(1,A,newVecA);
                    
                    newVecS = [k 1];
                    S = cat(1,S,newVecS);
                end
            end
        end
        
 
    end



end

