function Pmov=Cauchymov(P,T)
[m n]=size(P);
global mmin mmax
xmax1=repmat(mmax,m,1);
xmin1=repmat(mmin,m,1);
dif=rand(m,n)-0.5*ones(m,n);
changeRows=dif<0;
dif(find(changeRows))=-1;
changeRows=dif>0;
dif(find(changeRows))=1;
pwr=abs(2*rand(m,n)-ones(m,n));
yy=T*dif.*((1+1/T).^pwr-ones(m,n));
Pmov=P+yy.*(xmax1-xmin1);
end