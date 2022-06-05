clc;

load('C:\Users\kbchi\MATLAB\Projects\faceret\wpcadb.mat\','M','N','m','n','Ppca','T');
[filename,pathname]=uigetfile('*.*','Select the Input face image');
tic;
filewithpath=strcat(pathname,filename);
img=imread(filewithpath);
imgo=img;
%%img=flip(img, 2);
img=rgb2gray(img);
img=imresize(img,[M,N]);
level=graythresh(img);
Ibin=imbinarize(img,level);

dwtmode('per','nodisp');
[cA,cH,cV,cD]=dwt2(double(Ibin),'db10');
wc=[cA,cH;cV,cD];

stdcol=std(wc);
wcc=(wc');
stdrow=std(wcc);
fvstd=[stdcol stdrow];
fvpca=(fvstd-m)*Ppca;
distarray=zeros(n,1);

for i=1:n
    distarray(i)=sum(abs(T(i,:)-fvpca));%%tquery image
end
    toc;
    [result,indx]=sort(distarray);
    resultimg1=imread(sprintf('%d.jpg',indx(1)));
    resultimg2=imread(sprintf('%d.jpg',indx(2)));
    resultimg3=imread(sprintf('%d.jpg',indx(3)));
    resultimg4=imread(sprintf('%d.jpg',indx(4)));
    resultimg5=imread(sprintf('%d.jpg',indx(5)));
    resultimg6=imread(sprintf('%d.jpg',indx(6)));
    subplot(231); imshow(imgo); title('Query image')
    subplot(232); imshow(resultimg6); title('RetrievedImage1')
    subplot(233); imshow(resultimg2); title('RetrievedImage2')
    subplot(234); imshow(resultimg3); title('RetrievedImage3')
    subplot(235); imshow(resultimg5); title('RetrievedImage4')
    subplot(236); imshow(resultimg5); title('RetrievedImage5')