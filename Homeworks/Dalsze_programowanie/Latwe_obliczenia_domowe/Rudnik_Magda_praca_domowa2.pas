Program Sumuj_zadane_oddzielnie_ujemne_i_dodatnie; 

var 
   Suma_d, Suma_u,Wartosc:real; 
   z,Liczba,Liczba_d,Liczba_u:integer; 

begin 

  Suma_d:=0; 
  Suma_u:=0; 
  Liczba_d:=0; 
  Liczba_u:=0; 

  writeln('Ile bedzie liczb?'); 
  readln(Liczba); 
  writeln('Podawaj wartosci ');
  for z:=1 to Liczba do 
    begin 
      readln(Wartosc); 
      if Wartosc >= 0 then 
        begin 
          Suma_d:=Suma_d+Wartosc; 
          Liczba_d:=Liczba_d+1; 
        end 
      else 
        begin
        Suma_u:=Suma_u+Wartosc;
        Liczba_u:=Liczba_u+1;
  end;
  end;

if Liczba_d>0 then 

begin
writeln('Srednia dodatnich wynosi ',Suma_d/Liczba_d);
writeln('Suma dodatnich wynosi ',Suma_d);
writeln('Liczb dodatnich ', Liczba_d);
writeln('Kwadrat sredniej dodatnich wynodsi ',Suma_d *Suma_d/(Liczba_d*Liczba_d ));
writeln('Pierwiastek sredniej dodatnich ', sqrt(Suma_d/Liczba_d));
end;

if Liczba_u>0 then 

begin
writeln('Srednia dodatnich wynosi ',Suma_d/Liczba_d);
writeln('Suma dodatnich wynosi ',Suma_d);
writeln('Liczb dodatnich ', Liczba_d);
writeln('Kwadrat sredniej dodatnich wynodsi ',Suma_d *Suma_d/(Liczba_d*Liczba_d ));
writeln('Pierwiastek sredniej dodatnich ', sqrt(Suma_d/Liczba_d));
end;

if Liczba_u>0 then 

begin
writeln('Srednia ujemnych wynosi ',Suma_u/Liczba_u);
writeln('Suma ujemnych wynosi ', Suma_u);
writeln('Liczb ujemnych ', Liczba_u);
writeln('Kwadrat sredniej ujemnych wynodsi ',Suma_u *Suma_u/(Liczba_u*Liczba_u ));
end;

end.

