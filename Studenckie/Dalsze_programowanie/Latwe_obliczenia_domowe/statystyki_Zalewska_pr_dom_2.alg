program suma_�rednia_kwadrat_pierwiastek; 

var 
   x, suma,suma_u,suma_d: real; 
   z,liczba,liczba_u,liczba_d:integer; 

begin 
  suma:=0; 
  suma_u:=0; 
  suma_d:=0; 
  liczba_d:=0; 
  liczba_u:=0; 
  writeln ('Ile b�dzie liczb? '); 
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
  writeln ('ilo�� liczb dodatnich ',liczba_d); 
  writeln ('ilo�� liczb ujemnych ',liczba_u); 
  writeln('Suma liczb dodatnich wynosi ', suma_d); 
  writeln ('suma liczb ujemnych wynosi ',suma_u); 
writeln (�suma wszystkich liczb wynosi � ,suma_d+suma_u);
  if liczba_d>0 then 
    begin 
      writeln ('�rednia liczb dodatnich wynosi ',suma_d/liczba_d); 
      writeln ('kwadrat �redniej dla liczb dodatnich, kt�re poda�e� wynosi ', sqr(suma_d/liczba_d)); 
    end; 
  if suma_d/liczba_d>=0 then 
    writeln ('pierwiastek ze �redniej liczb dodatnich wynosi ', sqrt(suma_d/liczba_d)); 
  if liczba_u>0 then 
    begin 
      writeln ('srednia liczb ujemnych wynosi ' ,suma_u/liczba_u); 
      writeln ('kwadrat �redniej dla liczb ujemnych, kt�re poda�e� wynosi ', sqr(suma_u/liczba_u)); 
    end; 
  if liczba_u<>0 then 
    begin 
      if suma_u/liczba_u>=0 then 
        begin 
          writeln ('pierwiastek ze �redniej liczb ujemnych wynosi ', sqrt(suma_u/liczba_u)); 
        end 
      else 
        begin 
          writeln(' nie ma pierwiastk�w z liczb ujemnych '); 
        end; 
    end; 
end.
