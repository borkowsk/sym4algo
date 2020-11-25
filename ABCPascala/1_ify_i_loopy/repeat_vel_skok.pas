Program RepeatVelSkok; 
{Demonstracja repeat zamiast zrobionej za pomoc¹ skoku} 

var 
   x:real; 

Begin 
  repeat 
    writeln('Ile to jest 2 * 2 ?'); 
    readln(x); 
  until x=4; 
  writeln('Tak!'); 
end.
