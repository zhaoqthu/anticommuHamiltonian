X = load('123164.txt'); 
X(:,1)=abs(X(:,1));
X=sortrows(X,-1);% decreasing order according to alpha_l
X(1,:)=[];  % exclude identity term


n=length(X(:,1));
X(:,1)=abs(X(:,1));
al= sum(X(:,1));  %alpha



y=X(:,1).^2;   %alpha^2
y2=sum(y);

count=0;
c=0;

alco=0;
a4=0;
a3=0;
a2=0;
Co2=zeros(1,n^2);


%calculate the remaining terms in H^2
 for i=1:1:n
      for j=i+1:1:n
       if Anti(X(i,:),X(j,:))==1 %commute
           c=c+1;
          X2(c,:)=Newuni(X(i,:),X(j,:)); 
          a2=a2+2*X(i,1)*X(j,1);
       end
      end
 end
a2=a2+y2;
n1=length(X2(:,1));

%calculate alpha4
 for i=1:1:n1
      for j=i+1:1:n1
       if Anti(X2(i,:),X2(j,:))==1 %commute
          a4=a4+2*X2(i,1)*X2(j,1);
         
       end
      end
 end
y20=X2(:,1).^2;   %alpha^2
y22=sum(y20);
 
a4=2*(a2-y2)*y2+y2*y2+a4+y22;
%  
%  calculate alpha3
 for i=1:1:n
      for j=1:1:n1
       if Anti(X(i,:),X2(j,:))==1 %commute
          a3=a3+X(i,1)*X2(j,1);
         
       end
      end
 end
a3=a3+y2*al;
%   
q2=al/(a2^(1/2));

q3=al/(a3^(1/3));
q4=al/(a4^(1/4));
 
% 