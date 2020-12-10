Program Particles2; 

Const 
   Last=1500; 
   Width=500; 
   Height=500; 
   MaxMove=5; 
type 
   particle=record 
        x,y:integer; 
   end; 
   World=array[1..Last] of particle; 

Procedure RandomPosition(first,last:integer;var W:World); 
{Inicjalizacja pozycji}
var 
   i:integer; 
Begin 
  for i:=first to last do 
    begin 
      W[i].x:=1+random(Width-1); 
      W[i].y:=1+random(Height-1); 
    end; 
end; 

Procedure DrawAll(first,last:integer;var W:World;r,g,b:integer); 
{Rysowanie punktów w zadanym kolorze}
var 
   i:integer; 
Begin 
  Pen(1,r,g,b); 
  for i:=first to last do 
    Point(W[i].x,W[i].y); 
end; 

Function Inside(x,y:integer):boolean; 
{Sprawdzanie czy punkt jest w obszarze dozwolonym} 
begin 
  Inside:=(0<x)AND(x<Width)AND(0<y)AND(y<Height); 
end; 

Procedure RandomMove(first,last:integer;var W:World); 
{Losowe przemieszczanie}
var 
   i,dx,dy,newx,newy:integer; 
Begin 
  for i:=first to last do 
    begin 
      dx:=MaxMove div 2 - random(MaxMove); 
      dy:=MaxMove div 2 - random(MaxMove); 
      if inside(W[i].x+dx,W[i].y+dy) then 
        begin 
          W[i].x:=W[i].x+dx; 
          W[i].y:=W[i].y+dy; 
        end; 
    end; 
end; 

var 
   TheWorld:World; 
   Step:integer; 

Begin 
  {INICJALIZACJA} 
  Rectangle(0,0,Width+1,Height+1); 
  {Obszar dozwolony. "Rectangle" jest Ÿle opisane w helpie!} 
  Pen(1,255,50,50); 
  Point(Width,Height); 
  {Pokazuje gdzie jest róg dozwolonego obszaru} 
  RandomPosition(1,Last,TheWorld); 
  DrawAll(1,last,TheWorld,0,0,0); 
  
  {PÊTLA SYMULACJI} 
  Step:=0; 
  while not isEvent do 
    begin 
      delay(80); 
      {czyszczenie} 
      DrawAll(1,last,TheWorld,255,255,255); 
      {przesuwanie} 
      RandomMove(1,Last,TheWorld); 
      {rysowanie na nowych pozycjachRandomMove(1,Last,TheWorld);} 
      DrawAll(1,last,TheWorld,0,0,0); 
      {Opis na ekranie} 
      Step:=Step+1; 
      MoveTo(0,0); 
      Write(Step); 
    end; 
end.
