Program DoWyboru_v2; 
var 
   x:integer; 
Begin 
  writeln('Podaj liczb� od 1 do 5!'); 
  readln(x); 
  Case x of 
    1: 
      writeln('1 program'); 
    2,3,4: 
      writeln(x,' programy'); 
    5: 
      writeln('5 program�w '); 
  else 
    writeln('Mia�o by� od 1 do 5!!!'); 
  end; 
end.
