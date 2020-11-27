Program Flock6; 
{Trzymanie sie najblizszego sasiada - miesci sie tylko 200 czasteczek bo jest tablica odleg³oœci}
Const 
   init_r=50; 
   Last=200; 
   Width=500; 
   Height=500; 
Type 
   {Typ rekordowy definiujacy cz¹steczkê} 
   agent=record 
        x,y,vx,vy:real; 
   end; 
   
   {Typ tablicowy dla "Œwiata" cz¹steczek} 
   World=array[1..Last] of agent; 

   const 
   {Wspó³czynnik losowej zmiany predkosci 0..1} 
   RConst=0.1; 
   {Wspolczynnik zblizania predkosci 1..20} 
   VConst=1; 
   {Wspolczynnik zblizania pozycji 1..20} 
   CConst=1; 

Procedure RandomPosition1(first,last:integer;Var W:World); 
{Inicjalizacja pozycji} 

Var 
   i:integer; 
Begin 
  For i:=first to last do 
    Begin 
      W[i].x:=1+random(Width-1); 
      W[i].y:=1+random(Height-1); 
    end; 
end; 

Procedure RandomPosition2(first,last:integer;Var W:World;x,y,r:integer); 
{Inicjalizacja pozycji w kole o promieniu r} 

Var 
   i,rr:integer; 
   alfa:real; 
Begin 
  For i:=first to last do 
    Begin 
      rr:=random(r); 
      alfa:=random*2*pi; 
      W[i].x:=round(x+sin(alfa)*rr); 
      W[i].y:=round(y+cos(alfa)*rr); 
    end; 
end; 

Procedure RandomVelocity(first,last:integer;Var W:World); 
{Inicjalizacja pozycji} 

Var 
   i:integer; 
Begin 
  For i:=first to last do 
    Begin 
      W[i].vx:=RConst/2 - random*RConst; 
      W[i].vy:=RConst/2 - random*RConst; 
    end; 
end; 

Procedure DrawAll(first,last:integer;Var W:World;r,g,b:integer); 
{Rysowanie punktów w zadanym kolorze} 

Var 
   i:integer; 
Begin 
  Pen(1,r,g,b); 
  For i:=first to last do 
    begin 
      {Ellipse(round(W[i].x)-1,round(W[i].y)-1,round(W[i].x)+1,round(W[i].y)+1); }
      Point(round(W[i].x),round(W[i].y))
    end; 
end; 

Function Inside(x,y:real):boolean; 
{Sprawdzanie czy punkt jest w obszarze dozwolonym} 

Begin 
  Inside:=(0<x)and(x<Width)and(0<y)and(y<Height); 
end; 

Procedure VelocityMove(first,last:integer;Var W:World); 
{Losowe przemieszczanie} 

Var 
   i:integer; 
   dx,dy,newx,newy:real; 
Begin 
  For i:=first to last do 
    Begin 
      dx:=W[i].vx; 
      dy:=W[i].vy; 
      if inside(W[i].x+dx,W[i].y+dy) then 
        Begin 
          W[i].x:=W[i].x+dx; 
          W[i].y:=W[i].y+dy; 
        end; 
    end; 
end; 

Function Sign(x:real):integer; 
{Zwraca -1 jesli ujemne, 1 jesli dodatnie i 0 jesli 0} 

begin 
  if x<0 then 
    Sign:=-1 
  else 
    if x>0 then 
      Sign:=1 
    else 
      Sign:=0; 
end; 

Function Distance(x1,y1,x2,y2:real):real; 

begin 
  Distance:=sqrt(sqr(x1-x2)+sqr(y1-y2)); 
end; 

const 
   ZA_DUZO=1000000; 
var 
   Distances:array[1..Last,1..Last] of real; 

Procedure CalculateDistances(Var W:World); 
{BARDZO KOSZTOWNA - liczy odleglosci kazdego agenta do kazdego} 

var 
   i,j:integer; 
begin 
  for i:=1 to last do 
    begin 
      {NA PRZEKATNEJ DUZE LICZBY - ³atwiej bedzie szukac najblizszego} 
      Distances[i,i]:=ZA_DUZO; 
      {Obliczanie i zapisywanie macierzy odleglosci} 
      for j:=i+1 to last do 
        begin 
          Distances[i,j]:=Distance(W[i].x,W[i].y,W[j].x,W[j].y); 
          Distances[j,i]:= Distances[i,j]; 
        end; 
    end; 
end; 

function Nearest(i:integer;Var W:World;Var mindist:real):integer; 
{Funkcja zwraca indeks najblizszego i odleglosc w parametrze dist} 

var 
   j,which:integer; 
begin 
  {Pierwsza normalna odleglosci zamieni wartosc w mindist} 
  mindist:=ZA_DUZO; 
  {Petla szukania minimum} 
  for j:=1 to Last do 
    if Distances[i,j]<mindist then 
      begin 
        mindist:=Distances[i,j]; 
        which:=j; 
      end; 
  Nearest:=which; 
end; 

Procedure VelocityChange(first,last:integer;Var W:World); 
{Inteligentne i losowe modyfikacje wektorow predkosci} 

Var 
   i,p:integer; 
   d:real; 
Begin 
  {Obliczenie wszystkich odleglosci!} 
  CalculateDistances(W); 
  {Modyfikacja Œwiata w oparciu o te cenne informacje} 
  For i:=first to last do 
    Begin 
      {Odnalezienie najblizszego sasiada} 
      p:=Nearest(i,W,d); 
      {Upodobnienie predkosci cz¹steczki i do czasteczki p} 
      W[i].vx:=W[i].vx-VConst*d*Sign(W[i].vx-W[p].vx); 
      W[i].vy:=W[i].vy-VConst*d*Sign(W[i].vy-W[p].vy); 
      {Przyblizenie cz¹steczki i do czasteczki p} 
      W[i].vx:=W[i].vx-CConst*d*Sign(W[i].x-W[p].x); 
      W[i].vy:=W[i].vy-CConst*d*Sign(W[i].y-W[p].y); 
      {Losowa modyfikacja predkosci} 
      W[i].vx:=W[i].vx+RConst*(0.5-random); 
      W[i].vy:=W[i].vy+RCOnst*(0.5-random); 
    end; 
end; 

Function MeanDistance(first,last:integer;Var W:World):real; 
{losowa próba odleglosci} 

Var 
   i,j:integer; 
   dist,summ:real; 
Begin 
  MeanDistance:=-9999; 
end; 

Var 
   TheWorld:World; 
   Step:integer; 

procedure Loop; 
{PÊTLA SYMULACJI STAD/A} 

begin 
  Step:=0; 
  While not IsEvent do 
    Begin 
      {przesuwanie} 
      VelocityChange(1,Last,TheWorld); 
      {czyszczenie} 
      DrawAll(1,Last,TheWorld,228,228,128); 
      VelocityMove(1,Last,TheWorld); 
      {rysowanie na nowych pozycjach} 
      DrawAll(1,Last,TheWorld,255,15,15); 
      {Opis na ekranie} 
      Step:=Step+1; 
      MoveTo(0,0); 
      Write(Step,' ',MeanDistance(1,Last,TheWorld) :3:2); 
    end; 
end; 

Begin 
  {INICJALIZACJA} 
  If init_r>0 then 
    RandomPosition2(1,Last,TheWorld,Width div 2,Height div 2,init_r) 
  else 
    RandomPosition1(1,Last,TheWorld); 
  RandomVelocity(1,Last,TheWorld); 
  DrawAll(1,last,TheWorld,0,0,0); 
  Loop; 
end.
