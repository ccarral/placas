function inMat = keyInMat(k,A)
%Evalua si una clave 'k' se encuentra en la columna (1) de una matriz M
inMat = 0;

n = height(A(strcmp(A.key,k),:));

if n > 0
    inMat = 1;
end


end

