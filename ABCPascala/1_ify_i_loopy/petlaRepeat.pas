Program P�tlaRepeat; 

var 
   i:real; 

Begin 
  writeln('podaj liczb� >0 ale mniejsz� od 1'); 
  readln(i); 
  repeat 
    i:=i*2; 
    writeln(i) 
  until i>1; 
end.
