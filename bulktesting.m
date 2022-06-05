load('C:\Users\kbchi\MATLAB\Projects\faceret\wpcadb.mat\','M','N','m','n','Ppca','T');

nop=50;
ntr=800;
nte=200; 
p=nte/nop; 
q=ntr/nop; 
K=800; 
L=0;
flag=zeros(1,nte);
while (K<=((ntr+nte)-p))
    for i=(K+1):(K+p)
        img=imread(sprintf('%d.jpg',i));
        indx=facerecog(img,M,N,m,n,Ppca,T);
        if (i>=K+1)&&(i<=K+p)&&(indx>=L+1)&&(indx<=L+q)
            flag(i)=1;
        else
            flag(i)=0;
        end
    end
    K=K+p; L=L+q;
end
result=(nnz(flag)/nte)*100;
disp('percentage accuracy = ')
result