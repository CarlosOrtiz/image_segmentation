I = imread('10.jpg');
b= rgb2hsv(I);  %se separa la imagen en HVS es decir en matriz, saturacion, brillo
H= b(:,:,1);
S= b(:,:,2); %Obtenemos la division  de los compomentes HSV
V= b(:,:,3);

subplot(3,3,1); % se puede elegir derivar a partir de la matriz
imshow(I);
title('Matriz Original');

subplot(3,3,2); % se puede elegir derivar a partir de la matriz
imshow(H);
title('Matriz');

subplot (3,3,3); % O de la saturacion
imshow(S);
title('Saturacion');

%subplot(2,2,3);x
%imshow(V);

G=H>=0.95;
%1 y 0
subplot(3,3,4); % Se realiza la umbralizacion  o binarizacion de 
imshow(G); % La Imagen para tener una mejora visible 
title('Binarizacion Matriz'); % Se mejora la visibilidad  de la parte  que nos importa
% la imagen 
F=S>=0.5;
subplot(3,3,5);
imshow(F);
title('Binarizacion Saturacion');

%F=S>=0.05
%subplot(2,2,4);
%imshow(F);

B =[0 1 1; 1 1 1;0 1 0];
[n,m]=size(G);
[P,Q]=size(B);
c=ones(n+P-1,m+Q-1);
for i=1:P
    for j=1:Q
        if B(i,j) == 1
            c(i:n+i-1,j:m+j-1)=c(i:n+i-1,j:m+j-1)& G; 
        end
    end
end
subplot(3,3,6);
imshow(c)
title('Erosion Matriz');


B =[0 1 1; 1 1 1;0 1 0];
[n,m]=size(G);
[P,Q]=size(B);
d=ones(n+P-1,m+Q-1);
for i=1:P
    for j=1:Q
        if B(i,j) == 1
            d(i:n+i-1,j:m+j-1)=d(i:n+i-1,j:m+j-1)& F; 
        end
    end
end
subplot(3,3,7);
imshow(d)
title('Erosion Saturada');

W=medfilt2(c);
subplot(3,3,8);
imshow(W);
title('Filtro Matriz');




