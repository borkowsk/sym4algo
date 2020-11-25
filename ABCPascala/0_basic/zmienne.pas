Program Zmienne; 

var 
   i:integer; 
   a,b:real;    
   c:char; 
   s:string; 

Begin 
  s:='Obliczenia';
  i:=2;
  a:=1*3; 
  a:=a+7; 
  b:=i/4; 
  a:=a+b; 
  writeln('Obliczenia "na raty"'); 
  writeln(a,' ',i); 
  writeln(s+'"1*3+7+i/4"'); 
  Writeln(1*3+7+i/4); 
End.
