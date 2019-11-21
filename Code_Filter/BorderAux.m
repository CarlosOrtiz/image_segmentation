img = imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgMari\a.jpg');
s = size(img); % tamaño de la imagen [alto, ancho, rgb]
imgGris= rgb2gray(img);
imgGrisVert = imgGris;
imgGrisHori = imgGris;
imgGrisUnion = imgGris;
imgGrisUnionUmbral = imgGris;
mascVert = zeros();
mascHori = zeros();
tamMasc =3;
umbral = 200;


for i= 1: tamMasc
    x1 = -1;
   for  j=1:tamMasc
   mascVert(i,j)=x1;
   x1 = x1+1;
   end
end

x1 = -1;
for i= 1: tamMasc
   for  j=1:tamMasc
   mascHori(i,j)=x1;
   end
     x1 = x1+1;
end

imgGrisVert = conv2(mascVert,imgGris);
imgGrisHori = conv2(mascHori,imgGris);

for i = 1 : s(1)
    for j = 1 : s(2)
       imgGrisUnion(i,j) = sqrt((imgGrisVert(i,j)^2)+ (imgGrisHori(i,j)^2));
         if(imgGrisUnion(i,j)>=umbral)
              imgGrisUnionUmbral(i,j)=255;
         else
             imgGrisUnionUmbral(i,j)=0;
         end
    end
end

figure; %me muestra una ventana
imshow(uint8(img));title('Imagen original'); 

R = imgGrisVert(:,:,1);
V = imgGrisVert(:,:,2);
AZ = imgGrisVert(:,:,3);
Z = (R-V-AZ);
mask = Z>51;
mask = double(mask);
I24 = imgGrisVert;
imgGrisVert = double(imgGrisVert);
imgGrisVert(:,:,1) = imgGrisVert(:,:,1).*mask; %Para el plano de rojo
imgGrisVert(:,:,2) = imgGrisVert(:,:,2).*mask; %Para el plano de verde
imgGrisVert(:,:,3) = imgGrisVert(:,:,3).*mask; %Para el plano de azul
imgGrisVert= uint8(imgGrisVert);
figure
imshow(uint8([I24,imgGrisVert]));
title('Resultado');

figure; 
imshow(uint8(imgGrisVert)); title('Imagen bordes verti');
figure; 
imshow(uint8(imgGrisHori)); title('Imagen bordes hori');
figure; 
imshow(uint8(imgGrisUnion)); title('Imagen bordes Union');
   
figure; 
imshow(uint8(imgGrisUnionUmbral)); title('Imagen bordes Union Umbral'); 
    