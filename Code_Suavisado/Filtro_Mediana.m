I = imread('fl.jpg');
S = size(I);

Icopia= I;

Ired = I(:,:,1);
Igre = I(:,:,2);
Iblu = I(:,:,3);


Ired = double(Ired);
Igre = double(Igre);
Iblu = double(Iblu);

Arr = zeros();
cont =0 ;
M=[1 1 1; 1 1 1; 1 1 1];

for i =2:S(1)-1
  for j=2:S(2)-1
  
      for k=0: (i+1)
         for l=0: (j+1)
             cont = cont +1;
             Arr(cont) = Icopia(k,l);
         end
      end
      
for i2=0: Arr-1
   for j2=i2+1: j2< Arr
     if Arr(i2)>Arr(j2)
     aux =  Arr(i2);
     Arr(i2) = Arr(j2);
     Arr(j2) = aux;
     end
   end
end
  end
end

Icopia(:,:,1)=Arr;
Icopia(:,:,2)=Igre;
Icopia(:,:,3)=Iblu;

figure;
imshow(uint8(I)); 
figure;
imshow(uint8(Icopia)); 