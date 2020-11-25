{Anastazja Kudra} 
{Nr indexu X100} 
Program sumowanie_liczb_dodatnich_i_ujemnych; 

var 
   suma, 
   suma_dodatnich, suma_ujemnych, 
   dodatnie, ujemne, zera, 
   œrednia_dod, œrednia_uje, wartosc:real; 
   z, liczba:integer; 

begin 
  suma_dodatnich:=0; 
  suma_ujemnych:=0; 
  dodatnie:=0; 
  ujemne:=0; 
  zera:=0; 
  writeln ('Ile bêdzie liczb?'); 
  readln(liczba); 
  writeln; 
  for z:=1 to liczba do 
    begin 
      writeln('Podaj liczbê'); 
      readln (wartosc); 
      if wartosc>0 then 
        begin 
          dodatnie:=dodatnie+1; 
          suma_dodatnich:=suma_dodatnich+wartosc; 
        end; 
      if wartosc<0 then 
        begin 
          ujemne:=ujemne+1; 
          suma_ujemnych:=suma_ujemnych+wartosc; 
        end; 
      if wartosc=0 then 
        zera:=zera+1; 
    end; 
  writeln ('Oto ile by³o liczb dodatnich ', dodatnie:10:2); 
  writeln ('Tu wyskakuje liczba ujemnych ', ujemne:10:2); 

  if zera>0 then 
    writeln ('zer by³o', zera:10:2); 
  
  writeln ('Suma liczb dodatnich wynosi ', suma_dodatnich:10:2); 
  writeln ('Suma liczb ujemnych wynosi ', suma_ujemnych:10:2); 
  
  if wartosc<>0 then 
    begin 
      if dodatnie<>0 then 
        begin 
          œrednia_dod:=suma_dodatnich/dodatnie; 
          WriteLn('Œrednia liczb dodatnich to ',œrednia_dod:10:2); 
        end; 
      if ujemne<>0 then 
        begin 
          œrednia_uje:=suma_ujemnych/ujemne; 
          WriteLn('Œrednia liczb ujemnych to ',œrednia_uje:10:2); 
        end; 
      writeln; 
      Writeln('Ach jaki fajny program...'); 
    end; 
end.
