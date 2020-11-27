Program CA_1D_pseudo_life_z_losowaniem; 
{Program nasladuje w jednowymiarowym automacie komórkowym Life Conwaya} 
{GRAFIKA Z ALGO - NIE MA PRZENOŒNEJ GRAFIKI DLA PASCALA} 

const 
   Last=501; 
   {Rozmiar tablicy - Musi byc wiêksze ni¿ 1 i nieparzyste} 
   Steps=501; 
   {Ile kroków mo¿na wykonaæ } 
   Wylosowane=true; 
   Prob=0.5; 
var 
   Swiat:array[1..Last] of integer; 
   NowyS:array[1..Last] of integer; 
   krok:integer; 

procedure zeruj; 
{Wyzerowanie "Swiat"a aktualnego} 

var 
   i:integer; 
begin 
  for i:=1 to Last do 
    Swiat[i]:=0; 
end; 

procedure losuj; 
{Wylosowanie "Swiat"a aktualnego} 

var 
   i:integer; 
begin 
  for i:=1 to Last do 
    if random<Prob then 
      Swiat[i]:=0 
    else 
      begin 
        if random<0.5 then 
          Swiat[i]:=1 
        else 
          Swiat[i]:=2; 
      end; 
end; 

procedure wypisz(linia:integer); 
{Wypisywanie na ekran graficzny} 
{To jest nieprzenoœne!!!} 

var 
   i:integer; 
begin 
  for i:=1 to Last do 
    begin 
      if Swiat[i]=0 then 
        Pen(1,255,255,255); 
      if Swiat[i]=1 then 
        Pen(1,0,127,0); 
      if Swiat[i]=2 then 
        Pen(1,200,0,0); 
      Point(i,linia); 
    end; 
end; 

procedure wyrysuj; 
{Wypisywanie na ekran graficzny} 
{To jest nieprzenoœne!!!} 

var 
   i:integer; 
begin 
  for i:=1 to Last do 
    begin 
      if Swiat[i]=0 then 
        Pen(1,255,255,255); 
      if Swiat[i]=1 then 
        Pen(1,0,127,0); 
      if Swiat[i]=2 then 
        Pen(1,200,0,0); 
      Line(i,15,i,24); 
    end; 
end; 

procedure przepisz; 
{Przepisywanie z "NowyS"[wiat] na "Swiat" aktualny} 

var 
   i:integer; 
begin 
  for i:=1 to Last do 
    Swiat[i]:=NowyS[i]; 
end; 

procedure zrób_krok; 
{W³asciwy krok modelu} 

var 
   i,j,k:integer; 
   {indeks lewej, œrodkowej i prawej komorki} 
   a,b:integer; 
begin 
  for j:=1 to Last do 
    begin 
      a:=0; 
      b:=0; 
      i:=j-1; 
      k:=j+1; 
      if (i>0) and (Swiat[i]=1) then 
        a:=a+1; 
      if (k<=Last) and (Swiat[k]=1) then 
        a:=a+1; 
      if (i>0) and (Swiat[i]=2) then 
        b:=b+1; 
      if (k<=Last) and (Swiat[k]=2) then 
        b:=b+1; 
      if a+b=0 then 
        NowyS[j]:=0; 
      if Swiat[j]=0 then 
        begin 
          if (a=1) and (b=1) then 
            NowyS[j]:=0; 
          if (a=1) and (b<1) then 
            NowyS[j]:=1; 
          if (a<1) and (b=1) then 
            NowyS[j]:=2; 
        end; 
      if Swiat[j]=1 then 
        begin 
          if (a+b=0) or (a=2) or (b=2) then 
            NowyS[j]:=0; 
          if a+b=1 then 
            NowyS[j]:=1; 
          if (a=1) and (b=1) then 
            NowyS[j]:=2; 
        end; 
      if Swiat[j]=2 then 
        begin 
          if (a+b=0) or (a=2) or (b=2) then 
            NowyS[j]:=0; 
          if a+b=1 then 
            NowyS[j]:=2; 
          if (a=1) and (b=1) then 
            NowyS[j]:=1; 
        end; 
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
