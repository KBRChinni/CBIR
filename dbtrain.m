n=800;
L=50;
tic;
M=200;N=180;
X=zeros(n,M+N);
for count=1:n
    I=imread(sprintf('%d.jpg',count));
    I=rgb2gray(I);
    I=imresize(I,[M,N]);
    level=graythresh(I);
    Ibin=imbinarize(I,level);
    dwtmode('per','nodisp');
    [cA,cH,cV,cD]=dwt2(double(Ibin),'db10');
    wc=[cA,cH;cV,cD];
    stdcol=std(wc);
    wcc=(wc');
    stdrow=std(wcc);
    fvstd=[stdcol stdrow];
    X(count,:)=fvstd;
end
m=mean(X);
for i=1:n
    X(i,:)=X(i,:)-m;
end
Q=(X'*X)/(n-1);
[Evecm,Evalm]=eig(Q);
Eval=diag(Evalm);
[Evalsorted,Index]=sort(Eval,'descend');
Evecsorted=Evecm(:,Index);
Ppca=Evecsorted(:,1:L);
T=X*Ppca;
save('C:\Users\kbchi\MATLAB\Projects\faceret\wpcadb.mat\','n','m','M','N','Ppca','T');
toc;
        