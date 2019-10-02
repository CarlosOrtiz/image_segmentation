rgb = imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgMari\a.jpg');

I = rgb2gray(rgb);
subplot(3,3,1);
imshow(I) ;

gmag = imgradient(I);
subplot(3,3,2);
imshow(gmag,[])
title('Gradient Magnitude')

L = watershed(gmag);
Lrgb = label2rgb(L);
subplot(3,3,3);
imshow(Lrgb)
title('Watershed Transform of Gradient Magnitude')

se = strel('disk',20);
Io = imopen(I,se);
subplot(3,3,4);
imshow(Io) 
title('Opening')

Ie = imerode(I,se);
Iobr = imreconstruct(Ie,I);
subplot(3,3,5);
imshow(Iobr)
title('Opening-by-Reconstruction')

Ioc = imclose(Io,se); 
subplot(3,3,6);
imshow(Ioc)
title('Opening-Closing')

Iobrd = imdilate(Iobr,se);
Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
subplot(3,3,7);
imshow(Iobrcbr) 
title('Opening-Closing by Reconstruction');

fgm = imregionalmax(Iobrcbr); 
subplot(3,3,8);
imshow(fgm) 
title('Regional Maxima of Opening-Closing by Reconstruction');


bw = imbinarize(Iobrcbr); 
figure
imshow(bw) 
title('Reconstruction capol');

ImgCopia = bw;

imag_bw = imbinarice(ImgCopia);
figure;
imshow(imag_bw);
title('2');

imag_bw_label = bwlabel(ImgCopia);
figure;
imshow(label2rgb(imag_bw_label));
title('3');

propiedades = regionprops(imag_bw_label);

for k = 1: length(propiedades)
    caja= propiedades(k).BoundingBox;
    rectangle('Position', [caja(1),caja(2),caja(3),caja(4)],...
    'EdgeColor','r','LineWidth',3);  
end

for k=1: length(propiedades)
    caja= propiedades(k).BoundingBox;
    figure
    imshow(ImgCopia(caja(2):caja(2)+caja(4),caja(1):caja(1)+caja(3),:));
end

%{
D = bwdist(bw); DL = watershed(D);
bgm = DL == 0;
subplot(3,3,3);
imshow(bgm)
title('Watershed Ridge Lines)');

gmag2 = imimposemin(gmag, bgm | fgm4);

L = watershed(gmag2);

labels = imdilate(L==0,ones(3,3)) + 2*bgm + 3*fgm4; I4 = labeloverlay(I,labels); 
subplot(3,3,4);
imshow(I4)
title('Markers and Object Boundaries Superimposed on Original Image')

Lrgb = label2rgb(L,'jet','w','shuffle');
subplot(3,3,5);
imshow(Lrgb)
title('Colored Watershed Label Matrix')

figure imshow(I) hold on himage = imshow(Lrgb);
himage.AlphaData = 0.3; 
title('Colored Labels Superimposed Transparently on Original Image')
%}
