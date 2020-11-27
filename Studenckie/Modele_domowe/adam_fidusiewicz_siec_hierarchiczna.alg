Program AdamFidusiewicz; 
{zaimplementowalem topologie sieci: hierarchie. drzewkowa.
OPISY IMPLEMENTACJI SA TAM TROCHE NIZEJ, PISALEM JE WIELKIMI LITERAMI ABY LATWIEJ BYLO sIE ODNALEZC}

Type 
   node=record 
        x,y:real; 
        state:integer; 
   end; 

   Const 
   Last=35; 
Var 
   TheNodes:array[1..Last] of node; 
   TheEdges:array[1..Last,1..Last] of real; 

   Const 
   ERatio=0.2; 
   {Ile po³aczen istnieje realnie – gdy niewaone} 
   Weighted=false; 
   {Czy po³aczenia waone?} 
   Intensity=60; 
   {Last*n - Ile moliwosci interakcji kadego ”dnia”} 
   Duration=7; 
   {Czas trwania infekcji} 
   Immunity=31; 
   {Czas istnienia odpornosci} 
   Radius=5; 
   {Rozmiar wez³a w wizualizacji} 
   Width=400; 
   {Bok ekranu} 
   Ring=false; 
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

Procedure RandomEdges; 
{Losowe po³aczenia o pe³nej sile}
{TUTAJ GRZEBALEM TROCHE PO TO ABY STWORZYC DRZEWKOWE POLACZENIE.
ROZPISALEM SOBIE TABELKE I NA OKO UZNALEM ZE DRZEWKO BEDZIE DZIALAC 
JEZELI I: ORAZ J: PRZYJMA PODOBNA STRUKTURE: 2,1 3,1 4,2 5,2 6,3 7,3 
I TAK DALEJ} 

Var 
   i,j:integer; 
   trzymacz:integer; 
Begin 
  trzymacz:=0; 
  j:=1; 
  For i:=2 to Last do 
    begin 
      trzymacz:=trzymacz+1; 
      if trzymacz > 2 then 
        begin 
          trzymacz:=0; 
          j:=j+1; 
        end; 
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
  {W³asciwe rysowanie. Najpierw rysuje krawedzie,
   a potem przykrywa centra wez³ów "talerzykami"} 
  {Krawedzie:} 
For i:=2 to Last do 
    For j:=1 to i-1 do 
      If TheEdges[i,j]>0 then 
        Begin 
          x1:=Rescale(TheNodes[i].x,0,1,Width); 
          y1:=Rescale(TheNodes[i].y,0,1,Width); 
          x2:=Rescale(TheNodes[j].x,0,1,Width); 
          y2:=Rescale(TheNodes[j].y,0,1,Width); 
          EdgeColor(TheEdges[i,j],0,1); 
          Line(x1,y1,x2,y2); 
        end; 
  {Wez³y:} 
  For i:=1 to Last do 
    Begin 
      x1:=Rescale(TheNodes[i].x,0,1,Width); 
      y1:=Rescale(TheNodes[i].y,0,1,Width); 
      x1:=x1-Radius; 
      y1:=y1-Radius; 
      x2:=x1+2*Radius; 
      y2:=y1+2*Radius; 
      NodeFill(TheNodes[i].state); 
      Ellipse(x1,y1,x2,y2); 
    end; 
  {KONIEC PROCEDURY WIZUALIZACJI GRAFU} 
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
{TUTAJ GRZEBALEM ZEBY DRZEWKO ULOZYLO 
SIE TAK JAK DRZEWKO CZYLI NA SAMEJ GORZE JEDNO 
OGNIWO, POZNIEJ DWA, POZNIEJ CZTERY, I TAK DALEJ}

Var 
   i:integer; 
   wysokosc:real; 
   licznik:integer; 
   obnizacz:integer;
   szerokosc:real; 
Begin 
  licznik:=1; 
  wysokosc:=0.10; 
  obnizacz:=1;
  szerokosc:=0.10;
   
  For i:=1 to Last do 
    Begin 
      if licznik = obnizacz then 
        begin 
          wysokosc:=wysokosc+0.10; 
          obnizacz:=obnizacz*2;
          szerokosc:=0.10;
          
        end; 
      TheNodes[i].x:=szerokosc; 
      TheNodes[i].y:=wysokosc; 
      licznik:=licznik+1;
      szerokosc:=szerokosc+0.10; 
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

Var 
   step:integer; 
   infected,immuned:integer; 

Begin 
  Clear; 
  step:=0; 
  CleanArrays; 
  If ring then 
    RingPositions 
  else 
    RandomPosition; 
  If weighted then 
    WeightedEdges 
  else 
    RandomEdges; 
  {Wprowadzenie infekcji} 
  TheNodes[1].state:=1; 
  Repeat 
    Delay(500); 
    Pen(1,0,0,0); 
    Brush(1,255,255,255); 
    MoveTo(1,1); 
    CalculateStat(infected,immuned); 
    WriteLn(step,' ',infected,' ',immuned,' '); 
    ViewGraph; 
    {Nowy stan} 
    step:=step+1; 
    TimeSlice; 
  until infected=0; 
end.
