function output=AlaLCU(X,M,D,En)
 %M is the highest order cancellation we want to calculate, in most of
 %cases, we use second order cancellation M=2 

 %En is the new added terms 
 
n=length(X(:,1));
X(:,1)=abs(X(:,1));
X=sortrows(X,-1);
m=length(X(1,:));
al= sum(X(:,1)); %alpha
y2=X(:,1).^2;   %alpha^2
alp2=sum(y2);
c2=0;
c3=0;
c4=0;


%al3=0;
al2=0;



a3=[0,0,0,0];
a4=[0,0,0,0];
%calculate the terms in H^2
 for i=1:1:n
      for j=1:1:n
       if Anti(X(i,:),X(j,:))==1 %commute
          c2=c2+1;
          al2=al2+X(i,1)*X(j,1);
          if i~=j 
          Co2(c2)=X(i,1)*X(j,1); 
          else
          Co2(c2)=0;
          end
          if M>2
           if c2<=D*n
          X2(c2,:)=Newuni(X(i,:),X(j,:)); 
           end
            
          end
       end
      end
 end
 
Co2=sort(Co2,'descend');
E=sum(Co2(1:2*En));

 
 q=al/(al2^(1/2));
 q1=al/((al2-3*alp2)^(1/2));
 q0=al/((al2-alp2)^(1/2));
%  qe1=al/((al2-3*alp2-E1)^(1/2));
%  qe2=al/((al2-alp2-E2)^(1/2));
 qe=al/((al2-alp2-E)^(1/2));
 
a2=[n,m,al2,al,al^2-(al2),q,q0,q1,qe,c2,c2/n^2];

 

 if M>2
   n1=length(X2(:,1));
   h2=sum(X2(:,1));
  % h2-al2
   al3=al2*al;
   %al^3
   al4=h2*h2;
     for i=1:1:n
      for j=1:1:D*n
       if Anti(X(i,:),X2(j,:))==0 %anti-commute
          c3=c3+1;
          al3=al3-X(i,1)*X2(j,1);
         
       end
      end
     end
     a3=[c3,c3/(n1*n),al3,al/(al3^(1/3))];
%jisuan al4
  if M==4
   for i=1:1:D*n
      for j=1:1:D*n
       if Anti(X2(i,:),X2(j,:))==1 %commute
          c4=c4+1;
          al4=al4+X2(i,1)*X2(j,1);
         
       end
      end
   end
   a4=[c4,c4/(n1*n1),al4,al/(al4^(1/4))];
  end
  
 end

 output=[a2;a3;a4];
 %output=a2;
 
 