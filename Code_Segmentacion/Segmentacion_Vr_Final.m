clc; % impiar pantalla
clear all; %Borrar laS variableS del workspace
I = imread('6.jpg'); %leer imagen
S= size(I);
R = I(:,:,1);
V = I(:,:,2);
AZ = I(:,:,3);
PlanoR = (R-V-AZ);
ROJO_IN = PlanoR>50;

ROJO_IN =  medfilt2(ROJO_IN); %Aplicamos la mediana para eliminar posibles ruidos

figure
imshow(ROJO_IN);

ROJO_IN = bwareaopen(ROJO_IN,400)

mask = ROJO_IN;
mask = double(mask);
I2 = I;
I = double(I);

I(:,:,1) = I(:,:,1).*mask; %Para el plano de rojo
I(:,:,2) = I(:,:,2).*mask; %Para el plano de verde
I(:,:,3) = I(:,:,3).*mask; %Para el plano de aPlanoRul

ImGris = rgb2gray(I);

%binarizada 
for i =1:S(1)
  for j=1:S(2)
    if (ImGris(i,j) >= 1)
         ImGris(i,j) = 255;
    else 
        ImGris(i,j) = 0;
    end
  end
end

BW = ImGris;
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
title('Imagen Segmentada')
