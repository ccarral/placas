%%%%% Script de entrenamiento no supervisado %%%%%%

BIN_FILE_CARACT = 'data/caracteristicas.bin';
BIN_FILE_BIGGEST_SMALLEST = 'data/acceptable_sizes.bin';
BIN_FILE_Y_PROM = 'data/y_prom.bin';

% Generar lista de imágenes para entrenamiento

% TODO: Cambiar parámetros en EntrenarPaso1 para que acepte estructura dir
%D =['img/placa10.jpg', 'img/placa11.jpg', 'img/placa12.jpg', 'img/placa13.jpg', 'img/placa14.jpg', 'img/placa15.jpg', 'img/placa16.jpg', 'img/placa17.jpg', 'img/placa18.jpg', 'img/placa19.jpg', 'img/placa1.jpg', 'img/placa20.jpg', 'img/placa21.jpg', 'img/placa22.jpg', 'img/placa23.jpg', 'img/placa24.jpg', 'img/placa25.jpg', 'img/placa2.jpg', 'img/placa3.jpg', 'img/placa4.jpg', 'img/placa5.jpg', 'img/placa6.jpg', 'img/placa7.jpg', 'img/placa8.jpg', 'img/placa9.jpg' ];

D = dir('*.jpg');


[A,S,smallest,biggest, y_prom] = EntrenarPaso1(D);

sizes = [smallest biggest];

% Obtener los valores de A que se escribirán en el archivo.

[M,N] = size(A);

Afile = zeros(M,N);

for i=1:M
    for j=1:N
        Afile(i,j) = A(i,j)/S(i,2);
    end
end

AfileID = fopen(BIN_FILE_CARACT,'w');

sizesFileID = fopen(BIN_FILE_BIGGEST_SMALLEST,'w');

y_promID = fopen(BIN_FILE_Y_PROM,'w');



fwrite(AfileID, Afile);
fwrite(sizesFileID,sizes);
fwrite(y_promID, y_prom);



