%%%%% Script de entrenamiento no supervisado %%%%%%

% Generar lista de imágenes para entrenamiento

dirs = dir('img/*.jpg');

l = length(dirs);

D = [string(dirs(1).name)];

for i=2:l
    D = cat(1,D,[string(dirs(i).name)]);
end