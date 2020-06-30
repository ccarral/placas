function inMat = keyInMat(k,A)
%Evalua si una clave 'k' se encuentra en la columna (1) de una matriz M

    [M,N] = size(A);
    inMat=0;
    
    for i=1:M
        fprintf("i:%d",i);
        if A(i,1) == k
            inMat = 1;
            break;
        end
    end

end

