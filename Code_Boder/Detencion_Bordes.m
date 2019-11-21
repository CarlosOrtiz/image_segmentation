I = imread('10.jpg');

Icopia = rgb2gray(I);
[dx,dy] = gradient(double(Icopia)); 

M = uint8(sqrt(dx.^2+dy.^4));

figure; 
imshow(M)
title("Demostración");

