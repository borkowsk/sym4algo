program policzsume; 

var 
   liczba,suma, stop : integer; 

begin 
  suma:=0; 
  stop:=-99; 
  writeln('Zacznij wpisywa� liczby do zsumowania.'); 
  writeln('Aby zako�czy� i wy�wietli� sum� wpisz: -99.');
  repeat 
  readln(liczba); 
  suma := suma + liczba; 
  until liczba = stop;
  writeln('SUMA = ',suma-stop);
end.