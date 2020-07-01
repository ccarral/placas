function [A, smallest, biggest, y_prom] = EntrenarPaso1(D)

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
smallest = 99999;
biggest = 0;
y_sum = 0;
n = length(D);


for i=1:n
    
    filename = D(i).name;
    I = imread(filename);
    [Ai, smallest_i, biggest_i, y_prom_i] = EntrenarImagenPaso1(I);
    
    y_sum = y_sum + y_prom_i;
    
    if biggest_i > biggest
        biggest = biggest_i;
    end
    
    if smallest < smallest_i
        smallest = smallest_i;
    end
    
    % Combinar Ai con A
    A = mergeMat(Ai,A);

end

num_keys = height(A);

y_prom = y_sum/num_keys;


end

