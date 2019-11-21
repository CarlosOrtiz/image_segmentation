I = imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgMari\a.jpg');
s = size(I);


imgGris= rgb2gray(I);
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

subplot(2,2,1)
imshow(uint8(imgGrisUnion)); 
title('Imagen bordes Union');

imdd = imbinarize(imgGrisUnion);
subplot(2,2,2)
imshow(uint8(imdd));

I2 = imfill(imgGrisUnion)
subplot(2,2,3)
imshow(I2);



    
