ImgPajaro = imread('fl.jpg');
S = size(ImgPajaro);
%{ 
ImgG = S;
ImgR = S;
ImgB = S; 
%}

ImgBini = S;
Igris = rgb2gray(ImgPajaro); 

%{ 
for i =1:S(1)
  for j=1:S(2)
      % PARA ROJO
      ImgR(i,j,1) = ImgPajaro (i,j,1);
      ImgR(i,j,2) = 0;
      ImgR(i,j,3) = 0;
      
      %PARA VERDE
      ImgG(i,j,1) = 0;
      ImgG(i,j,2) = ImgPajaro (i,j,2);
      ImgG(i,j,3) = 0;
      
      %PARA BLANCO
      ImgB(i,j,1) = 0;
      ImgB(i,j,2) = 0;
      ImgB(i,j,3) = ImgPajaro (i,j,3);
     
  end
end
figure;
imshow(ImgR);

figure;
imshow(ImgG);
%255 blanco 
%}
%{ 

%binarizada
h =120; umbral
for i =1:S(1)
  for j=1:S(2)
    if (Igris(i,j) >= h)
         ImgBini(i,j) = 255;
    else 
        ImgBini(i,j) = 0;
    end
  end
end

figure;
imshow(ImgBini);

 %}








