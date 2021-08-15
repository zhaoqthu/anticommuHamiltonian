clc;
clear;
		
% different order cancellation 			
%1.0339	1.0552	1.0699
%inp=[1.064378023	1.1061	1.1324]; %BeH
%inp=[1.0339	1.0552	1.0699];     %HO		
%inp=[1.0582	1.0949	1.1177];    %LiH	
inp=[1.063	1.0994	1.1222];   %BH	


q=inp(1);
q3=inp(2);
q4=inp(3);
%R2=(q+1)*2^(1/q)+(q-1)*2^(-1/q);
%R2=4;
for i=1:1:10
   k=3*i;
  %k=i;
del=2* log(2)^(k+1)/factorial(k+1);

m3=max(q3,(q3/q)^2);
m4=max(q4,(q4/q3)^3);
m4=max(m4,(q4/q)^2);
ori(i)=eptode(del);
 R2=(q+1)*2^(1/q)+(q-1)*(-1)^k*2^(-1/q); 
  dne(i)=log(2)^(k+1)/factorial(k+1)*(R2)/(2*q^(k+1)); %新的估算方法
  %dne3(i)=log(2)^(k+1)/factorial(k+1)*(R2)/(2*q3^(k+1)); %新的估算方法
  dne3(i)=log(2)^(k+1)/factorial(k+1)*(m3*2^(1/q3))/(q3^(k+1)); %新的估算方法
  %dne4(i)=log(2)^(k+1)/factorial(k+1)*(R2)/(2*q4^(k+1)); %新的估算方法
  dne4(i)=log(2)^(k+1)/factorial(k+1)*(m4*2^(1/q4))/(q4^(k+1)); %新的估算方法
  ne(i)=eptode(dne(i));
  ne3(i)=eptode(dne3(i));
  ne4(i)=eptode(dne4(i));
  b(i,1)=ori(i)/ne(i);
  b(i,2)=ori(i)/ne3(i);
  b(i,3)=ori(i)/ne4(i);

  
end

% a=log10(ori)
% b=log10(ne)
% c=log10(nerp)
% d=log10(ner)
%k=3:4:39;
k=3:3:30;
%plot(k,b1,k,b2,k,b4,k,b4r)
% plot(k,b(:,1),k,b(:,2),k,b(:,3),'LineWidth',3)
%plot(k,b(:,3),'o-','LineWidth',3,'MarkerSize',10,'Color',[70,130,180]/255)

plot(k,b(:,3),'o-','LineWidth',3,'MarkerSize',10,'Color',[255,99,71]/255)
hold on
%plot(k,b(:,2),'*-','LineWidth',3,'MarkerSize',10, 'Color',[32,178,170]/255)
plot(k,b(:,2),'*-','LineWidth',3,'MarkerSize',10, 'Color',[255,215,0]/255)
plot(k,b(:,1),'d-','LineWidth',3,'MarkerSize',10, 'Color',[244,164,96]/255)
hold off
axis([3,30,0,40]);
%plot(k,a,k,b,k,c,k,d)
%ylabel('$log(\epsilon)$','interpreter','latex','fontsize',26,'FontWeight','bold' );
hleg1=legend('Fourth-order','Third-order','Second-order');
%hleg1=legend('Recalculated error');
set(gca,'XTick',[0:5:30])
set(gca,'YTick',[0:10:40])
set(hleg1,'Location','Northwest')
set(gca,'FontSize',20);
ylabel('${\varepsilon_{o}}/{\varepsilon_{n}}$','interpreter','latex','fontsize',30,'FontWeight','bold' );
xlabel('Truncated K','fontsize',25);
title('$\rm BH$','interpreter','latex','FontSize',25)