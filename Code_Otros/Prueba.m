I = imread('fl.jpg');

Iblur = imgaussfilt(I, 2);

figure; 
imshow(I);

figure;
imshow(Iblur);
