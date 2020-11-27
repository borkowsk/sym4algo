Program Epidemic; 

Type 
   node=record 
        x,y:real; 
        state:integer; 
   end; 

   Const 
   Last=40; 
   {Ile w�z��w} 
   ERatio=0.5; 
   {Ile po��cze� istnieje realnie} 
   Intensity=60;{Last*n}
   {Ile mo�liwo?ci interakcji ka�dego dnia}
   Duration=7; 
   {Czas trwania infekcji} 
   Immunity=31; 
   {Czas istnienia odporno?ci} 
   Radius=10; 
   {Rozmiar w�z�a w wizualizacji} 
   Width=600; 
   {Bok ekranu} 
   Ring=true; 
   {Czy w�z�y u�o�one w k�ko?} 
   Weighted=false; 
   {Czy po��czenia wa�one?} 
Var 
   TheNodes:array[1..Last] of node; 
   TheEdges:array[1..Last,1..Last] of real; 

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

Procedure RandomPosition; 
{Nadawanie w�z�om losowych pozycji}
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
{Nadawanie w�z�om pozycji na okr�gu} 

Var 
   i:integer; 
   alfa:real; 
Begin 
  for i:=1 to last do 
    begin 
      alfa:=((2*pi)/last)*i; 
      thenodes[i].x:=0.5+cos(alfa)/2.2; 
      thenodes[i].y:=0.5+sin(alfa)/2.2; 
    end; 
end; 


procedure krawedzie1; 

var 
   i,j:integer; 
begin 
  for i:=2 to last do 
    begin 
      if i<>last then 
        begin 
          j:=i-1; 
          TheEdges[i,j]:=1; 
          TheEdges[i+1,j]:=1; 
          TheEdges[i+1,j+1]:=1; 
        end 
      else 
        begin 
          j:=1; 
          TheEdges[i,j]:=1; 
          TheEdges[i-1,j]:=1; 
          TheEdges[i,j+1]:=1; 
        end; 
    end; 
end; 

Procedure RandomEdges(ratio:real); 
{Losowe po��czenia o pe�nej sile}
Var 
   i,j:integer; 
Begin 
  For i:=2 to Last do 
    For j:=1 to i-1 do 
      If random<ratio then 
        TheEdges[i,j]:=1; 
end; 

Procedure WeightedEdges; 
{Wa�one po��czenia z ma�ym prawdopodobie�stwem du�ej wagi} 

Var 
   i,j:integer; 
Begin 
  for i:=2 to last do 
    for j:=1 to i-1 do 
      theedges[i,j]:=random*random*random; 
end; 

Procedure ViewGraph; 
{PROCEDURA WIZUALIZACJI GRAFU}

Procedure EdgeColor(v,min,max:real); 
{Kolor kraw�dzi - szary, zale�ny od wagi}
Begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Pen(2,round(255-v),round(255-v),round(255-v)); 
end; 

Procedure NodeFill(v:integer); 
{Kolor w�z�a zale�ny od stanu}
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
        v:=round(255-(v-Duration)/(Duration+Immunity-Duration)*155); 
        Brush(1,0,v,0); 
        Pen(1,0,v,0); 
      end; 
end; 

Function Rescale(v,min,max:real;imax:integer):integer; 

Begin 
  v:=(v-min)/(max-min); 
  Rescale:=round(imax*v); 
end; 

Var 
   i,j:integer; 
   x1,y1,x2,y2:integer; 
Begin 
  {W�a?ciwe rysowanie. Najpierw rysuje kraw�dzie, 
   a potem przykrywa centra w�z��w "talerzykami"} 
  {Kraw�dzie:} 
  for i:=2 to last do 
    for j:=1 to i-1 do 
      if theedges[i,j]>0 then 
        begin 
          x1:=rescale(thenodes[i].x,0,1,width); 
          y1:=rescale(thenodes[i].y,0,1,width); 
          x2:=rescale(thenodes[j].x,0,1,width); 
          y2:=rescale(thenodes[j].y,0,1,width); 
          edgecolor(theedges[i,j],0,1); 
          line(x1,y1,x2,y2); 
        end; 
  {W�z�y:} 
  for i:=1 to last do 
    begin 
      x1:=rescale(thenodes[i].x,0,1,width); 
      y1:=rescale(thenodes[i].y,0,1,width); 
      x1:=x1-radius; 
      y1:=y1-radius; 
      x2:=x1+2*radius; 
      y2:=y1+2*radius; 
      nodefill(thenodes[i].state); 
      ellipse(x1,y1,x2,y2); 
    end; 
end; 

Procedure swap(Var a,b:integer); 
{Pomocnicza procedura zamiany warto?ci zmiennych}
Var 
   pom:integer; 
Begin 
  pom:=a; 
  a:=b; 
  b:=pom; 
end; 

Procedure SmallStep; 
{Pojedyncza interakcja pomi�dzy w�z�ami} 

Var 
   i,j:integer; 
   w:real; 
Begin 
  i:=1+random(last); 
  repeat 
    j:=1+random(last); 
  until i<>j; 
  if i<j then 
    swap(i,j); 
  w:=theedges[i,j]; 
  if w>0 then 
    begin 
      if (thenodes[i].state=0) and (thenodes[j].state>0) and (thenodes[j].state<duration)and(random<w) then 
        thenodes[i].state:=1; 
    end; 
  if w>0 then 
    begin 
      if (thenodes[j].state=0) and (thenodes[i].state>0) and (thenodes[i].state<duration)and(random<w) then 
        thenodes[j].state:=1; 
    end; 
end; 

Procedure TimeSlice; 
{Up�yw czasu - synchroniczna zmiana stan�w, infekcja losowa} 

Var 
   i:integer; 
Begin 
  for i:=1 to last do 
    if thenodes[i].state>0 then 
      thenodes[i].state:=(thenodes[i].state+1)mod(duration+immunity); 
  for i:=1 to intensity do 
    smallstep; 
end; 

Procedure CalculateStat(Var infected,immuned:integer); 
{Obliczanie statystyki} 

Var 
   i:integer; 
Begin 
  infected:=0; 
  immuned:=0; 
  for i:=1 to last do 
    if thenodes[i].state>0 then 
      if thenodes[i].state<duration then 
        infected:=infected+1 
      else 
        immuned:=immuned+1; 
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
    {RandomEdges(ERatio);}
krawedzie1; 
  
  {Wprowadzenie infekcji} 
  TheNodes[1].state:=1; 
  Repeat 
    Delay(500); 
    Pen(1,0,0,0); 
    Brush(1,255,255,255); 
    MoveTo(1,1); 
    CalculateStat(infected,immuned); 
    WriteLn(step,' ',infected,' ',immuned,'     '); 
    ViewGraph; 
    {Nowy stan} 
    step:=step+1; 
    TimeSlice; 
  until infected=0;
end.

