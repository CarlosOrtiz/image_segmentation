%% Borrar Varibles de la consola Command Window y del Workspace(cache)
clc;
clearvars; 
%% Parametros De Entrenamiento Buenos Para El Apendizaje De La Red Neuronal
ImagenEntradaBuena1= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\1.jpg');
MazanaGala1= imcrop(ImagenEntradaBuena1);

ImagenEntradaBuena2= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\2.jpg');
MazanaGala2= imcrop(ImagenEntradaBuena2);

ImagenEntradaBuena3= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\3.jpg');
MazanaGala3= imcrop(ImagenEntradaBuena3);

ImagenEntradaBuena4= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\4.jpg');
MazanaGala4= imcrop(ImagenEntradaBuena4);

ImagenEntradaBuena5= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\5.jpg');
MazanaGala5= imcrop(ImagenEntradaBuena5);

ImagenEntradaBuena6= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\6.jpg');
MazanaGala6= imcrop(ImagenEntradaBuena6);

ImagenEntradaBuena7= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\7.jpg');
MazanaGala7= imcrop(ImagenEntradaBuena7);

ImagenEntradaBuena8= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\8.jpg');
MazanaGala8= imcrop(ImagenEntradaBuena8);

ImagenEntradaBuena9= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\9.jpg');
MazanaGala9= imcrop(ImagenEntradaBuena9);

ImagenEntradaBuena10= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\10.jpg');
MazanaGala10= imcrop(ImagenEntradaBuena10);

ImagenEntradaBuena11= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\11.jpg');
MazanaGala11= imcrop(ImagenEntradaBuena11);

ImagenEntradaBuena12= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\12.jpg');
MazanaGala12= imcrop(ImagenEntradaBuena12);

ImagenEntradaBuena13= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\13.jpg');
MazanaGala13= imcrop(ImagenEntradaBuena13);

ImagenEntradaBuena14= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\14.jpg');
MazanaGala14= imcrop(ImagenEntradaBuena14);

ImagenEntradaBuena15= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\15.jpg');
MazanaGala15= imcrop(ImagenEntradaBuena15);

ImagenEntradaBuena16= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\16.jpg');
MazanaGala16= imcrop(ImagenEntradaBuena16);

ImagenEntradaBuena17= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\17.jpg');
MazanaGala17= imcrop(ImagenEntradaBuena17);

ImagenEntradaBuena18= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\18.jpg');
MazanaGala18= imcrop(ImagenEntradaBuena18);

ImagenEntradaBuena19= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\19.jpg');
MazanaGala19= imcrop(ImagenEntradaBuena19);

ImagenEntradaBuena20= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\20.jpg');
MazanaGala20= imcrop(ImagenEntradaBuena20);

ImagenEntradaBuena21= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\21.jpg');
MazanaGala21= imcrop(ImagenEntradaBuena21);

%% Parametros De Entrenamiento Malos Para El Apendizaje De La Red Neuronal
ImagenEntradaMala1= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\a.jpg');
NoManzanasGala1= imcrop(ImagenEntradaMala1);

ImagenEntradaMala2= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\b.jpg');
NoManzanasGala2= imcrop(ImagenEntradaMala2);

ImagenEntradaMala3= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\c.jpg');
NoManzanasGala3= imcrop(ImagenEntradaMala3);

ImagenEntradaMala4= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\x1.jpg');
NoManzanasGala4= imcrop(ImagenEntradaMala4);

ImagenEntradaMala5= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\x2.jpg');
NoManzanasGala5= imcrop(ImagenEntradaMala5);

ImagenEntradaMala6= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\x2.jpg');
NoManzanasGala6= imcrop(ImagenEntradaMala6);

ImagenEntradaMala7= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\x3.jpg');
NoManzanasGala7= imcrop(ImagenEntradaMala7);

ImagenEntradaMala8= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\x4.jpg');
NoManzanasGala8= imcrop(ImagenEntradaMala8);

ImagenEntradaMala9= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\x4.jpg');
NoManzanasGala9= imcrop(ImagenEntradaMala9);

