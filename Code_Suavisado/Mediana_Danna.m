img = imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgMari\2.jpg');
imgMediana = img; % Imagen para mostrar filtro de la media%
s = size(img); % tamaño de la imagen [alto, ancho, rgb]
arrR= zeros(); 
arrG= zeros(); 
arrB= zeros(); 

cont=0;

imgCB= img;
imgCR=img;
imgCG= img;

masc = [1 1 1;1 1 1;1 1 1];
smas = size(masc); % tamaño de la mascara%

itam = round((s(1)/2)*-1); % inicialmente en 3/2 =1.5 ->2
jtam = floor((s(2)/2)*-1);  % inicialmente en 3/2 =1.5 ->1
inicio = smas(1)-1; % inicialmente 3-1 =2
fin = smas(2); % incialmente 3


for i = itam:(s(1)-jtam)
    for j = itam:(s(2)-jtam)
        
        for k = inicio:fin
            for l = inicio:fin
                cont= cont+1; 
                %Capturando valor del pixel
                arrR(cont) = acumR+((imgCR((k+i),(l+j))));
                arrG(cont) = acumG+((imgCG((k+i),(l+j))));
                arrB(cont) = acumB+((imgCB((k+i),(l+j))));
            end
        end
        
        %Ordenamiento de los arreglos
        arrR= sort(arrR);
        arrG= sort(arrG);
        arrB= sort(arrB);
       
        %Asignando valor al pixel i,j
        imgCR(i,j)= arrR(round(size(arrR,2)/2));
        imgCG(i,j)= arrG(round(size(arrG,2)/2));
        imgCB(i,j)= arrB(round(size(arrB,2)/2));
        
        cont=0;
    end       
end
%Uniendo los planos
imgMediana(:,:,1)=imgCR;
imgMediana(:,:,2)=imgCG;
imgMediana(:,:,3)=imgCB;

figure; %me muestra una ventana
imshow(uint8(img));title('Imagen original'); 

figure; 
imshow(uint8(imgMediana)); title('Imagen mediana danna');