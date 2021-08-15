function Newuni=Newuni(x,y)
  for i=2:1:length(x)
      if x(i)-y(i)==0
          z(i)=0;
      else
      z(i)=x(i)+y(i);
      end
      if z(i)==4
         z(i)=2;
      end
      if z(i)==5
          z(i)=1;
      end
     
  end
  z(1)=2*x(1)*y(1);
  %z(2)=
   Newuni =z;    
