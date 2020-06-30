function success = writeDist(key,dist)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    fileID = fopen('data/dist.bin','w');
    
    A = fread(fileID);
    
    foundKey = 0;
    [M, N] = size(A);
    for i=1:M
        if A(i,1) == key
            foundKey = 1;
            A(i,2) = dist;
            break;
        end
    end
    
    if foundKey == 0
        A = cat(1,A,[key dist]);
    end

    fwrite(fileID,A);
    fclose(fileID);
    % No news is good news
    success = 0;

end

