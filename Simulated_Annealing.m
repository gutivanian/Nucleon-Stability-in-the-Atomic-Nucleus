clc;clear all;close all
global mmin mmax
%----inisialisasi parameter----
n=10;
mmin=0.1;
mmax=5;
m=rand(1,n).*(mmax-mmin)+mmin*ones(1,n);
%----fungsi yg akan diminimalkan---
y=Yukawa(m);
%---inialisasi parameter--- 
decay=1; %konstanta pelururan
accept=0;
T_init=2; %nilai awal temperatur
cs=0.4; %nilai 0.4 lebih bagus daripada 0.3 dan lainnya
T=T_init;
i=0;
maxGen=1000; %jumlah iterasi
E_init=y;
E_old=E_init;
E_new=E_old;
 
%----analisis data---- 
best=m;
errorbest=E_old;
me=zeros(maxGen,1);
iqry=me;
Fit=[];
t=[T];
post=[];
%----mulai iterasi----
for i=1:maxGen
    T=decaytemp(T_init,decay,i,cs);
    t=[t;T];
    ns=Cauchymov(best,T);
    ns=batas(ns);
    E_new=Yukawa(ns);
    DeltaE=E_new-E_old;
    %----mulai evaluasi keadaan optimum----
    if DeltaE<0;
        best=ns;
        E_old=E_new;
        pos1=[best E_old];
        post=[post;pos1];
    elseif DeltaE>0 & exp(-DeltaE/(T))>rand;
        best=ns;
        E_old=E_new;
        pos1=[best E_old];
        post=[post;pos1];
    end
    E_old=E_old;
    f_opt=E_old';
    Fit=[Fit;f_opt];
    [GYbest,indexgbest2]=min(E_old);
    me(i)=mean(E_old);
    iqry(i)=iqr(E_old);
    errorbest(i+1)=GYbest;
    fprintf('Iteration=%i, Minimum value=%.5f\n',i,GYbest)
end
%----plot----
 
figure
plot(0:maxGen,errorbest,'LineWidth',2)
xlabel('Iteration','FontSize',14)
ylabel('Minimum Objective Function','FontSize',14)
 
figure
plot(0:maxGen,t,'k','LineWidth',2)
xlabel('Iteration','FontSize',14)
ylabel('Temperature','FontSize',14)