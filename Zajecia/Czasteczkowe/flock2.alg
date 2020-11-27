Program Flock2; 
{Zbijanie siê w dwie kule "wg." koloru - p³ci (?)}
Const 
   init_r=0;
   Last=300; 
   Width=500; 
   Height=500; 
   MaxMove=5; 
Type 
   particle=record 
        x,y:integer; 
   end; 
   World=array[1..Last] of particle; 

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

Procedure DrawAll(first,last:integer;Var W:World;r,g,b:integer); 
{Rysowanie punktów w zadanym kolorze}
Var 
   i:integer; 
Begin 
  Pen(1,r,g,b); 
  For i:=first to last do 
    Point(W[i].x,W[i].y); 
end; 

Function Inside(x,y:integer):boolean; 
{Sprawdzanie czy punkt jest w obszarze dozwolonym} 
Begin 
  Inside:=(0<x)and(x<Width)and(0<y)and(y<Height); 
end; 

Procedure RandomMove(first,last:integer;Var W:World); 
{Losowe przemieszczanie}
Var 
   i,dx,dy,newx,newy:integer; 
Begin 
  For i:=first to last do 
    Begin 
      dx:=MaxMove div 2 - random(MaxMove); 
      dy:=MaxMove div 2 - random(MaxMove); 
      If inside(W[i].x+dx,W[i].y+dy) then 
        Begin 
          W[i].x:=W[i].x+dx; 
          W[i].y:=W[i].y+dy; 
        end; 
    end; 
end; 

function Sign(x:integer):integer;
{Zwraca -1 jesli ujemne, 1 jesli dodatnie i 0 jesli 0}
begin
if x<0 then
   Sign:=-1
   else if x>0 then
        Sign:=1
        else
        Sign:=0;
end;

Procedure FlockConsolidation(first,last:integer;Var W:World); 
{Przemieszczanie w kierunku wylosowanej cz¹steczki}
Var 
   i,z,p:integer; 
Begin 
  {Ustalenie dlugosci badanego zakresu}
  z:=last-first+1;
  For i:=first to last do 
    Begin 
    {Wylosowanie cz¹steczki do zblizenia}
    p:=first+random(z);
    {Przyblizenie cz¹steczki i do czasteczki p}
    W[i].x:=W[i].x+Sign(W[p].x-W[i].x);
    W[i].y:=W[i].y+Sign(W[p].y-W[i].y);
    end; 
end; 

Function Distance(x1,y1,x2,y2:real):real;
begin
Distance:=sqrt(sqr(x1-x2)+sqr(y1-y2));
end;

Function MeanDistance(first,last:integer;Var W:World;N:integer):real;
{losowa próba odleglosci}
Var k,z,p1,p2:integer;
    dist,summ:real;
Begin
 {Ustalenie dlugosci badanego zakresu}
 z:=last-first+1;
 {Pêtla probkujaca odleglosci w losowych parach}
 summ:=0;
 for k:=1 to N do 
    begin
    {Wylosowanie cz¹steczek do pomiaru}
    p1:=first+random(z);
    p2:=first+random(z);
    {Policzenie odleglosci}
    dist:=distance(W[p1].x,W[p1].y,W[p2].x,W[p2].y);
    {i sumy}
    summ:=summ+dist;
    end;
 if N>0 then   
 MeanDistance:=summ/N   
 else
 MeanDistance:=-9999;
end;

Var 
   TheWorld:World; 
   Step:integer; 

Begin 
  {INICJALIZACJA} 
  Rectangle(0,0,Width+1,Height+1); 
  {Obszar dozwolony. "Rectangle" jest Ÿle opisane w helpie!} 
  Pen(1,255,50,50); 
  {Pokazuje gdzie jest róg dozwolonego obszaru} 
  Point(Width,Height); 
  If init_r>0 then
     RandomPosition2(1,Last,TheWorld,Width div 2,Height div 2,init_r)
     else
     RandomPosition1(1,Last,TheWorld); 
  DrawAll(1,last,TheWorld,0,0,0); 
  
  {PÊTLA SYMULACJI} 
  Step:=0; 
  While not IsEvent do 
    Begin      
      {czyszczenie} 
      DrawAll(1,last,TheWorld,200,255,255); 
      {przesuwanie} 
      RandomMove(1,Last,TheWorld); 
      FlockConsolidation(1,Last div 2,TheWorld); 
      FlockConsolidation(Last div 2 + 1,Last,TheWorld); 
      {rysowanie na nowych pozycjachRandomMove(1,Last,TheWorld);} 
      DrawAll(1,Last div 2,TheWorld,155,155,0); 
      DrawAll(Last div 2 + 1,Last,TheWorld,155,0,0); 
      {Opis na ekranie} 
      Step:=Step+1; 
      MoveTo(0,0); 
      Write(Step,' ',MeanDistance(1,Last,TheWorld,Last div 10) :3:2); 
    end; 
end.
