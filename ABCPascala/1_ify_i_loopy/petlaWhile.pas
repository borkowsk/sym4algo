Program P�tlaWhile; 
var 
   i:real; 
Begin 
  writeln('podaj liczb� >0 ale mniejsz� od 1'); 
  readln(i); 
  while i<1 do 
    begin 
      i:=i*2; 
      writeln(i) 
    end; 
end.
