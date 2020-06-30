function values = readValues(key)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    fileID = fopen('data/caracteristicas.bin','r');
    
    values = fread(fileID);
    
    values = values(2:5);

end

