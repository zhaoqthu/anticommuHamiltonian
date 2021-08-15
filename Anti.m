function Anti=Anti(x,y)
Az=1;
  for i=2:1:length(x)
    if (x(i)-y(i)==0)||(x(i)*y(i)==0)
       A=1;
     else
       A=-1;
    end
   Az=Az*A;
  end

  if Az==1
    Anti=1;
  else
     Anti=0;%anticommu
  end
  
 %determine two Pauli strings are anticommutative or commutative 