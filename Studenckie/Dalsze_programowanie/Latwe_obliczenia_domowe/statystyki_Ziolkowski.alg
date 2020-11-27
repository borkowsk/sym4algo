Program Statystyki; 

Type 
   Tab=array [1..100 ] of Integer; 
var 
   i,j,z,d,u,suma,sumaujemne,sumadodatnie:Integer; 
   OD, SR : real; 
   srednia,sredniau,sredniad:Real; 
   T:Tab; 

Procedure Wczytaj; 

Begin 
  Write('Ile liczb chcesz podac ? '); 
  Read(j); 
  for i:=1 to j do 
    begin 
      Write('Podaj ',i,' liczbe'); 
      read(T[i]); 
    end; 
End; 

Procedure Suma_danych; 

Begin 
  for i:=1 to j do 
    begin 
      suma:=suma+T[i]; 
    end; 
  Writeln('Suma danych wynosi: ',suma); 
End; 

Procedure Srednia_danych; 

Begin 
  srednia:=suma/j; 
  Writeln('Srednia danych wynosi: ',srednia:4:2); 
End; 

{algo (12:25)}

Procedure Zera; 

Begin 
  for i:=1 to j do 
    begin 
      if T[i]=0 then 
        z:=z+1; 
    end; 
  Writeln('Liczba zer: ',z); 
End; 

Procedure Srednia_ujemne; 

Begin 
  for i:=1 to j do 
    begin 
      if T[i]<0 then 
        begin 
          sumaujemne:=sumaujemne+T[i]; 
          u:=u+1; 
          sredniau:=sumaujemne/u; 
        end; 
    end; 
  if u>0 then 
    Writeln('Srednia liczb ujemnych: ',sredniau:4:2) 
  else 
    Writeln('Nie podano liczb ujemnych'); 
End; 

Procedure Srednia_dodatnie; 

Begin 
  for i:=1 to j do 
    begin 
      if T[i]>0 then 
        begin 
          sumadodatnie:=sumadodatnie+T[i]; 
          d:=d+1; 
          sredniad:=sumadodatnie/d; 
        end; 
    end; 
  if d>0 then 
    Writeln('Srednia liczb dodatnich: ',sredniad:4:2) 
  else 
    Writeln('Nie podano liczb dodatnich'); 
End; 

Procedure Odchylenie; 

begin 
  for i:=1 to j do 
    begin 
      OD:=OD + SQR(T[i]); 
      SR:=SR + T[i]; 
    end; 
  SR:=SR / j; 
  OD:=SQRT((OD - j*SQR(SR))/(j - 1)); 
  Writeln('Odchylenie standardowe wynosi: ',OD:4:2); 
end; 

BEGIN; 
  suma:=0; 
  z:=0; 
  d:=0; 
  u:=0; 
  OD:=0; 
  SR:=0; 
  sumaujemne:=0; 
  sumadodatnie:=0; 
  sredniau:=0; 
  sredniad:=0; 
  Wczytaj; 
  Writeln; 
  Suma_danych; 
  Writeln; 
  Srednia_danych; 
  Writeln; 
  Zera; 
  Writeln; 
  Srednia_ujemne; 
  Writeln; 
  Srednia_dodatnie; 
  Writeln; 
  Odchylenie; 
END.

