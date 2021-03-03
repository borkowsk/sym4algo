Program praca_domowa_2; 

Var 
   suma_dod,suma_ujemn,wartosc :real; 
   z, x,liczba_dod,liczba_ujemn:integer; 

Begin 
  suma_dod:=0; 
  suma_ujemn:=0; 
  liczba_dod:=0; 
  liczba_ujemn:=0; 
  writeln('Ile bêdzie liczb? '); 
  readln(x); 
  writeln('Podaj liczby: '); 
  for z:=1 to x do 
    begin 
      readln(wartosc); 
      if wartosc>-1 then 
        suma_dod:=suma_dod+wartosc; 
      if wartosc>-1 then 
        liczba_dod:=liczba_dod+1; 
      if wartosc<0 then 
        suma_ujemn:=suma_ujemn+wartosc; 
      if wartosc<0 then 
        liczba_ujemn:=liczba_ujemn+1; 
    end; 
  Writeln; 
  Writeln('Podaleœ ',x,' liczb'); 
  Writeln; 
  writeln('W tym ',liczba_dod,' liczby dodatnie'); 
  writeln('i ',liczba_ujemn,' liczby ujemne'); 
  Writeln; 
  Writeln('Suma liczb dodatnich wynosi ',suma_dod); 
  Writeln('Natomiast suma liczb ujemnych wynosi ',suma_ujemn); 
  Writeln; 
  Writeln('Œrednia dla liczb dodatnich wynosi ',suma_dod/x); 
  Writeln('Z kolei œrednia dla liczb ujemnych wynosi ',suma_ujemn/x); 
  Writeln; 
  Writeln('Kwadrat  œredniej liczb dodatnich wynosi ',((suma_dod/x)*(suma_dod/x))); 
  Writeln('Kwadrat œredniej liczb ujemnych wynosi ',((suma_ujemn/x)*(suma_ujemn/x))); 
  Writeln; 
  Writeln('Pierwiastek œredniej dla liczb dodatnich wynosi ', (sqrt(suma_dod/x))); 
  Writeln('Pamiêtaj: Liczb ujemnych nie mo¿na pierwiastkowaæ!'); 
end.