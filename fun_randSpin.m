function RI=fun_randSpin(N,M)
nr=random('uniform',-1,1,N,M);%numero random de longitud (NxL)
su=find(nr>0); nr(su)=1; %valores up = 1
sd=find(nr<0); nr(sd)=-1; %valores down = -1
RI=nr;