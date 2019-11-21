img = imread('fl.jpg');
s = size(img); % tamaño de la imagen [alto, ancho, rgb]
imgGris= rgb2gray(img);
imgGrisVer = imgGris;
imgGrisHor = imgGris;
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

figure; 
imshow(uint8(imgGrisVer)); title('Bordes Vertical');
figure; 
imshow(uint8(imgGrisHor)); title('Bordes Horizontal');
figure; 
imshow(uint8(imgGrisUnion)); title('Bordes Union');
   
figure; 
imshow(uint8(imgGrisUnionUmbral)); title('Bordes Union Umbral'); 
    
