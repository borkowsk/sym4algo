Program sumowanie; 

const 
   KONIEC = -9999; 
var 
   suma, x: real; 

begin 
  writeln('Podaj liczby do sumowania'); 
  writeln('Po ka�dej liczbie nale�y wcisn�� <<ENTER>>'); 
  writeln('Aby zako�czy� sumowanie wpisz 0'); 
  suma := 0; 
  readln(x); 
  while x<>KONIEC do 
    begin 
      suma := suma + x; 
      readln(x); 
    end; 
  writeln('suma = ', suma); 
end.
