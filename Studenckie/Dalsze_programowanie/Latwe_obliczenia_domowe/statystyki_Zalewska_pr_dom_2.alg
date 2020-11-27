program suma_œrednia_kwadrat_pierwiastek; 

var 
   x, suma,suma_u,suma_d: real; 
   z,liczba,liczba_u,liczba_d:integer; 

begin 
  suma:=0; 
  suma_u:=0; 
  suma_d:=0; 
  liczba_d:=0; 
  liczba_u:=0; 
  writeln ('Ile bêdzie liczb? '); 
  Readln (liczba); 
  Writeln('Podawaj liczby '); 
  for z:=1 to liczba do 
    begin 
      readln (x); 
      if x>=0 then 
        begin 
          suma_d:=suma_d+x; 
          liczba_d:=liczba_d+1; 
        end 
      else 
        begin 
          suma_u:=suma_u+x; 
          liczba_u:=liczba_u+1; 
        end; 
    end; 
  writeln ('iloœæ liczb dodatnich ',liczba_d); 
  writeln ('iloœæ liczb ujemnych ',liczba_u); 
  writeln('Suma liczb dodatnich wynosi ', suma_d); 
  writeln ('suma liczb ujemnych wynosi ',suma_u); 
writeln (‘suma wszystkich liczb wynosi ‘ ,suma_d+suma_u);
  if liczba_d>0 then 
    begin 
      writeln ('œrednia liczb dodatnich wynosi ',suma_d/liczba_d); 
      writeln ('kwadrat œredniej dla liczb dodatnich, które poda³eœ wynosi ', sqr(suma_d/liczba_d)); 
    end; 
  if suma_d/liczba_d>=0 then 
    writeln ('pierwiastek ze œredniej liczb dodatnich wynosi ', sqrt(suma_d/liczba_d)); 
  if liczba_u>0 then 
    begin 
      writeln ('srednia liczb ujemnych wynosi ' ,suma_u/liczba_u); 
      writeln ('kwadrat œredniej dla liczb ujemnych, które poda³eœ wynosi ', sqr(suma_u/liczba_u)); 
    end; 
  if liczba_u<>0 then 
    begin 
      if suma_u/liczba_u>=0 then 
        begin 
          writeln ('pierwiastek ze œredniej liczb ujemnych wynosi ', sqrt(suma_u/liczba_u)); 
        end 
      else 
        begin 
          writeln(' nie ma pierwiastków z liczb ujemnych '); 
        end; 
    end; 
end.
