function limpia = Limpiar(BW)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
     SE = strel('disk',2,8);
     
     % Letras son blancas
     X = imclose(~BW,SE);
     
     A = imfill(X,'holes');
    %B = imfill(~A,'holes');
    

    
    SE2 = strel('square',4);
    %  letras blancas  <- letras negras, fondo blando
    limpia = ~imerode(~A,SE2);
    
    
    [~,n] = bwlabel(limpia);
    
    if n < 9
        BW = imfill(~BW,'holes');
        limpia = X;
    end
    
end

