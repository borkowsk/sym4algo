Program Skok; 
{Demonstracja p�tli zrobionej za pomoc� skoku} 

label 0001; 
var 
   x:real; 

Begin 
  0001: writeln('Ile to jest 2 * 2 ?'); 
  readln(x); 
  if x<>4 then 
    goto 0001; 
  writeln('Tak!'); 
end.
