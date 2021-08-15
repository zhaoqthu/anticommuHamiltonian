function a=mintruk(ep,t,al,q,qe,r3)

r=ceil(t*al/(log(2)));



for i=1:1:20

k=3+i;
del=2* log(2)^(k+1)/factorial(k+1);
ori=r*eptode(del);
if ori<ep
  k0=k;
  break;
end
end

R2=(q+1)*2^(1/q)+(q-1)*2^(-1/q);
for i=1:1:20

k=3+i;
dne=log(2)^(k+1)/factorial(k+1)*(R2)/(2*q^(k+1)); %新的估算方法
ne=r*eptode(dne);
if ne<ep
  k1=k;
  break;
end
end

for i=1:1:20

k=3+i;
%dne=log(2)^(k+1)/factorial(k+1)*(R2)/(2*q^(k+1)); %新的估算方法
bas=log(2)^(k+3)/factorial(k+3)*(R2)/(2*q^(k+3))+r3*log(2)^(k+2)/(factorial(k+2)*q^(k-1));
dner1=bas+log(2)^(k+1)/(factorial(k+1)*qe^2*q^(k-1));
ne=r*eptode(dner1);
if ne<ep
  k2=k;
  break;
end
end



%   dner0=bas+log(2)^(k+1)/(factorial(k+1)*q0^2*q^(k-1));
%   dner1=bas+log(2)^(k+1)/(factorial(k+1)*qe^2*q^(k-1));
% 

a=[k0,k1,k2];
%dne=log(2)^(k+1)/factorial(k+1)*(R2)/(2*q^(k+1)); %新的估算方法
%ne(i)=eptode(dne);