ImagenEntradaMala10= imread('C:\Users\carlo\Documents\MATLAB\CarlosMatlab\ImgManzanas\x4.jpg');
NoManzanasGala10= imcrop(ImagenEntradaMala10);

%% Creación De Dos Arreglos Para Guardar Los Recortes De Los Datos Buenos(ManzanasGala{}) Y Malos(NoManzanasGala{}).
MazanasGala={MazanaGala1,MazanaGala2,MazanaGala3,MazanaGala4,MazanaGala5,MazanaGala6,MazanaGala7,MazanaGala8,MazanaGala9,MazanaGala10,MazanaGala11,MazanaGala12,MazanaGala13,MazanaGala14,MazanaGala15,MazanaGala16,MazanaGala17,MazanaGala18,MazanaGala19,MazanaGala20,MazanaGala21};

NoManzanasGala={NoManzanasGala1,NoManzanasGala2,NoManzanasGala3,NoManzanasGala4,NoManzanasGala5,NoManzanasGala6,NoManzanasGala7,NoManzanasGala8,NoManzanasGala9,NoManzanasGala10};

%% Se Crea Una Estructura For, Para Guardas y Separar Los Planos De Colores De Los Recortes Del Arreglo ManzanasGala{}
for i=1:3
    if i==1
        R=MazanaGala1(:,:,i);
        for j=2:21
            aux=MazanasGala{j}(:,:,i);
            R = [R(:); aux(:)];
        end

   elseif i==2
        G=MazanaGala1(:,:,i);
        for j=2:21
            aux=MazanasGala{j}(:,:,i);
            G = [G(:); aux(:)];
        end
        
    else
        B=MazanaGala1(:,:,i);
        for j=2:21
            aux=MazanasGala{j}(:,:,i);
            B = [B(:); aux(:)];
        end
    end
end

%% Se Crea Una Estructura For, Para Guardas y Separar Los Planos De Colores De Los Recortes Del Arreglo NoManzanasGala{}
for i=1:3
    if i==1
        nR=NoManzanasGala1(:,:,i);
        for j=2:10
            aux=NoManzanasGala{j}(:,:,i);
            nR = [nR(:); aux(:)];
        end
    elseif i==2
        nG=NoManzanasGala1(:,:,i);
        for j=2:10
            aux=NoManzanasGala{j}(:,:,i);
            nG = [nG(:); aux(:)];
        end
    else
        nB=NoManzanasGala1(:,:,i);
        for j=2:10
            aux=NoManzanasGala{j}(:,:,i);
            nB = [nB(:); aux(:)];
        end
    end
end

%% Guardamos Una Copia De Los Planos De Las Variables MazanasGalan
R1=R;
G1=G;
B1=B;

%% Guardamos Una Copia De Los Planos De Las Variables NoMazanasGalan
R2=nR;
G2=nG;
B2=nB;

%% Definimos Los Pesos
w1=-1;
w2= 1;
w3=-1;

%% Hallamos El Tamaño De Los Planos R1(Datos Entrenamiento Buenos) y R2(Datos Entrenamiento Malos)

[sz1,sz2] = size(R1);
[sz12,sz22] = size(R2);

s=sz1+sz12; 

x1=1:s-1; 
x2=1:s-1; 
x3=1:s-1; 
c=1:s-1; 

x=[1:s-1;1:s-1;1:s-1];
valor_esperado=1:s-1;
i=1;

%% Verificamos Que Los Datos Esperados Sean Los Correctos
for k=1:s-1
    if k<=sz1
        x(1,k)=R1(k);
        x(2,k)=G1(k);
        x(3,k)=B1(k);
        valor_esperado(k)=1;
    else
        x(1,k)=R2(i);
        x(2,k)=G2(i);
        x(3,k)=B2(i);
        valor_esperado(k)=-1;
        i=i+1;
    end
end

%% Hacemos Uso Del ToolBox De Matlab Para El Apendizaje De La Red Neuronal
nftool
