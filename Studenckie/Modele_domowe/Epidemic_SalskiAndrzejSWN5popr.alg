Program Epidemic; 
{Newman and Watts' (1999a) improved SWN model with five additional shortcuts}
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
   {Ile po3aczen istnieje realnie – gdy niewa one} 
   Weighted=true; 
   {Czy po3aczenia wa one?} 
   Intensity=40; 
   {Last*n - Ile mo liwosci interakcji ka dego "dnia"} 
   Duration=7; 
   {Czas trwania infekcji} 
   Immunity=7; 
   {Czas istnienia odpornosci} 
   Radius=10; 
   {Rozmiar wez3a w wizualizacji} 
   Width=600; 
   {Bok ekranu} 
   Ring=true; 
   {Czy wez3y u3o one w kó3ko?} 

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

Procedure RandomEdges(ratio:real); 
{Losowe po3aczenia o pe3nej sile} 

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

Procedure SWN5; 
{Newman and Watts' (1999a) improved SWN model with five additional shortcuts}

Var 
   i,j,k,l,m:integer; 
Begin 
  for j:=1 to last-2 do 
    for k:=1 to 2 do 
      TheEdges[j+k,j]:=1;{random*random*random; }
      {pêtla wykonuje po³¹czenia do ka¿dego s¹siada w praw¹ strone o 2}
  for i:=1 to 5 do 
  {pêtla losowych po³¹czeñ}
    begin 
      Repeat 
        l:=random(last-1)+1; {losowanie 1 s¹siada}
        m:=random(last-1)+1; {losowanie 2 s¹siada}
        if l<m then 
          swap(l,m); 
          {zamiana miejscami je¿eli m jest wiêksze od l}
      until (l-m>=3); 
      {wykonywanie do momêtu a¿ ró¿nica bêdzie wiêksza równa 3 aby nie zdublowaæ ju¿ istniej¹cego po³¹czenia}
      TheEdges[l,m]:=0.5;{random*random*random; }
      {narysowanie wylosowanego po³¹czenia}
    end; 
    
  TheEdges[last,2]:=1;{random*random*random; }
  TheEdges[last,last-1]:=1;{random*random*random; }
  TheEdges[last,1]:=1;{random*random*random; }
  TheEdges[last-1,1]:=1;{random*random*random; }
  TheEdges[2,1]:=1;{random*random*random; }
  {narysowanie reszty po³¹czeñ}
end; 

Procedure WeightedEdges1;
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
{Pojedyncza interakcja pomiedzy wez3ami} 

Var 
   i,j:integer; 
   w:real; 
Begin 
  {Losowanie 1. partnera interakcji} 
  i:=1+random(Last); 
  {Losowanie 2. partnera ró nego od 1} 
  Repeat 
    j:=1+random(Last); 
  until i<>j; 
  {Zak3adamy  e sa co najmniej 2} 
  {Przestawianie partnerów bo po3aczenia sa symetryczne} 
  If i<j then 
    swap(i,j); 
  w:=TheEdges[i,j]; 
  {Infekcja z j na i} 
  If w>0 then 
    Begin 
      If (TheNodes[i].state=0)and (TheNodes[j].state>0)and (TheNodes[j].state<Duration)and(random<=w) then 
        TheNodes[i].state:=1; 
    end; 
  {Losowanie 1. partnera interakcji} 
  j:=1+random(Last); 
  {Losowanie 2. partnera ró nego od 1} 
  Repeat 
    i:=1+random(Last); 
  until i<>j; 
  {Zak3adamy  e sa co najmniej 2} 
  {Przestawianie partnerów bo po3aczenia sa symetryczne} 
  If j<i then 
    swap(i,j); 
  w:=TheEdges[i,j]; 
  {Infekcja z j na i} 
  If w>0 then 
    Begin 
      If (TheNodes[i].state=0)and (TheNodes[j].state>0)and (TheNodes[j].state<Duration)and(random<=w) then 
        TheNodes[i].state:=1; 
    end; 
end; 

Procedure TimeSlice; 
{Up3yw czasu - synchroniczna zmiana stanów, infekcja losowa} 

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

end; 

Procedure RandomPosition; 
{Nadawanie wez3om
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
{Nadawanie wez3om pozycji na okregu} 

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
{Kolor krawedzi - szary, zale ny od wagi} 

Begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Pen(2,round(255-v),round(255-v ),round(255-v)); 
end; 

Procedure NodeFill(v:integer); 
{Kolor wez3a zale ny od stanu} 

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
  {W3asciwe rysowanie. Najpierw rysuje krawedzie,
  a potem przykrywa centra wez3ów "talerzykami"} 
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
  {Wez3y:} 
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
end; 
{KONIEC PROCEDURY WIZUALIZACJI GRAFU} 

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
    SWN5
  else 
    RandomEdges(ERatio); 
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
