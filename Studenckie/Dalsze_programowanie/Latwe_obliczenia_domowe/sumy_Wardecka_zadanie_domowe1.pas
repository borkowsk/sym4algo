Program zadanie_domowe_1; 
 
var 
suma_dod,suma_uj,ujemne,dodatnie,suma,sr_dod,sr_uj,wartosc:real; 
z,liczba:integer; 
Begin 
  sr_uj:=0; 
  sr_dod:=0; 
  suma_dod:=0; 
  suma_uj:=0; 
  dodatnie:=0; 
  ujemne:=0; 
  suma:=0; 
  writeln('ile bedzie liczb?'); 
  readln(liczba); 
  writeln('podaj wartosci'); 
  for z:=1 to liczba do 
    begin 
      readln(wartosc); 
      suma:=suma+wartosc; 
      if wartosc<0 then 
        begin 
          ujemne:=ujemne+1; 
          suma_uj:=suma_uj+wartosc; 
        end 
      else 
        begin 
          dodatnie:=dodatnie+1; 
          suma_dod:=suma_dod+wartosc; 
        end 
    end; 
  if suma_uj<>0 then
  sr_uj:=suma_uj/ujemne;
 if suma_dod<>0 then
  sr_dod:=suma_dod/dodatnie; 
 
  if liczba>0 then 
  writeln('liczba uwzglednionych wartoœci ujemnych:  ',ujemne); 
  writeln('liczba uwzglednionych wartosci dodatnich: ',dodatnie); 
  writeln('suma liczb dodatnich:                     ',suma_dod); 
  writeln('suma liczb ujemnych:                      ',suma_uj);
  writeln('srednia licz dodatnich:                   ',sr_dod); 
  writeln('srednia liczb ujemnych:                   ',sr_uj); 
  writeln('srednia wynosi:                           ',suma/liczba); 
  writeln('suma wynosi:                              ', suma); 
end.