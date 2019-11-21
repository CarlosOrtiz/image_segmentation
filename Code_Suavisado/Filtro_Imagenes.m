I = imread('fl.jpg');
S = size(I);

Icopia= I;

Ired = I(:,:,1);
Igre = I(:,:,2);
Iblu = I(:,:,3);

%Convertir a double

Ired = double(Ired);
Igre = double(Igre);
Iblu = double(Iblu);

M=[1 1 1; 1 1 1; 1 1 1];

for i =2:S(1)-1
  for j=2:S(2)-1
     %Icopia(i,j)=((Icopia(i-1,j-1)*M(1,1))+(Icopia(i-1,j)*M(1,2))+(Icopia(i-1,j+1)*M(1,3))+(Icopia(i,j-1)*M(2,1))+(Icopia(i,j)*M(2,2))+(Icopia(i,j+1)*M(2,3))+(Icopia(i+1,j-1)*M(3,1))+(Icopia(i+1,j)*M(3,2))+(Icopia(i+1,j+1)*M(3,3)))/9;
     Ired(i,j) = ((Ired(i-1,j-1)*M(1,1))+(Ired(i-1,j)*M(1,2))+(Ired(i-1,j+1)*M(1,3))+(Ired(i,j-1)*M(2,1))+(Ired(i,j)*M(2,2))+(Ired(i,j+1)*M(2,3))+(Ired(i+1,j-1)*M(3,1))+(Ired(i+1,j)*M(3,2))+(Ired(i+1,j+1)*M(3,3)))/9;
     Igre(i,j) = ((Igre(i-1,j-1)*M(1,1))+(Igre(i-1,j)*M(1,2))+(Igre(i-1,j+1)*M(1,3))+(Igre(i,j-1)*M(2,1))+(Igre(i,j)*M(2,2))+(Igre(i,j+1)*M(2,3))+(Igre(i+1,j-1)*M(3,1))+(Igre(i+1,j)*M(3,2))+(Igre(i+1,j+1)*M(3,3)))/9;
     Iblu(i,j) = ((Iblu(i-1,j-1)*M(1,1))+(Iblu(i-1,j)*M(1,2))+(Iblu(i-1,j+1)*M(1,3))+(Iblu(i,j-1)*M(2,1))+(Iblu(i,j)*M(2,2))+(Iblu(i,j+1)*M(2,3))+(Iblu(i+1,j-1)*M(3,1))+(Iblu(i+1,j)*M(3,2))+(Iblu(i+1,j+1)*M(3,3)))/9;
  end
end

Icopia(:,:,1)=Ired;
Icopia(:,:,2)=Igre;
Icopia(:,:,3)=Iblu;

figure;
imshow(uint8(I)); 
figure;
imshow(uint8(Icopia)); 