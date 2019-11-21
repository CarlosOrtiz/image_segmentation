%% Borrar Varibles de la consola Command Window y del Workspace(cache)
clc;
clearvars; 
clear all;
%% Guardar La Imagen Y El Tamaño
I = imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\Prueba.jpg');  %Leer imagen
S= size(I); % Tamaño de la imagen

%% Planos RGB De La Imagen I
R = I(:,:,1); %Rojo
V = I(:,:,2); %Verde
AZ = I(:,:,3);%Azul

%% Para Guardar El Plano Rojo En La Variable ROJO_IN
ROJO_IN = R; 

%% Estructura For Para Ejecutar Pixel Por Pixel La Red Neuronal Para Clasificar
for i=1: S(1)
    for j=1: S(2)
           X1=R(i,j);
           Y=V(i,j);
           Z=AZ(i,j);       
           Res = NeuralClassification([double(X1);double(Y);double(Z)]);
       if (Res>0)
          ROJO_IN(i,j)=255;
       else 
           ROJO_IN(i,j)=0;
       end
    end
end

%% Elimiar Grupos De Pixeles Inferiores a 400 
ROJO_IN = bwareaopen(ROJO_IN,400); 

%% Código 
mask = double(ROJO_IN); % Copia de la imagen ROJO_IN parseada a valores double
I2 = I; %Copia De La Imagen Original 
I = double(I); %Parsear La Imagen Original

I(:,:,1) = I(:,:,1).*mask; %Para el plano de rojos
I(:,:,2) = I(:,:,2).*mask; %Para el plano de verdes
I(:,:,3) = I(:,:,3).*mask; %Para el plano de azules

ImGris = rgb2gray(I); % Convertir La Imagen Original 'I' En Blanco Y Negro
BW = ImGris; % Creamos Una Copia De La Varible ImGris 

%% Binarizamos
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

%% Se Utiliza La Funcion Imfill() Para Rellenar Los Agujeros De La Imagen BW(Binarizada)
I3 = imfill(BW, 'holes')
subplot(2,2,2)
imshow(I3);
title('Binarizado Con Relleno')

%% Establecemos Variables Para Guardar Los Colres De Los Planos De La Copia De La Imagen Orinal 'I2'
R1 =I2(:,:,1);
G = I2(:,:,2);
B = I2(:,:,3);

I3 = double(I3); %Parseamos La Imagen I3 Para Almacenar Datos Numericos

%% Estructura For Anidada, Para Guardas Las Posiciones Donde Estan Los Objetos De Interes De La Imagen I3
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

%% Código Para Visualizar La Imagen Con Los Objetos Clasificados

X=I2; % Toma las dimensiones de la imagen 
% Se unifican los tres planos en una sola imagen
X(:,:,1) = R1; 
X(:,:,2) = G;
X(:,:,3) = B;
%Visualizamos La Imagen Orinal Y La Imagen Clasificada
figure
imshow([I2,uint8(X)]);
title('Imagen Segmentada')
