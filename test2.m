% Test 2

% I = imread('placa9.jpg');
% 
% G = rgb2gray(I);
% G = imadjust(G);
% 
% B1 = imbinarize(G);
% B2 = imbinarize(G,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);
% figure(1),
% imshow(B1);
% 
% figure(2),
% imshow(B2);
% 
% 
% figure(3),
% imshow(Limpiar(B2));

BW = Binarizar(imread('img/placa1.jpg'));

BW = Limpiar(BW);

[L,n] = Etiquetar(BW);

R = L==5;

props = regionprops(R,'Centroid');


