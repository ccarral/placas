function imbw = Binarizar(I)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    G = rgb2gray(I);
    G = imadjust(G);
    %BW = imbinarize(G);
    BW = imbinarize(G,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);
    [L, n] = bwlabel(BW);
    fprintf("Desde binarizar: n=%d\n",n);
    
    if n<=9
        BW = imbinarize(G);
        fprintf("Alternative bin");
    end
    
    imbw = BW;


end

