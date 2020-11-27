Program Epidemic; 
{wrzuci³em wszystkie trzy typy modeli:
{-po³¹czenia z s¹siadami,} 
{-po³¹czenia z s¹siadami lub po³¹czenia dalsze,} 
{-po³¹czenia z s¹siadami i po³¹czenia dalsze,} 
{-prosty model hierarchiczny. mocno niedoskona³y, ale niestety moja umiejêtnoœæ programowania nie jest najwy¿sza oraz brakuje trochê czasu} 


Type 
   node=record 
        x,y:real; 
        state:integer; 
   end; 

   Const 
   Last=29; 
   {w modelu hierarchicznym ustawiæ trzeba wartoœæ równ¹ Stopien1+Stopien1*Stopien2+Stopien1*Stopien2*Stopien3} 
Var 
   TheNodes:array[1..Last] of node; 
   TheEdges:array[1..Last,1..Last] of real; 

   Const 
   ERatio=0.8; 
   {stala wielofunkcyjna - w polaczeniach} 
   {losowych decyduje o ilosci polaczen,} 
   {w czwartym i piatym modelu o ilosci polaczen dalszych} 
   Edges=6; 
   {Polaczenia - 1 losowe, 2 wazone, } 
   {3 cztery wezly, 4 cztery wezly lub polaczenia dalsze,} 
   {5 cztery wezly i polaczenia dalsze} 
   Stopien1=1; 
   Stopien2=4; 
   Stopien3=6; 
   {Kolejne iloœci po³¹czeñ w modelu hierarchicznym. Suma iloczynów poprzednich stopni zastêpuje sta³¹ last} 
   Intensity=300; 
   {Last*n - Ile mo liwosci interakcji ka dego ”dnia”} 
   Duration=7; 
   {Czas trwania infekcji} 
   Immunity=5; 
   {Czas istnienia odpornosci} 
   Radius=8; 
   {Rozmiar wez³a w wizualizacji} 
   Width=400; 
   {Bok ekranu} 
   UlozenieWezlow=3; 
   {1-random, 2-ring, 3-hierarchical} 

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
{Losowe po³aczenia o pe³nej sile} 

Var 
   i,j:integer; 
Begin 
  For i:=2 to Last do 
    For j:=1 to i-1 do 
      If random<ratio then 
        TheEdges[i,j]:=1; 
end; 

Procedure WeightedEdges; 
{Wa one po³aczenia z ma³ym
prawdopodobienstwem du ej wagi} 

Var 
   i,j:integer; 
Begin 
  For i:=2 to Last do 
    For j:=1 to i-1 do 
      TheEdges[i,j]:=random*random*random; 
end; 

Procedure FourAdjacentNodesEdges; 
{polaczenie z dwoma poprzednimi i dwoma nastepnymi wezlami} 

var 
   i,j,k:integer; 
begin 
  For i:=1 to Last do 
    begin 
      for j:=-2 to 2 do 
        begin 
          if j<>0 then 
            begin 
              k:=i+j; 
              if k<=0 then 
                k:=k+last; 
              if k>last then 
                k:=k-last; 
              TheEdges[i,k]:=1; 
            end; 
        end; 
    end; 
end; 

Procedure FourNodesEdgesLittleBitRandom; 
{losowane ka¿dorazowo - zwykle polaczenie czy skomplikowana relacja} 

var 
   i,j,k:integer; 
begin 
  For i:=1 to Last do 
    begin 
      for j:=-2 to 2 do 
        begin 
          if j<>0 then 
            begin 
              if Eratio<Random then 
                begin 
                  k:=i+j; 
                  if k<=0 then 
                    k:=k+last; 
                  if k>last then 
                    k:=k-last; 
                  TheEdges[i,k]:=1; 
                end 
              else 
                begin 
                  repeat 
                    k:=random(Last)+1; 
                  until (k>i+2) or (k<i-2); 
                  TheEdges[i,k]:=1; 
                end; 
            end; 
        end 
    end; 
end; 

Procedure FourNodesEdgesPlusLongEdges; 
{losowane ka¿dorazowo - zwykle polaczenie czy skomplikowana relacja} 

var 
   i,j,k:integer; 
begin 
  For i:=1 to Last do 
    begin 
      for j:=-2 to 2 do 
        begin 
          if j<>0 then 
            begin 
              k:=i+j; 
              if k<=0 then 
                k:=k+last; 
              if k>last then 
                k:=k-last; 
              TheEdges[i,k]:=1; 
            end; 
        end; 
      if ERatio<random then 
        repeat 
          k:=random(Last)+1; 
        until (k>i+2) or (k<i-2); 
      TheEdges[i,k]:=1; 
    end; 
end; 

Procedure SimpleHierarchicalNodesAndEdges; 

var 
   i,j,k,IloscWezlow:integer; 
begin 
  IloscWezlow:=Stopien1+Stopien1*Stopien2+Stopien1*Stopien2*Stopien3; 
  for i:= 1 to IloscWezlow do 
    begin 
      if i<=Stopien1 then 
        begin 
          for j:= 1 to Stopien2 do 
            begin 
              k:=Stopien1+((i-1)*Stopien2)+j; 
              TheEdges[k,i]:=1; 
            end; 
        end; 
      if (i>Stopien1) and (i<=Stopien2*Stopien1+Stopien1) then 
        begin 
          for j:= 1 to Stopien3 do 
            begin 
              k:=Stopien1+Stopien1*Stopien2+(i-Stopien1-1)*Stopien3+j; 
              TheEdges[k,i]:=1; 
            end; 
        end; 
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

Procedure SmallStep; 
{Pojedyncza interakcja pomiedzy wez³ami} 

Var 
   i,j:integer; 
   w:real; 
Begin 
  {Losowanie 1. partnera interakcji} 
  i:=1+random(Last); 
  {Losowanie 2. partnera róznego od 1} 
  Repeat 
    j:=1+random(Last); 
  until i<>j; 
  {Zak³adamy  e sa co najmniej 2} 
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
  If j<i then 
    swap(j,i); 
  w:=TheEdges[j,i]; 
  {Infekcja z i na j} 
  If w>0 then 
    Begin 
      If (TheNodes[j].state=0)and (TheNodes[i].state>0)and (TheNodes[i].state<Duration)and(random<=w) then 
        TheNodes[j].state:=1; 
    end; 
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

Procedure HierarchicalPosition; 
{Nadawanie Wezlom pozycji zgodnie z hierarchi¹} 

Var 
   i:integer; 
Begin 
  For i:=1 to Last do 
    Begin 
      if i<=Stopien1 then 
        begin 
          TheNodes[i].x:=0.9/Stopien1*i; 
          TheNodes[i].y:=0.3; 
        end; 
      if (i>Stopien1) and (i<=(Stopien2*Stopien1)+Stopien1) then 
        begin 
          TheNodes[i].x:=0.9/(Stopien1*Stopien2)*(i-Stopien1); 
          TheNodes[i].y:=0.6; 
        end; 
      if (i>(Stopien2*Stopien1)+Stopien1) then 
        begin 
          TheNodes[i].x:=0.9/(Stopien1*Stopien2*Stopien3)*(i-Stopien1*Stopien2); 
          TheNodes[i].y:=0.9; 
        end; 
    end; 
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

Procedure EdgeColor(v,min,max:real); 
{Kolor krawedzi - szary, zale ny od wagi} 

Begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Pen(2,round(255-v),round(255-v),round(255-v)); 
end; 

Procedure NodeFill(v:integer); 
{Kolor wez³a zale ny od stanu} 

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

Procedure ViewGraph; 
{PROCEDURA WIZUALIZACJI GRAFU} 

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
end; 
{KONIEC PROCEDURY WIZUALIZACJI GRAFU} 

Var 
   step:integer; 
   infected,immuned:integer; 

Begin 
  Clear; 
  step:=0; 
  CleanArrays; 
  Case Edges of 
    1: 
      RandomEdges(ERatio); 
    2: 
      WeightedEdges; 
    3: 
      FourAdjacentNodesEdges; 
    4: 
      FourNodesEdgesLittleBitRandom; 
    5: 
      FourNodesEdgesPlusLongEdges; 
    6: 
      SimpleHierarchicalNodesAndEdges; 
  end; 
  Case UlozenieWezlow of 
    1: 
      RandomPosition; 
    2: 
      RingPositions; 
    3: 
      HierarchicalPosition; 
  end; 
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
