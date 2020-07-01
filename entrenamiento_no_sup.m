%%%%% Script de entrenamiento no supervisado %%%%%%

DAT_FILE_CARACT = 'data/caracteristicas.dat';
BIN_FILE_BIGGEST_SMALLEST = 'data/acceptable_sizes.bin';
BIN_FILE_Y_PROM = 'data/y_prom.bin';

% Generar lista de imágenes para entrenamiento

% TODO: Cambiar parámetros en EntrenarPaso1 para que acepte estructura dir
%D =['img/placa10.jpg', 'img/placa11.jpg', 'img/placa12.jpg', 'img/placa13.jpg', 'img/placa14.jpg', 'img/placa15.jpg', 'img/placa16.jpg', 'img/placa17.jpg', 'img/placa18.jpg', 'img/placa19.jpg', 'img/placa1.jpg', 'img/placa20.jpg', 'img/placa21.jpg', 'img/placa22.jpg', 'img/placa23.jpg', 'img/placa24.jpg', 'img/placa25.jpg', 'img/placa2.jpg', 'img/placa3.jpg', 'img/placa4.jpg', 'img/placa5.jpg', 'img/placa6.jpg', 'img/placa7.jpg', 'img/placa8.jpg', 'img/placa9.jpg' ];

D = dir('*.jpg');


[A,smallest,biggest, y_prom] = EntrenarPaso1(D);

sizes = [smallest biggest];

% Obtener los valores de A que se escribirán en el archivo.

sizesFileID = fopen(BIN_FILE_BIGGEST_SMALLEST,'w');

y_promID = fopen(BIN_FILE_Y_PROM,'w');

% Obtener tabla con valores promediados

Aprom = A(:,1:11);

numRowsA = height(Aprom);

for i=1:numRowsA
    count = A(1,12).Count;
    
    currentRow = A(i,1:11);

    currentRow.hu_1 = currentRow.hu_1/count;
    currentRow.hu_2 = currentRow.hu_2/count;
    currentRow.hu_3 = currentRow.hu_3/count;
    currentRow.hu_4 = currentRow.hu_4/count;
    currentRow.hu_5 = currentRow.hu_5/count;
    currentRow.hu_6 = currentRow.hu_6/count;
    currentRow.hu_7 = currentRow.hu_7/count;


    currentRow.Area = currentRow.Area/count;
    currentRow.MajorAxisLength = currentRow.MajorAxisLength/count;
    currentRow.MinorAxisLength = currentRow.MinorAxisLength/count;

    Aprom(i,:) = currentRow;

end


writetable(Aprom,DAT_FILE_CARACT);
fwrite(sizesFileID,sizes);
fwrite(y_promID, y_prom);



