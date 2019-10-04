clc; % impiar pantalla
clear all; %Borrar las variables del workspace
I = imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgMari\2.jpg'); %leer imagen
s= size(I);
R = I(:,:,1);
V = I(:,:,2);
AZ = I(:,:,3);
Z = (R-V-AZ);
W = Z>20;
% mask = Z>50;

W = medfilt2(W); % Aplicamos la mediana para eliminar posibles ruidos
ST = strel('square',3);
W = imclose(W,ST); 
W = bwareaopen(W,400)

mask = W;
mask = double(mask);
I2 = I;
I = double(I);

I(:,:,1) = I(:,:,1).*mask; %Para el plano de rojo
I(:,:,2) = I(:,:,2).*mask; %Para el plano de verde
I(:,:,3) = I(:,:,3).*mask; %Para el plano de azul
%I= uint8(I);
%{
figure
imshow([I2,I]);
title('Resultado');
%}

ImGris = rgb2gray(I);

BW = imbinarize(ImGris);
subplot(2,2,1)
imshow(BW);
title('Binarizada')

I3 = imfill(BW, 'holes')
subplot(2,2,2)
imshow(I3);
title('Binarizada Rellenada')

R1 =I2(:,:,1);
G = I2(:,:,2);
B = I2(:,:,3);

I3 = double(I3);

for i=1: s(1)
    for j=1: s(2)
       if  BW(i,j) == 0
           R1(i,j)=0;
           G(i,j)=0;
           B(i,j)=0;
       else
           R1(i,j)=R(i,j);
           G(i,j)=V(i,j);
           B(i,j)=AZ(i,j);
       end
    end
end


X=I2;
X(:,:,1) = R1;
X(:,:,2) = G;
X(:,:,3) = B;

figure
imshow([I2,uint8(X)]);
title('Resultado Final')
