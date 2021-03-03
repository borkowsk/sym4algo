Program PêtlaWhile; 
var 
   i:real; 
Begin 
  writeln('podaj liczbê >0 ale mniejsz¹ od 1'); 
  readln(i); 
  while i<1 do 
    begin 
      i:=i*2; 
      writeln(i) 
    end; 
end.
