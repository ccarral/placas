
list = dir('*.jpg');
number_of_files = size(list);

for i= 1: number_of_files(1,1)
    filename = list(i).name;
    I = imread(filename);
    
    imshow(I);
    
    INICIEN A REALIZAR SU PROCESO DE IDENTIFICACIÓN  GUIDE
end