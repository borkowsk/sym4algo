Program PêtlaRepeat; 

var 
   i:real; 

Begin 
  writeln('podaj liczbê >0 ale mniejsz¹ od 1'); 
  readln(i); 
  repeat 
    i:=i*2; 
    writeln(i) 
  until i>1; 
end.
