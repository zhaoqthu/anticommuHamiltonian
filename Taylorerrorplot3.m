clc;
clear;

%Co2
% q2=1.0413 ;
% q=q2;
% q1=1.06387163099598;
% qe1=1.94482362397894;
% qe2=2.74022932962633;
% qe3=3.39835815605774;

% q=1.0864;
% q0=1.0981 ;
% q1=1.1226 ;    
% qe=1.2779;

%r3=0.7241;
%r3=0.8272;

inp=[1.0472    1.0599    1.0870    1.4946  0.7927]  %HBO
%inp=[1.0864    1.0981    1.1226    1.2779  0.7241]  %CH4
%inp=[1.0655    1.0723    1.0862    1.3165  0.8272]  %CH3Li



%inp=[1.0630    1.0999    1.1867    1.5983  0.5825]; %BH
q=inp(1);
q0=inp(2);
q1=inp(3);
qe=inp(4);
r3=inp(5);      


r3=min(r3,1/(q1^2));

%propane
% q2=1.00946172979957;
% q=q2;
% q1=1.03264113672611;
% qe1=2.31997740743351;
% qe2=4.00248517658568;
% qe3=5.54645991883610;


%LiH
% q=1.0719;
% q1=1.1003; %把平方去了
% qe1=1.6240;    
% qe2=3.4845;    
% qe3=6.4239;

%q1=q;
% qe=2.5762;
% q2 =1.0719;
% q3 =1.1039;
% q4 =1.1211;
%q1=q4;
% A=1+ q4+(q4^2)/(q2^2)+(q4^3)/(q3^3);
% B=1-q4+(q4^2)/(q2^2)-(q4^3)/(q3^3);
% C=1-1i*q4-(q4^2)/(q2^2)+1i*(q4^3)/(q3^3);
% D=1+1i*q4-(q4^2)/(q2^2)-1i*(q4^3)/(q3^3);
% R4=A*2^(1/q4)+B*2^(-1/q4)+C*2^(1i/q4)+D*2^(-1i/q4);

R2=(q+1)*2^(1/q)+(q-1)*2^(-1/q);
for i=1:1:10
   k=3*i;
   
  
  del=2* log(2)^(k+1)/factorial(k+1);
  ori(i)=eptode(del);
  dne=log(2)^(k+1)/factorial(k+1)*(R2)/(2*q^(k+1)); %新的估算方法
  ne(i)=eptode(dne);
  
  
  bas=log(2)^(k+3)/factorial(k+3)*(R2)/(2*q^(k+3))+r3*log(2)^(k+2)/(factorial(k+2)*q^(k-1));
  dner0=bas+log(2)^(k+1)/(factorial(k+1)*q0^2*q^(k-1));
  dner1=bas+log(2)^(k+1)/(factorial(k+1)*qe^2*q^(k-1));
  
  ner0(i)=eptode(dner0);
  ner1(i)=eptode(dner1);
  

  b(i,1)=ori(i)/ne(i);
  b(i,2)=ori(i)/ner0(i);
  b(i,3)=ori(i)/ner1(i);
  
 
end

% a=log10(ori)
% b=log10(ne)
% c=log10(nerp)
% d=log10(ner)
%k=3:4:39;
k=3:3:30;
%plot(k,b1,k,b2,k,b4,k,b4r)
plot(k,b(:,3),'o-','LineWidth',3,'MarkerSize',10,'Color',[70,130,180]/255)
hold on
plot(k,b(:,2),'*-','LineWidth',3,'MarkerSize',10, 'Color',[32,178,170]/255)
plot(k,b(:,1),'d-','LineWidth',3,'MarkerSize',10, 'Color',[244,164,96]/255)
hold off
axis([3,30,0,20]);
%plot(k,a,k,b,k,c,k,d)
%ylabel('$log(\epsilon)$','interpreter','latex','fontsize',26,'FontWeight','bold' );
%hleg1=legend('Recalculated error','Improved LCU','Second order recalculated error','second improved');
hleg1=legend('Modified LCU 2','Modified LCU 1', 'Refined error');

set(hleg1,'Location','Northwest')
set(gca,'FontSize',20);
ylabel('${\varepsilon_{o}}/{\varepsilon_{n}}$','interpreter','latex','fontsize',30,'FontWeight','bold' );
xlabel('Truncated K','fontsize',25);
title('$\rm HBO$','interpreter','latex','FontSize',25)