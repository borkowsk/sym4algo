program policzsume; 

var 
   liczba,suma, stop : integer; 

begin 
  suma:=0; 
  stop:=-99; 
  writeln('Zacznij wpisywaæ liczby do zsumowania.'); 
  writeln('Aby zakoñczyæ i wyœwietliæ sumê wpisz: -99.');
  repeat 
  readln(liczba); 
  suma := suma + liczba; 
  until liczba = stop;
  writeln('SUMA = ',suma-stop);
end.