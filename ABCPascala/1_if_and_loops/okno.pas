Program Okno; 

const 
   x1=112; 
   y1=50; 
   x2=303; 
   y2=205; 
var 
   x,y:integer; 

Begin 
  Write('Podaj x '); 
  Readln(x); 
  Write('Podaj y '); 
  Readln(y); 
  if (x1<x)AND(x<x2)AND (y1<y)AND(y<y2) then 
    Writeln('TRAFIONY!!!')
  else 
    Writeln('Pud³o!'); 
end.
