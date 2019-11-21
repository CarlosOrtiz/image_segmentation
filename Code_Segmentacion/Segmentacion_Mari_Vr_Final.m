clc; % impiar pantalla
clear all; %Borrar laS variables del workspace
I = imread('C:\Users\DANNA\Desktop\Segmentación Mariposas\images_mari\2.jpg'); 
%leer imagen
S= size(I); 
% Tamaño de la imagen
R = I(:,:,1);
V = I(:,:,2);
AZ = I(:,:,3);
PlanoR = (R-V-AZ); %Se restan de la imagen los planos de color verde y azul
figure
imshow(PlanoR);
title('PLANO ROJO')
ROJO_IN = PlanoR>50; % Se eligen los mayores al valor 50 en el plano
d = ROJO_IN
% figure
% imshow(ROJO_IN);
% title('ROJO NORMAL')

% mask = PlanoR>50;

ROJO_IN = medfilt2(ROJO_IN); %medfilt2() Aplicamos la mediana para eliminar posibles ruidos

figure
imshow(ROJO_IN);
title('ROJO MEDIANA')

ROJO_IN = bwareaopen(ROJO_IN,400); % Elimina lo objetos con pixeles inferiores a 400

mask = double(ROJO_IN); % Copia de la imagen ROJO_IN parseada a valores double
I2 = I;
I = double(I);

I(:,:,1) = I(:,:,1).*mask; %Para el plano de rojos
I(:,:,2) = I(:,:,2).*mask; %Para el plano de verdes
I(:,:,3) = I(:,:,3).*mask; %Para el plano de azules

ImGris = rgb2gray(I);
BW = ImGris;

for i=1: S(1)
    for j=1: S(2)
        if(ImGris(i,j)>=120)
         BW(i,j)=255; % Intensifica el numero de pixeles de el color blanco
        end
    end
end

subplot(2,2,1)
imshow(BW);
title('Binarizado')

I3 = imfill(BW, 'holes')
subplot(2,2,2)
imshow(I3);
title('Binarizado Con Relleno')

R1 =I2(:,:,1);
G = I2(:,:,2);
B = I2(:,:,3);

I3 = double(I3);

for i=1: S(1)
    for j=1: S(2)
       if  I3(i,j) == 0
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


X=I2; % Toma las dimensiones de la imagen 
% Se unifican los tres planos en una sola imagen
X(:,:,1) = R1; 
X(:,:,2) = G;
X(:,:,3) = B;

figure
imshow([I2,uint8(X)]);
title('Imagen Segmentada')