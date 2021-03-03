program ObliczDELTÊ; 

var 
   delta,x0,x1,x2:real; 
const
a=4;
b=3;
c=9;
begin 
  delta:=b*b-4*a*c; 
  x0:=(-b)/2*a; 
  x1:=(-b-delta/delta)/2*a; 
  x2:=(-b+delta/delta)/2*a; 
  writeln(delta); 
  writeln(x0); 
  writeln(x1); 
  writeln(x2); 
end.