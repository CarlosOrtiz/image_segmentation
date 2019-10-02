clc;
clear all;

I = imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgMari\h.jpg');
subplot(3,3,1)
imshow(I)
title('1');

imgray = rgb2gray(I);
subplot(3,3,2)
imshow(imgray)
title('2');

T = graythresh(imgray);

imbw = imbinarize(imgray,T);
subplot(3,3,3)
imshow(imbw)
title('3');

%{
mask = imbw;
I = double(I);
mask = double(mask);

I(:,:,1) = I(:,:,1).*mask; %Para el plano de rojo
I(:,:,2) = I(:,:,2).*mask; %Para el plano de verde
I(:,:,3) = I(:,:,3).*mask; %Para el plano de azul

I = uint8(I);
figure;
imshow(I);
%}


R = I(:,:,1);
subplot(3,3,4)
imshow(R>400);
title('4');

V = I(:,:,2);
AZ = I(:,:,3);
Z = R-V-AZ;
W = Z>51;

subplot(3,3,5)
imshow(W);
title('5');

mask = W;
mask = double(mask);
I2 = I;
I = double(I);
I(:,:,1) = I(:,:,1).*mask; %Para el plano de rojo
I(:,:,2) = I(:,:,2).*mask; %Para el plano de verde
I(:,:,3) = I(:,:,3).*mask; %Para el plano de azul

I= uint8(I);
figure
imshow(I);





