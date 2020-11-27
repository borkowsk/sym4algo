Program CA_1D_pseudo_life_z_losowaniem; 
{Program nasladuje w jednowymiarowym automacie komórkowym Life Conwaya} 
{GRAFIKA Z ALGO - NIE MA PRZENOŒNEJ GRAFIKI DLA PASCALA} 

const    Last=301;  {Rozmiar tablicy - Musi byc wiêksze ni¿ 1 i nieparzyste} 
         Steps=750; {Ile kroków mo¿na wykonaæ } 
         Wylosowane=true;
         Prob=0.45;
         
var      Swiat:array[1..Last] of integer; 
         NowyS:array[1..Last] of integer; 
         krok:integer; 

procedure zeruj; 
{Wyzerowanie "Swiat"a aktualnego} 
var  i:integer; 
begin 
  for i:=1 to Last do 
    Swiat[i]:=0; 
end; 

procedure losuj; 
{Wylosowanie "Swiat"a aktualnego} 
var  i:integer; 
begin 
  for i:=1 to Last do 
    if random<Prob then 
      Swiat[i]:=0 
    else 
      Swiat[i]:=1; 
end; 

procedure wypisz(linia:integer); 
{Wypisywanie na ekran graficzny} 
{To jest nieprzenoœne!!!} 
var   i:integer; 
begin 
  for i:=1 to Last do 
    begin 
      if Swiat[i]=0 then 
        Pen(1,0,0,0) 
      else 
        Pen(1,255,0,0); 
      Point(i,linia); 
    end; 
end; 

procedure wyrysuj;
{Wypisywanie na ekran graficzny} 
{To jest nieprzenoœne!!!} 
var  i:integer; 
begin 
  for i:=1 to Last do 
    begin 
      if Swiat[i]=0 then 
        Pen(1,0,0,1) 
      else 
        Pen(1,255,255,0); 
      Line(i,15,i,24); 
    end; 
end; 

procedure przepisz; 
{Przepisywanie z "NowyS"[wiat] na "Swiat" aktualny} 
var  i:integer; 
begin 
  for i:=1 to Last do 
    Swiat[i]:=NowyS[i]; 
end; 

procedure zrób_krok; 
{W³asciwy krok modelu} 
var   i,j,k:integer; 
      {indeks lewej, œrodkowej i prawej komorki} 
      sas:integer; 
begin 
  for j:=1 to Last do 
    begin 
      sas:=0; 
      i:=j-1; 
      k:=j+1; 
      if (i>0) and (Swiat[i]>0) then 
        sas:=sas+1; 
      if (k<=Last) and (Swiat[k]>0) then 
        sas:=sas+1; 
      if sas=1 then 
        NowyS[j]:=1 
      else 
        NowyS[j]:=0; 
    end; 
end; 

begin 
  Zeruj; 
  {¯eby nie komplikowaæ inicjacja w kodzie} 
  {   Swiat[1]:=1; } 
  Swiat[(last+1) div 2]:=1;
  if wylosowane then
              losuj;
  writeln('Automat: jednowymiarowe "¯ycie" o ',Last,' komórkach'); 
  for krok:=1 to Steps do 
    begin 
      wyrysuj;
      wypisz(25+krok); 
      zrób_krok; 
      przepisz; 
    end; 
  writeln; 
  writeln('Dziêkuje i polecam siê na przysz³oœæ'); 
end.
