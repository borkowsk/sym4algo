Program Epidemic; 
{Adam Kórlikowski} 

Type 
   node=record 
        x,y:real; 
        state:integer; 
   end; 

   Const 
   Last=20; 
Var 
   TheNodes:array[1..Last] of node; 
   TheEdges:array[1..Last,1..Last] of real; 

   Const 
   ERatio=0.5; 
   {Ile po³aczen istnieje realnie – gdy niewaone} 
   Weighted=true; 
   {Czy po³aczenia waone?} 
   Intensity=60; 
   {Last*n - Ile moliwosci interakcji kadego ”dnia”} 
   Duration=4; 
   {Czas trwania infekcji} 
   Immunity=31; 
   {Czas istnienia odpornosci} 
   Radius=10; 
   {Rozmiar wez³a w wizualizacji} 
   Width=400; 
   {Bok ekranu} 
   Ring=true; 
   {Czy wez³y u³oone w kó³ko?} 

Procedure CleanArrays; 
{Czyszczenie struktur danych} 

Var 
   i,j:integer; 
Begin 
  For i:=1 to Last do 
    Begin 
      TheNodes[i].x:=0; 
      TheNodes[i].y:=0; 
      TheNodes[i].state:=0; 
      For j:=1 to Last do 
        TheEdges[i,j]:=0; 
    end; 
end; 

Procedure graf; 
{graf jedno wymiarowy - przyk³ad a z prezentcji} 
{Adam Kórlikowski} 
Var 
   i,j:integer; 
Begin 
  i:=last; 
  j:=2; 
  theEdges[i,j]:=1; 
  j:=1; 
  i:=last-1; 
  theEdges[i,j]:=1; 
  For i:=2 to Last do 
    begin 
      j:=i-2; 
      j:=i-1; 
      TheEdges[i,j]:=1; 
    end; 
  i:=last; 
  j:=1; 
  theEdges[i,j]:=1; 
  For i:=3 to Last do 
    begin 
      j:=i-1; 
      j:=i-2; 
      TheEdges[i,j]:=1; 
    end; 
  for i:=3 to last do 
    begin 
      j:=i-1; 
      j:=i; 
      TheEdges[i,j]:=1; 
    end; 
end; 

Procedure WeightedEdges; 
{Waone po³aczenia z ma³ym
prawdopodobienstwem duej wagi} 

Var 
   i,j:integer; 
Begin 
  For i:=2 to Last do 
    For j:=1 to i-1 do 
      TheEdges[i,j]:=random*random*random; 
end; 

Procedure RandomEdges(ratio:real); 
{Losowe po³aczenia o pe³nej sile} 

Var 
   i,j:integer; 
Begin 
  For i:=2 to Last do 
    For j:=1 to i-1 do 
      If random<ratio then 
        TheEdges[i,j]:=1; 
end; 

Procedure swap(Var a,b:integer); 
{Pomocnicza procedura zamiany
wartosci zmiennych} 

Var 
   pom:integer; 
Begin 
  pom:=a; 
  a:=b; 
  b:=pom; 
end; 

Procedure SmallStep; 
{Pojedyncza interakcja pomiedzy wez³ami} 

Var 
   i,j:integer; 
   w:real; 
Begin 
  {Losowanie 1. partnera interakcji} 
  i:=1+random(Last); 
  {Losowanie 2. partnera rónego od 1} 
  Repeat 
    j:=1+random(Last); 
  until i<>j; 
  {Zak³adamy e sa co najmniej 2} 
  {Przestawianie partnerów bo po³aczenia sa symetryczne} 
  If i<j then 
    swap(i,j); 
  w:=TheEdges[i,j]; 
  {Infekcja z j na i} 
  If w>0 then 
    Begin 
      If (TheNodes[i].state=0)and (TheNodes[j].state>0)and (TheNodes[j].state<Duration)and(random<=w) then 
        TheNodes[i].state:=1; 
    end; 
  {DO UZUPE£NIENIA INTERAKCJA i na j} 
end; 

Procedure TimeSlice; 
{Up³yw czasu - synchroniczna zmiana stanów, infekcja losowa} 

Var 
   i:integer; 
Begin 
  For i:=1 to Last do 
    If TheNodes[i].state>0 then 
      TheNodes[i].state:=(TheNodes[i].state+1)mod(Duration+Immunity); 
  {Potencjalne infekcje} 
  For i:=1 to Intensity do 
    SmallStep; 
end; 

Procedure CalculateStat(Var infected, immune :integer); 
{Obliczanie statystyki} 

Var 
   i:integer; 
Begin 
  infected:=0; 
  immune:=0; 
  For i:=1 to Last do 
    If TheNodes[i].state>0 then 
      If TheNodes[i].state<Duration then 
        infected:=infected+1 
      else 
        immune:=immune+1; 
  {….} 
end; 

Procedure RandomPosition; 
{Nadawanie wez³om
losowych pozycji} 

Var 
   i:integer; 
Begin 
  For i:=1 to Last do 
    Begin 
      TheNodes[i].x:=random; 
      TheNodes[i].y:=random; 
    end; 
end; 

Procedure RingPositions; 
{Nadawanie wez³om pozycji na okregu} 

Var 
   i:integer; 
   alfa:real; 
Begin 
  For i:=1 to Last do 
    Begin 
      alfa:=((2*pi)/Last)*i; 
      TheNodes[i].x:=0.5+cos(alfa)*0.45; 
      TheNodes[i].y:=0.5+sin(alfa)*0.45; 
    end; 
end; 

Procedure ViewGraph; 
{PROCEDURA WIZUALIZACJI GRAFU
Najpierw podprogramy pomocnicze} 


Procedure EdgeColor(v,min,max:real); 
{Kolor krawedzi - szary, zaleny od wagi} 

Begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Pen(2,round(255-v),round(255-v),round(255-v)); 
end; 

Procedure NodeFill(v:integer); 
{Kolor wez³a zaleny od stanu} 

Begin 
  If v=0 then 
    Begin 
      Brush(1,0,0,155); 
      Pen(1,0,0,155); 
    end 
  else 
    If v<Duration then 
      Begin 
        v:=round(255-(v-1)/(Duration-1)*155); 
        Brush(1,v,0,0); 
        Pen(1,v,0,0); 
      end 
    else 
      Begin 
        v:=round(255-(v-Duration)/ (Duration+Immunity-Duration)*155); 
        Brush(1,0,v,0); 
        Pen(1,0,v,0); 
      end; 
end; 

Function Rescale(v,min,max:real;imax:integer):integer; 
{Przeskalowywanie pozycji} 

Begin 
  v:=(v-min)/(max-min); 
  Rescale:=round(imax*v); 
end; 

Var 
   i,j:integer; 
   x1,y1,x2,y2:integer; 
Begin 
  {W³asciwe rysowan
  

