function [A, S, smallest, biggest] = EntrenarPaso1(images)

A = 0;
S = 0;
smallest = 99999;
biggest = 0;

n = length(images);

for i=1:n
    I = imread(images(i));
    [Ai, Si, smallest_i, biggest_i] = EntrenarImagenPaso1(I);
    
    if biggest_i > biggest
        biggest = biggest_i;
    end
    
    if smallest < smallest_i
        smallest = smallest_i;
    end
    
    % Combinar Ai con A, Si con S, ...
    if A == 0
        A = Ai;
        S = Si;
    else
        A = mergeMat(Ai,A);
        S = mergeMat(Si,S);
    end
end


end

