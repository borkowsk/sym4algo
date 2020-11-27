Program Flock4; 
{Zbli¿anie siê i upodoabnianie prêdkoœci - BARDZO TO JU¯ SKOMPLIKOWANE}
Const 
   init_r=250;   {Promieñ pocz¹tkowego ko³a}
   Last=600;     {Ile cz¹steczek}
   Width=500; 
   Height=500; 
   MaxMove=0.9;  {Wspó³czynnik losowej zmiany predkosci 0..1} 
   RConst=0.5;   {Wspolczynnik zblizania predkosci 1..20}
   VConst=15;    {Wspolczynnik zblizania pozycji 1..20}
   CConst=15;
   
Type 
   {Typ rekordowy definiujacy cz¹steczkê}
   particle=record 
        x,y,vx,vy:real;         
   end; 
   
   {Typ tablicowy dla "Œwiata" cz¹steczek}
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

Procedure RandomVelocity(first,last:integer;Var W:World); 
{Inicjalizacja pozycji}
Var 
   i:integer; 
Begin 
  For i:=first to last do 
    Begin 
      W[i].vx:=MaxMove/2 - random*MaxMove; 
      W[i].vy:=MaxMove/2 - random*MaxMove; 
    end; 
end; 

Procedure DrawAll(first,last:integer;Var W:World;r,g,b:integer); 
{Rysowanie punktów w zadanym kolorze}
Var 
   i:integer; 
Begin 
  Pen(1,r,g,b); 
  For i:=first to last do 
    Point(round(W[i].x),round(W[i].y)); 
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
   else if x>0 then
        Sign:=1
        else
        Sign:=0;
end;

Function Distance(x1,y1,x2,y2:real):real;
begin
Distance:=sqrt(sqr(x1-x2)+sqr(y1-y2));
end;

Procedure VelocityChange(first,last:integer;Var W:World); 
{Losowe przemieszczanie}
Var 
   i,z,p:integer; 
   d:real;
Begin 
  {Ustalenie dlugosci badanego zakresu}
  z:=last-first;
  For i:=first to last do 
    Begin 
    {Wylosowanie cz¹steczki do zblizenia}
    p:=first+random(z);   
    {odleglosc}
    d:=Distance(W[i].x,W[i].y,W[p].x,W[p].y);
    if d>0 then
      begin
      {Upodobnienie predkosci cz¹steczki i do czasteczki p}
      W[i].vx:=W[i].vx-VConst/d*Sign(W[i].vx-W[p].vx);
      W[i].vy:=W[i].vy-VConst/d*Sign(W[i].vy-W[p].vy);
      {Przyblizenie cz¹steczki i do czasteczki p}
      W[i].vx:=W[i].vx-CConst/d*Sign(W[i].x-W[p].x);
      W[i].vy:=W[i].vy-CConst/d*Sign(W[i].y-W[p].y);
      end;
    {Losowa modyfikacja predkosci}
    W[i].vx:=W[i].vx+RConst*(0.5-random);
    W[i].vy:=W[i].vy+RCOnst*(0.5-random);
    end; 
end; 

Function MeanDistance(first,last:integer;Var W:World;N:integer):real;
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
   TheWorld:World; 
   Step:integer; 

Begin 
  Randomize(10); {Jak jest tak zainicjowany generator to zawsze taki sam przebieg!!!}
  {INICJALIZACJA} 
  If init_r>0 then
     RandomPosition2(1,Last,TheWorld,Width div 2,Height div 2,init_r)
     else
     RandomPosition1(1,Last,TheWorld); 
  RandomVelocity(1,Last,TheWorld); 
  DrawAll(1,last,TheWorld,0,0,0); 
  
  {PÊTLA SYMULACJI} 
  Step:=0; 
  While not IsEvent do 
    Begin      
      {czyszczenie} 
      DrawAll(1,Last div 2,TheWorld,250,255,0); 
      DrawAll(Last div 2 + 1,Last,TheWorld,255,200,250); 
      VelocityChange(1,Last div 2,TheWorld); 
      VelocityChange(Last div 2 + 1,Last,TheWorld);
      {przesuwanie} 
      VelocityMove(1,Last,TheWorld); 
      {rysowanie na nowych pozycjachRandomMove(1,Last,TheWorld);} 
      DrawAll(1,Last div 2,TheWorld,25,25,0); 
      DrawAll(Last div 2 + 1,Last,TheWorld,50,0,50); 
      {Opis na ekranie} 
      Step:=Step+1; 
      MoveTo(0,0); 
      Write(Step,' ',MeanDistance(1,Last,TheWorld,Last div 10) :3:2); 
    end; 
end.
