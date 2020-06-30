%I = imread('placa1.jpg');


list = dir('img/*.jpg');
files = [];
number_of_files = size(list);

% 
% for i= 1: number_of_files(1,1)
%     filename = list(i).name;
%     I = imread(filename);
%     BW = Binarizar(I);
%     BW2 = Limpiar(BW);
%     
%     [L1,n] = bwlabel(BW2);
%     
%     fprintf("file: %s , n: %d\n",filename, n);
% 
%     figure(1),
%     imshow(label2rgb(L1));
%     input('Presiona enter para continuar');
% end

[A,S,biggest,smallest] = EntrenarImagenPaso1('img/placa2.jpg');
