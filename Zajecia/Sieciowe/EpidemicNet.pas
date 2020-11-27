Program Epidemic; 
{Model epidemi kataru w sieci spo³ecznej}
Type 
   node=record 
        x,y:real; 
        state:integer; 
   end; 

   Const 
   Last=20;      {Ile wezlów} 
   ERatio=0.25;  {Ile po³aczeñ istnieje realnie} 
   Intensity=50; {Last*n - Ile mo¿liwoœci interakcji ka¿dego dnia}
   Duration=7;   {Czas trwania infekcji} 
   Immunity=31;  {Czas istnienia odpornoœci} 
   Weighted=false;{Czy po³¹cznia wa¿one?} 
   
   Radius=10;    {Rozmiar wezla w wizualizacji} 
   Width=400;    {Bok ekranu} 
   Ring=true;    {Czy wêz³y u³o¿one w kó³ko?} 

Var 
   TheNodes:array[1..Last] of node; {Tablica wêz³ów}
   TheEdges:array[1..Last,1..Last] of real; {Tablica po³¹czeñ}

Procedure CleanArrays; 
{Czyszczenie struktur danych}
Var    i,j:integer; 
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
{Nadawanie wêz³om losowych pozycji}
Var    i:integer; 
Begin 
  For i:=1 to Last do 
    Begin 
      TheNodes[i].x:=random; 
      TheNodes[i].y:=random; 
    end; 
end; 

Procedure RingPositions; 
{Nadawanie wêz³om pozycji na okrêgu}
Var 
   i:integer; 
   alfa:real; 
Begin 
  For i:=1 to Last do 
    Begin 
      alfa:=((2*pi)/Last)*i; 
      TheNodes[i].x:=0.5+cos(alfa)/2.2; 
      TheNodes[i].y:=0.5+sin(alfa)/2.2; 
    end; 
end; 

Procedure RandomEdges(ratio:real); 
{Losowe po³¹czenia o pe³nej sile}
Var 
   i,j:integer; 
Begin 
  For i:=2 to Last do 
    For j:=1 to i-1 do 
      If random<ratio then 
        TheEdges[i,j]:=1; 
end; 

Procedure WeightedEdges; 
{Wa¿one po³¹czenia z ma³ym prawdopodobieñstwem du¿ej wagi}
Var 
   i,j:integer; 
Begin 
  For i:=2 to Last do 
    For j:=1 to i-1 do 
      TheEdges[i,j]:=random*random*random; 
end; 

Procedure ViewGraph; 
{PROCEDURA WIZUALIZACJI GRAFU}

Procedure EdgeColor(v,min,max:real); 
{Podprocedura: Kolor krawêdzi - szary, zale¿ny od wagi}
Begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Pen(2,round(255-v),round(255-v),round(255-v)); 
end; 

Procedure NodeFill(v:integer); 
{Podprocedura: Kolor wêz³a zale¿ny od stanu}
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
{Podprocedura a wlasciwie funkcja reskalujaca dane}
Begin 
  v:=(v-min)/(max-min); 
  Rescale:=round(imax*v); 
end; 

Var 
   i,j:integer; 
   x1,y1,x2,y2:integer; 
Begin {CIA£O PROCEDURY RYSOWANIA}
  {Najpierw rysuje krawêdzie, a potem przykrywa centra wêz³ów "talerzykami"} 
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
  {Wêz³y:} 
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

Procedure swap(Var a,b:integer); 
{Pomocnicza procedura zamiany wartoœci zmiennych}
Var 
   pom:integer; 
Begin 
  pom:=a; 
  a:=b; 
  b:=pom; 
end; 

Procedure SmallStep; 
{Pojedyncza interakcja pomiêdzy wêz³ami}
Var 
   i,j:integer; 
   w:real; 
Begin 
  {Losowanie 1. partnera interakcji} 
  i:=1+random(Last); 
  {Losowanie 2. partnera ró¿nego od 1} 
  Repeat 
    j:=1+random(Last); 
  until i<>j; 
  
  {Przestawianie partnerów bo po³aczenia s¹ symetryczne} 
  If i<j then 
    swap(i,j); 
  w:=TheEdges[i,j]; 

  {Infekcja z j na i} 
  If w>0 then 
    Begin 
      If (TheNodes[i].state=0)and (TheNodes[j].state>0)and(TheNodes[j].state<Duration)and (random<w) then 
        TheNodes[i].state:=1; 
    end
    else
    Begin {...i z i na j}
      If (TheNodes[j].state=0)and (TheNodes[i].state>0)and(TheNodes[i].state<Duration)and (random<w) then 
        TheNodes[j].state:=1; 
    end
end; 

Procedure TimeSlice; 
{Up³yw czasu - synchroniczna zmiana stanów, infekcja losowa}
Var 
   i:integer; 
Begin 
  For i:=1 to Last do 
    If TheNodes[i].state>0 then 
      TheNodes[i].state:=(TheNodes[i].state+1)mod(Duration+Immunity); 
  {Infekcja}    
  For i:=1 to Intensity do 
    SmallStep; 
end; 

Procedure CalculateStat(Var infected,immuned:integer); 
{Obliczanie statystyki}
Var 
   i:integer; 
Begin 
  infected:=0; 
  immuned:=0; 
  For i:=1 to Last do 
    If TheNodes[i].state>0 then 
      If TheNodes[i].state<Duration then 
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
    RandomEdges(ERatio); 
  
  {Wprowadzenie infekcji} 
  TheNodes[1].state:=1; 
  Repeat 
    Delay(500); 
    Pen(1,0,0,0); 
    Brush(1,255,255,255); 
    MoveTo(1,1); 
    CalculateStat(infected,immuned); 
    WriteLn('day:',step,' inf:',infected,' imm:',immuned,'     '); 
    ViewGraph; 
    {Nowy stan} 
    step:=step+1; 
    TimeSlice; 
  until infected=0;  
end.
