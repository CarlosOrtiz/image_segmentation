I = imread('fl.jpg');
S = size(I);
IGris = rgb2gray(I);

M=[-1 0 1; -8 0 8; -1 0 1];

Img = S;
IGris = conv2(M,IGris);

h=120;
for i =1:S(1)
  for j=1:S(2)
    if (IGris(i,j) >= h)
         Img(i,j) = 255;
    else 
        Img(i,j) = 0;
    end
  end
end

figure; 
imshow(uint8(IGris))
title("IGris");

figure; 
imshow(uint8(Img))
title("Img");