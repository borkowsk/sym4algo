Program sumuj; 

var 
   y,suma,srednia,suma_dodatnie,srednia_dodatnich,srednia_ujemnych, suma_ujemne,liczba_dodatnich,liczba_ujemnych:real; 
   x,i:integer; 

Begin 
  suma_dodatnie:=0; 
  suma_ujemne:=0; 
  liczba_dodatnich:=0; 
  liczba_ujemnych:=0; 
  write('ile bêdzie liczb '); 
  readln(x) ; 
  if x<=0 then 
    writeln('podaj liczbe dodatnia') 
  else 
    begin 
      for i:=1 to x do 
        begin 
          write('podaj kolejne liczby '); 
          readln(y); 
          if y <0 then 
            begin 
              suma_ujemne:=suma_ujemne+y; 
              liczba_ujemnych:=liczba_ujemnych+1; 
            end 
          else 
            begin 
              suma_dodatnie:=suma_dodatnie+y; 
              liczba_dodatnich:=liczba_dodatnich+1; 
            end 
        end; 
      writeln('suma dodatnich wynosi ', suma_dodatnie); 
      writeln('suma ujemnych wynosi ', suma_ujemne); 
    end; 
  if x>0 then 
    begin 
      if liczba_dodatnich<>0 then 
        begin 
          srednia_dodatnich:=suma_dodatnie/liczba_dodatnich; 
          writeln('œrednia dodatnich wynosi ', srednia_dodatnich); 
        end 
      else 
        writeln('Nie mo¿na obliczyæ œredniej dla liczb dodatnich'); 
      if liczba_ujemnych<>0 then 
        begin 
          srednia_ujemnych:=suma_ujemne/liczba_ujemnych; 
          writeln('œrednia ujemnych wynosi ', srednia_ujemnych); 
        end 
      else 
        writeln('Nie mo¿na obliczyæ œredniej dla liczb ujemnych'); 
    end 
  else 
    writeln('Musisz wybraæ co najmniej jedn¹ liczbê'); 
end.