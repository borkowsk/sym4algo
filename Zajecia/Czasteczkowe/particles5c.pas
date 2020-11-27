Program Particles5; 
Const 
   Init_r=0;
   Last=500; 
   Width=500; 
   Height=500; 
   MaxMove=5; 
   LogName='Particles5r0.log';
Type 
   particle=record 
        x,y:integer; 
   end; 
   world=array[1..Last] of particle; 

Procedure RandomPosition1(first,last:integer;Var W:world); 
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


Procedure RandomPosition2(first,last:integer;Var W:world;x,y,r:integer); 
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

Procedure DrawAll(first,last:integer;Var W:world;r,g,b:integer); 
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

Procedure RandomMove(first,last:integer;Var W:world); 
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

Function Distance(x1,y1,x2,y2:real):real;
begin
Distance:=sqrt(sqr(x1-x2)+sqr(y1-y2));
end;

Function MeanDistance(first,last:integer;Var W:world;N:integer):real;
{losowa próba odleglosci}
Var k,z,p1,p2:integer;
    dist,summ:real;
Begin
 {Ustalenie dlugosci badanego zakresu}
 z:=last-first;
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
   theWorld:world; 
   step:integer; 
   mDist:real;
   log:text;
Begin 
  {OTWARCIE LOGU SYMULACJI}
  Assign(log,LogName);
  Rewrite(log);
  Writeln(log,'Symulacja dyfunduj¹cych cz¹steczek'); 
  Writeln(log,'N;Init_R;Max_Move');
  Writeln(log,Last,';',Init_R,';',MaxMove);
  Writeln;
  Writeln(log,'Step;MeanDist');
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
  step:=0; 
  While not IsEvent do 
    Begin      
      {czyszczenie} 
      DrawAll(1,last,TheWorld,200,255,255); 
      {przesuwanie} 
      RandomMove(1,Last,TheWorld); 
      {rysowanie na nowych pozycjach} 
      DrawAll(1,last,TheWorld,0,0,0); 
      {Opis na ekranie i w pliku} 
      Step:=Step+1;        
      MDist:=MeanDistance(1,Last,TheWorld,Last div 10); 
      MoveTo(0,0);
      Writeln(step,' ',mDist:3:2); 
      Writeln(log,step,';',mDist); 
    end; 
 Writeln('The End');
 Close(log);
end.
