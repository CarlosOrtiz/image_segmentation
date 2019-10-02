clc
clear all;
close all;

img = imread('10.jpg');

subplot(3,3,1);
imshow(img);
title('1');

umbral = graythresh(img);
imag_bw = im2bw(img, umbral);
subplot(3,3,2);
imshow(imag_bw);
title('2');

imag_bw_label = bwlabel(imag_bw);
figure
imshow(label2rgb(imag_bw_label));
title('3');

propiedades = regionprops(imag_bw_label);

%EdgeColor Es como una libreri de comandos de colores para los rectangulos 
% r es para rojo link  https://la.mathworks.com/help/matlab/ref/rectangle.html#d117e1222970
for k = 1: length(propiedades)
    caja= propiedades(k).BoundingBox;
    rectangle('Position', [caja(1),caja(2),caja(3),caja(4)],...
    'EdgeColor','r','LineWidth',3);  
end

%Para dividir los rectangulos seleccionados ojo aqui es donde salen todas
%esas ventanitas de la toma de imagenes
%{
for k=1: length(propiedades)
    caja= propiedades(k).BoundingBox;
    figure
    imshow(img(caja(2):caja(2)+caja(4),caja(1):caja(1)+caja(3),:));
end
%}



