Program ProgramStatystyczny; 

const 
   LAST=100; 
var 
   z,liczba:integer; 
   dane:array[1..LAST] of real; 

procedure wypelnijTablice; 

var 
   wartoœæ:real; 
begin 
  writeln('Ile bêdzie liczb?'); 
  readln(liczba); 
  writeln('Podawaj wartoœci '); 
  for z:=1 to liczba do 
    begin 
      readln(wartoœæ); 
      dane[z]:=wartoœæ; 
    end; 
end; 

function obliczSume:real; 

var 
   suma:real; 
begin 
  suma:=0; 
  for z:=1 to liczba do 
    begin 
      suma:=suma+dane[z]; 
    end; 
  obliczSume:=suma; 
end; 

procedure wypiszSume; 

begin 
  writeln('Suma: ', obliczSume); 
end; 

function obliczSrednia:real; 

begin 
  obliczSrednia := obliczSume/liczba; 
end; 

procedure wypiszSrednia; 

begin 
  writeln('Srednia: ', obliczSrednia); 
end; 

procedure wypiszLiczbeZer; 

var 
   liczbaZer:integer; 
begin 
  liczbaZer := 0; 
  for z:=1 to liczba do 
    begin 
      if dane[z]=0 then 
        begin 
          liczbaZer := liczbaZer + 1; 
        end; 
    end; 
  writeln('Liczba zer: ', liczbaZer); 
end; 

procedure wypiszSredniaUjemnych; 

var 
   liczbaUjemnych:integer; 
   sumaUjemnych:real; 
begin 
  liczbaUjemnych := 0; 
  sumaUjemnych := 0; 
  for z:=1 to liczba do 
    begin 
      if dane[z]<0 then 
        begin 
          liczbaUjemnych := liczbaUjemnych + 1; 
          sumaUjemnych := sumaUjemnych + dane[z]; 
        end; 
    end; 
  if liczbaUjemnych > 0 then 
    writeln('Srednia liczb ujemnych: ', sumaUjemnych/liczbaUjemnych) 
  else 
    writeln('Srednia liczb ujemnych: nie podano liczb ujemnych'); 
end; 

procedure wypiszSredniaDodatnich; 

var 
   liczbaDodatnich:integer; 
   sumaDodatnich:real; 
begin 
  liczbaDodatnich := 0; 
  sumaDodatnich := 0; 
  for z:=1 to liczba do 
    begin 
      if dane[z]>0 then 
        begin 
          liczbaDodatnich := liczbaDodatnich + 1; 
          sumaDodatnich := sumaDodatnich + dane[z]; 
        end; 
    end; 
  if liczbaDodatnich > 0 then 
    writeln('Srednia liczb dodatnich: ', sumaDodatnich/liczbaDodatnich) 
  else 
    writeln('Srednia liczb dodatnich: nie podano liczb dodatnich'); 
end; 

function obliczOdchylenieStandardowe:real; 

var 
   sumaKwadratow, srednia:real; 
begin 
  sumaKwadratow := 0; 
  srednia := obliczSrednia; 
  for z:=1 to liczba do 
    begin 
      sumaKwadratow := sumaKwadratow + sqr(dane[z]-srednia); 
    end; 
  obliczOdchylenieStandardowe := sqrt(sumaKwadratow/liczba); 
end; 

procedure wypiszStandardowe; 

begin 
  writeln('Odchylenie standardowe: ', obliczOdchylenieStandardowe); 
end; 

function odchylenieSrednie:real; 

var 
   suma, srednia:real; 
begin 
  suma := 0; 
  srednia := obliczSrednia; 
  for z:=1 to liczba do 
    begin 
      suma := suma + abs(dane[z]-srednia); 
    end; 
  odchylenieSrednie := suma/liczba; 
end; 

procedure wypiszSrednie; 

begin 
  writeln('Odchylenie srednie: ', OdchylenieSrednie); 
end; 

begin 
  wypelnijTablice; 
  if liczba > 0 then 
    begin 
      wypiszSume; 
      wypiszSrednia; 
      wypiszLiczbeZer; 
      wypiszSredniaUjemnych; 
      wypiszSredniaDodatnich; 
      wypiszStandardowe; 
      wypiszSrednie; 
    end 
  else 
    writeln('Nie podano ¿adnych liczb'); 
end.
