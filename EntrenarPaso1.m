function [A, S, smallest, biggest, y_prom] = EntrenarPaso1(D)

A = 0;
S = 0;
smallest = 99999;
biggest = 0;
y_sum = 0;
n = length(D);


for i=1:n
    
    %filename = strcat(D(i).folder,'/',D(i).name);
    filename = D(i).name;
    I = imread(filename);
    [Ai, Si, smallest_i, biggest_i, y_prom_i] = EntrenarImagenPaso1(I);
    
    y_sum = y_sum + y_prom_i;
    
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

num_keys = length(A(1));

y_prom = y_sum/num_keys;


end

