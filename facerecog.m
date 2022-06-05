function indx=facerecog(img,M,N,m,n,Ppca,T)
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
    distarray(i)=sum(abs(T(i,:)-fvpca));
end
[~,indx]=min(distarray);