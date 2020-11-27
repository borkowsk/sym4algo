Program praca_domowa; 


function sqr(x:real):real; 

begin 
  sqr:=x*x; 
end; 

var 
   pierwiastek_dod,kwadrat_uj,kwadrat_dod,srednia_dod,srednia_uj,suma_dod,suma_uj,ujemne,dodatnie,suma,wartosc:real; 
   z,liczba:integer; 

Begin 
  srednia_uj:=0; 
  srednia_dod:=0; 
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
    
    if srednia_uj<>0 then
  srednia_uj:=suma_uj/ujemne; 
   if srednia_dod<>0 then
  srednia_dod:=suma_dod/dodatnie; 
  pierwiastek_dod:=sqrt(srednia_dod); 
  kwadrat_dod:=sqr(srednia_dod); 
  kwadrat_uj:=sqr(srednia_uj); 
  if liczba>0 then 
    writeln('pierwiastek sredniej liczb dodanich',pierwiastek_dod); 
  writeln('kwadrat sredniej liczb ujemnych',kwadrat_uj); 
  writeln('kwadrat sredniej liczb dodatnich',kwadrat_dod); 
  writeln('srednia licz dodatnich',srednia_dod); 
  writeln('srednia liczb ujemnych',srednia_uj); 
  writeln('suma liczb dodatnich',suma_dod); 
  writeln('suma liczb ujemnych',suma_uj); 
  writeln('liczba wartoœci ujemnych',ujemne); 
  writeln('liczba wartosci dodatnich',dodatnie); 
  writeln('srednia wynosi',suma/liczba); 
  writeln('suma wynosi', suma); 
end.