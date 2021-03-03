program czasteczki;
{lukasz teska
 piotr ratajski
 piotr wierzbicki
 andrzej misko
 ola matuszewska}

const promien_kola=100;
last=500;
promien_startu=10;
maxmove=5;

type particle=record
     x,y:integer;
end;

world=array[1..Last] of particle;

var x,y,licznik,liczone_czastki:integer;
theworld:world;
sredni_dystans:real;
log:text;

function distance(x1,y1,x2,y2:real):real; 

begin 
  distance:=sqrt(sqr(x1-x2)+sqr(y1-y2)); 
end; 

Function Inside(x,y:integer):boolean; 

Begin 
  Inside:=distance(x,y,100,100)<100; 
end; 

Procedure RandomPosition2(first,last:integer;Var W:world;x,y,r:integer); 
{inicjalizacja pozycji w kole o promieniu r} 

Var 
   i,rr:integer; 
   alfa:real; 
begin 
  for i:=first to last do 
    begin 
      rr:=random(r); 
      alfa:=random*2*pi; 
      W[i].x:=round(x+sin(alfa)*rr); 
      w[i].y:=round(y+cos(alfa)*rr); 
    end; 
end; 

Function czy_w_kole(first,last:integer;Var W:world):integer; 

Var 
   i,l:integer; 
begin 
  l:=0; 
  for i:=first to last do 
    if inside(W[i].x,W[i].y) then 
      l:=l+1; 
  czy_w_kole:=l; 
end; 

Procedure DrawColor(first,last:integer;Var W:world;r,g,b:integer); 
{rysowanie punktów w zadanym kolorze} 

var 
   i:integer; 
Begin 
  Pen(2,r,g,b); 
  For i:=first to last do 
    if inside(W[i].x,W[i].y) then 
    
      Point(W[i].x,W[i].y); 
end; 

Procedure RandomMove(first,last:integer;Var W:world); 

Var 
   i,dx,dy:integer; 
Begin 
  For i:=first to last do 
    Begin 
      dx:=MaxMove div 2 - random(MaxMove); 
      dy:=MaxMove div 2 - random(MaxMove); 
      W[i].x:=W[i].x+dx; 
      W[i].y:=W[i].y+dy; 
    end; 
end; 



Function MeanDistance(first,last:integer;Var W:world):real; 

Var 
   i:integer; 
   dist,summ:real; 
Begin 
  summ:=0; 
  for i:=1 to last do 
    begin 
      dist:=distance(W[i].x,W[i].y,100,100); 
      summ:=summ+dist; 
    end; 
  if last>0 then 
    MeanDistance:=summ/last 
  else 
    MeanDistance:=-9999; 
end; 

begin 
 
  Assign(log,'out.txt'); 
  Rewrite(log); 
  

  RandomPosition2(1,Last,TheWorld,100,100,promien_startu); 
  DrawColor(1,last,theworld,0,0,0); 
  licznik:=0; 
  liczone_czastki:=0; 
  sredni_dystans:=0; 
  while not isEvent do 
    begin 
    
      ellipse(0,0,200,200); 
      delay(1);
      DrawColor(1,last,theworld,255, 255, 255); 
      RandomMove(1,last,theworld); 
      DrawColor(1,last,theworld,0,0,0); 
      liczone_czastki:=czy_w_kole(1,Last,TheWorld); 
      sredni_dystans:=MeanDistance(1,Last,TheWorld); 
      moveto(0,200);
      licznik:=licznik+1; 
      writeln('***************************************');
      writeln('* Liczba liczonych czasteczek:   ', liczone_czastki,'  *'); 
      writeln('* Srednia odleglosc od srodka    ',sredni_dystans:3:2,'*'); 
      writeln('***************************************');
      
      Writeln(log,'Krok ', licznik,'-> ',liczone_czastki,'   ',sredni_dystans:3:2); 
    end; 
    Close(log); 
end.
