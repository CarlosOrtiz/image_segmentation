
grayImage = imread ( 'C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgMari\a.jpg' );
[edgeImage, umbral] = borde (grayImage, 'Sobel' , 0,5);
   % Será mostrar 0,5

[~,threshold] = edge(I,'sobel');

fudgeFactor = 0.5; 
BWs = edge(I,'sobel',umbral * fudgeFactor);
imshow(BWs) 
title('Binary Gradient Mask')