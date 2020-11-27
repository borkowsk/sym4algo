program sumatrudna;

var 
   plusuma, minusuma, wartosc:real; 
   z, liczba, plusliczba, minusliczba:integer; 

begin 
  plusuma:=0; 
  minusuma:=0; 
  plusliczba:=0; 
  minusliczba:=0; 
  writeln('Ile bedzie liczb? '); 
  readln(liczba); 
  writeln('Podawaj wartosci '); 
  for z:=1 to liczba do 
    begin 
      readln(wartosc); 
      if wartosc>-1 then 
        plusuma:=plusuma+wartosc; 
      if wartosc>-1 then 
        plusliczba:=plusliczba+1; 
      if wartosc<0 then 
        minusuma:=minusuma+wartosc; 
      if wartosc<0 then 
        minusliczba:=minusliczba+1; 
    end; 
  Writeln; 
  Writeln('Podales >>',liczba,'<< liczby'); 
  Writeln; 
  writeln('Z czego >>',plusliczba,'<< liczb dodatnich'); 
  writeln('A >>',minusliczba,'<< liczb ujemnych'); 
  Writeln; 
  Writeln('Suma wyniosla dla dodatnich >>',plusuma,'<<'); 
  Writeln('Suma wyniosla dla ujemnych >>',minusuma,'<<'); 
  Writeln; 
  Writeln('Ich srednia wyniosla dla liczb dodatnich >>',plusuma/liczba,'<<'); 
  Writeln('Ich srednia wyniosla dla liczb ujemnych >>',minusuma/liczba,'<<'); 
  Writeln; 
  Writeln('Kwadrat  sredniej liczb dodatnich >>',((plusuma/liczba)*(plusuma/liczba)),'<<'); 
  Writeln('Kwadrat sredniej liczb ujemnych >>',((minusuma/liczba)*(minusuma/liczba)),'<<'); 
  Writeln; 
  Writeln('Pierwiastek sredniej liczb dodatnich >>', (sqrt(plusuma/liczba)),'<<'); 
  Writeln('Liczb ujemnych nie mo¿na pierwiastkowaæ!!!'); 
end.