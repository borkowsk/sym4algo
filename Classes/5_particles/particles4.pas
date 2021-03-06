Program Particles4; 

Const 
   init_r=20;
   Last=500; 
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
{Rysowanie punkt�w w zadanym kolorze}
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


Function SredniaOdleglosc(first,last:integer;Var W:World;N:integer):real;
{losowa pr�ba odleglosci}
Var k,z,p1,p2:integer;
    dist:real;
Begin
 {Ustalenie dlugosci badanego zakresu}
 z:=last-first;
 {P�tla probkujaca odleglosci w losowych parach}
 for k:=1 to N do 
    begin
    {Wylosowanie cz�steczek do pomiaru}
    p1:=first+random(z);
    p2:=first+random(z);
    {Policzenie odleglosci}
    dist:=distance(W[p1].x,W[p1].y,W[p2].x,W[p2].y);
    end;
    
end;

Var 
   TheWorld:World; 
   Step:integer; 

Begin 
  {INICJALIZACJA} 
  Rectangle(0,0,Width+1,Height+1); 
  {Obszar dozwolony. "Rectangle" jest �le opisane w helpie!} 
  Pen(1,255,50,50); 
  {Pokazuje gdzie jest r�g dozwolonego obszaru} 
  Point(Width,Height); 
  If init_r>0 then
     RandomPosition2(1,Last,TheWorld,Width div 2,Height div 2,init_r)
     else
     RandomPosition1(1,Last,TheWorld); 
  DrawAll(1,last,TheWorld,0,0,0); 
  
  {P�TLA SYMULACJI} 
  Step:=0; 
  While not IsEvent do 
    Begin      
      {czyszczenie} 
      DrawAll(1,last,TheWorld,200,255,255); 
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
